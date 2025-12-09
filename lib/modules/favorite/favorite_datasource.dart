import 'package:tabnewsnc/core/drivers/storage_driver.dart';

abstract class FavoriteDatasource {
  Future<List<Map<String, dynamic>>> getAll();
  Future<Map<String, dynamic>?> getOne(String key);
  Future<void> add(String key, Map<String, dynamic> data);
  Future<void> remove(String key);
}

class FavoriteDatasourceImpl implements FavoriteDatasource {
  const FavoriteDatasourceImpl({required this.driver});

  static const box = 'favorites';
  final StorageDriver driver;

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    final data = await driver.getAll(box);
    return data;
  }

  @override
  Future<Map<String, dynamic>?> getOne(String key) async {
    final data = await driver.getOne(box, key);
    return data;
  }

  @override
  Future<void> add(String key, Map<String, dynamic> data) async {
    final favorite = await driver.getOne(box, key);
    if (favorite == null) await driver.create(box, key, data);
  }

  @override
  Future<void> remove(String key) async {
    final favorite = await driver.getOne(box, key);
    if (favorite != null) await driver.delete(box, key);
  }
}
