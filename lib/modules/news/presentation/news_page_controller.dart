import 'package:get/get.dart';
import 'package:tabnews/core/domain/entities/favorite_entity.dart';
import 'package:tabnews/core/domain/entities/news_entity.dart';
import 'package:tabnews/core/mixin/dialog_mixin.dart';
import 'package:tabnews/modules/favorite/favorite_usecases.dart';
import 'package:tabnews/modules/favorite/presentation/favorite_page_controller.dart';
import 'package:tabnews/modules/news/news_usecases.dart';

class NewsPageController extends GetxController with DialogMixin {
  final NewsUsecases _newsUsecases = Get.find<NewsUsecases>();
  final FavoriteUsecases _favoriteUsecases = Get.find<FavoriteUsecases>();

  final FavoritePageController _favoritePageController = Get.find<FavoritePageController>();

  late String _id;
  late String _user;
  late String _slug;
  final Rx<NewsEntity?> _news = Rx(null);
  final Rx<bool> _isFavorite = Rx(false);
  final Rx<List<NewsEntity>> _comments = Rx([]);
  final Rx<bool> _isLoading = Rx(false);

  NewsEntity? get news => _news.value;
  bool get isFavorite => _isFavorite.value;
  List<NewsEntity> get comments => _comments.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _id = Get.parameters['id']!;
    _user = Get.parameters['user']!;
    _slug = Get.parameters['slug']!;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      _isLoading.value = true;

      final data = await Future.wait([
        _newsUsecases.getOne(user: _user, slug: _slug),
        _newsUsecases.getComments(user: _user, slug: _slug),
        _favoriteUsecases.exists(_id),
      ]);

      _news.value = data[0] as NewsEntity?;
      _comments.value = data[1] as List<NewsEntity>? ?? [];
      _isFavorite.value = data[2] as bool? ?? false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> favorite() async {
    if (_isFavorite.value) {
      await _favoriteUsecases.remove(_id);
    } else {
      final news = _news.value!.toMap();
      final favorite = FavoriteEntityMapper.fromMap(news);
      await _favoriteUsecases.add(favorite);
    }

    final exists = await _favoriteUsecases.exists(_id);
    _isFavorite.value = exists;

    await _favoritePageController.load();
  }

  Future<void> share() async {
    if (_news.value == null) return;

    final news = _news.value!;
    final path = '${news.ownerUsername}/${news.slug}';
    final uri = Uri.https('tabnews.com.br', path);
    await openShareDialog(uri: uri);
  }
}
