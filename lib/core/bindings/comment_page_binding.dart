import 'package:get/get.dart';
import 'package:tabnewsnc/modules/comment/presentation/controllers/comment_page_controller.dart';

class CommentPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CommentPageController.new);
  }
}
