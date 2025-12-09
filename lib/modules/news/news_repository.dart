import 'package:tabnewsnc/core/domain/entities/news_entity.dart';
import 'package:tabnewsnc/modules/news/news_datasource.dart';

abstract class NewsRepository {
  Future<NewsEntity?> getOne({
    required String user,
    required String slug,
  });
  Future<List<NewsEntity>> getComments({
    required String user,
    required String slug,
  });
}

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl({required this.datasource});

  final NewsDatasource datasource;

  @override
  Future<NewsEntity?> getOne({
    required String user,
    required String slug,
  }) async {
    final news = await datasource.getOne(user: user, slug: slug);
    return news;
  }

  @override
  Future<List<NewsEntity>> getComments({
    required String user,
    required String slug,
  }) async {
    final comments = await datasource.getComments(user: user, slug: slug);
    return comments;
  }
}
