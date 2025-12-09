import 'package:tabnewsnc/core/domain/entities/favorite_entity.dart';
import 'package:tabnewsnc/modules/favorite/favorite_repository.dart';

abstract class FavoriteUsecases {
  Future<bool> exists(String id);
  Future<List<FavoriteEntity>> getAll();
  Future<void> add(FavoriteEntity favorite);
  Future<void> remove(String id);
}

class FavoriteUsecasesImpl implements FavoriteUsecases {
  const FavoriteUsecasesImpl({required this.repository});

  final FavoriteRepository repository;

  @override
  Future<bool> exists(String id) async {
    final data = await repository.getOne(id);
    if (data != null) return true;
    return false;
  }

  @override
  Future<List<FavoriteEntity>> getAll() async {
    final data = await repository.getAll();
    return data;
  }

  @override
  Future<void> add(FavoriteEntity favorite) async {
    await repository.add(favorite);
  }

  @override
  Future<void> remove(String id) async {
    await repository.remove(id);
  }
}
