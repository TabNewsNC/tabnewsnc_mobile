import 'package:get/get.dart';
import 'package:tabnewsnc/modules/root/root_page_controller.dart';

class RootPageBinding implements Bindings {
  const RootPageBinding();

  @override
  void dependencies() {
    Get.lazyPut(RootPageController.new);
  }
}
