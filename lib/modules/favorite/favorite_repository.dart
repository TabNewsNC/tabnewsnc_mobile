import 'package:tabnewsnc/core/domain/entities/favorite_entity.dart';
import 'package:tabnewsnc/modules/favorite/favorite_datasource.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteEntity>> getAll();
  Future<FavoriteEntity?> getOne(String id);
  Future<void> add(FavoriteEntity favorite);
  Future<void> remove(String id);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  const FavoriteRepositoryImpl({required this.datasource});

  final FavoriteDatasource datasource;

  @override
  Future<List<FavoriteEntity>> getAll() async {
    final data = await datasource.getAll();
    final favorites = data.map(FavoriteEntityMapper.fromMap);
    return favorites.toList();
  }

  @override
  Future<FavoriteEntity?> getOne(String id) async {
    final data = await datasource.getOne(id);
    if (data != null) return FavoriteEntityMapper.fromMap(data);
    return null;
  }

  @override
  Future<void> add(FavoriteEntity favorite) async {
    final key = favorite.id;
    final data = favorite.toMap();
    await datasource.add(key, data);
  }

  @override
  Future<void> remove(String id) async {
    await datasource.remove(id);
  }
}
