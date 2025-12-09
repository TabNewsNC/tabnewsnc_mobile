import 'package:get/get.dart';
import 'package:tabnewsnc/core/domain/entities/news_entity.dart';

class CommentPageController extends GetxController {
  // vars
  late NewsEntity news;
  late NewsEntity comment;

  @override
  void onInit() {
    super.onInit();

    news = NewsEntityMapper.fromJson(Get.parameters['news']!);
    comment = NewsEntityMapper.fromJson(Get.parameters['comment']!);
  }
}
