import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tabnewsnc/modules/home/home_datasource.dart';
import 'package:tabnewsnc/modules/home/home_repository.dart';
import 'package:tabnewsnc/modules/home/home_usecases.dart';
import 'package:tabnewsnc/modules/home/presentation/home_page_controller.dart';

class HomePageBinding implements Bindings {
  const HomePageBinding();

  @override
  void dependencies() {
    Get
      ..lazyPut<HomeUsecases>(
        fenix: true,
        () => HomeUsecasesImpl(
          repository: HomeRepositoryImpl(
            datasource: HomeDatasourceImpl(
              dio: Get.find<Dio>(),
            ),
          ),
        ),
      )
      ..lazyPut(HomePageController.new, fenix: true);
  }
}
