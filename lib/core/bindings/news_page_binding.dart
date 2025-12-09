import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tabnewsnc/modules/news/news_datasource.dart';
import 'package:tabnewsnc/modules/news/news_repository.dart';
import 'package:tabnewsnc/modules/news/news_usecases.dart';
import 'package:tabnewsnc/modules/news/presentation/news_page_controller.dart';

class NewsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<NewsRepository>(
        () => NewsRepositoryImpl(
          datasource: NewsDatasourceImpl(
            dio: Get.find<Dio>(),
          ),
        ),
      )
      ..lazyPut<NewsUsecases>(
        () => NewsUsecasesImpl(
          repository: Get.find<NewsRepository>(),
        ),
      )
      ..lazyPut(NewsPageController.new);
  }
}
