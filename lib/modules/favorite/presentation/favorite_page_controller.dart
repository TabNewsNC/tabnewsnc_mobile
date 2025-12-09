import 'package:get/get.dart';
import 'package:tabnewsnc/core/domain/entities/favorite_entity.dart';
import 'package:tabnewsnc/modules/favorite/favorite_usecases.dart';

class FavoritePageController extends GetxController {
  final FavoriteUsecases _favoriteUsecases = Get.find<FavoriteUsecases>();

  final Rx<bool> _isLoading = Rx(false);
  final Rx<List<FavoriteEntity>> _favorites = Rx([]);

  bool get isLoading => _isLoading.value;
  List<FavoriteEntity> get favorites => _favorites.value;

  @override
  Future<void> onReady() async {
    super.onReady();
    await load();
  }

  Future<void> remove(String id) async {
    try {
      _isLoading.value = true;

      await _favoriteUsecases.remove(id);
      await load();
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> load() async {
    try {
      _isLoading.value = true;

      final data = await _favoriteUsecases.getAll();
      _favorites.value = data;
    } finally {
      _isLoading.value = false;
    }
  }
}
