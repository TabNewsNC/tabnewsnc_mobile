import 'package:dio/dio.dart';
import 'package:tabnewsnc/core/domain/entities/news_entity.dart';

abstract class NewsDatasource {
  Future<NewsEntity?> getOne({
    required String user,
    required String slug,
  });
  Future<List<NewsEntity>> getComments({
    required String user,
    required String slug,
  });
}

class NewsDatasourceImpl implements NewsDatasource {
  const NewsDatasourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<NewsEntity?> getOne({
    required String user,
    required String slug,
  }) async {
    final response = await dio.get<dynamic>('/contents/$user/$slug');

    final data = response.data as Map<String, dynamic>?;
    if (data != null) return NewsEntityMapper.fromMap(data);

    return null;
  }

  @override
  Future<List<NewsEntity>> getComments({
    required String user,
    required String slug,
  }) async {
    final response = await dio.get<dynamic>('/contents/$user/$slug/children');

    final data = response.data as List<dynamic>?;
    if (data != null) {
      return data
          .map((e) => NewsEntityMapper.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    return [];
  }
}
