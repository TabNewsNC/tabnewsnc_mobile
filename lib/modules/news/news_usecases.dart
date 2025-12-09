import 'package:tabnewsnc/core/domain/entities/news_entity.dart';
import 'package:tabnewsnc/modules/news/news_repository.dart';

abstract class NewsUsecases {
  Future<NewsEntity?> getOne({
    required String user,
    required String slug,
  });
  Future<List<NewsEntity>> getComments({
    required String user,
    required String slug,
  });
}

class NewsUsecasesImpl implements NewsUsecases {
  const NewsUsecasesImpl({required this.repository});

  final NewsRepository repository;

  @override
  Future<NewsEntity?> getOne({
    required String user,
    required String slug,
  }) async {
    final news = await repository.getOne(user: user, slug: slug);
    return news;
  }

  @override
  Future<List<NewsEntity>> getComments({
    required String user,
    required String slug,
  }) async {
    final comments = await repository.getComments(user: user, slug: slug);
    return comments;
  }
}
