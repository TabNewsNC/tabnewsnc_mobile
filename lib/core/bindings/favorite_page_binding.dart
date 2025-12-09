import 'package:get/get.dart';
import 'package:tabnewsnc/core/drivers/storage_driver.dart';
import 'package:tabnewsnc/modules/favorite/favorite_datasource.dart';
import 'package:tabnewsnc/modules/favorite/favorite_repository.dart';
import 'package:tabnewsnc/modules/favorite/favorite_usecases.dart';
import 'package:tabnewsnc/modules/favorite/presentation/favorite_page_controller.dart';

class FavoritePageBinding implements Bindings {
  const FavoritePageBinding();

  @override
  void dependencies() {
    Get
      ..lazyPut<FavoriteUsecases>(
        fenix: true,
        () => FavoriteUsecasesImpl(
          repository: FavoriteRepositoryImpl(
            datasource: FavoriteDatasourceImpl(
              driver: Get.find<StorageDriver>(),
            ),
          ),
        ),
      )
      ..lazyPut(FavoritePageController.new, fenix: true);
  }
}
