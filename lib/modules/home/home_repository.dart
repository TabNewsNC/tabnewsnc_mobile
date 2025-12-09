import 'package:tabnewsnc/core/domain/entities/news_entity.dart';
import 'package:tabnewsnc/core/domain/enums/news_filter_enum.dart';
import 'package:tabnewsnc/modules/home/home_datasource.dart';

abstract class HomeRepository {
  Future<List<NewsEntity>> getAll({required NewsFilterEnum filter});
}

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required this.datasource});

  final HomeDatasource datasource;

  @override
  Future<List<NewsEntity>> getAll({required NewsFilterEnum filter}) async {
    final news = await datasource.getAll(strategy: filter.value);
    return news
        .map((e) => NewsEntityMapper.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
