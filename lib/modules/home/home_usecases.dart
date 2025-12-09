import 'package:tabnewsnc/core/domain/entities/news_entity.dart';
import 'package:tabnewsnc/core/domain/enums/news_filter_enum.dart';
import 'package:tabnewsnc/modules/home/home_repository.dart';

abstract class HomeUsecases {
  Future<List<NewsEntity>> getAll({required NewsFilterEnum filter});
}

class HomeUsecasesImpl implements HomeUsecases {
  const HomeUsecasesImpl({required this.repository});

  final HomeRepository repository;

  @override
  Future<List<NewsEntity>> getAll({required NewsFilterEnum filter}) async {
    final news = await repository.getAll(filter: filter);
    return news;
  }
}
