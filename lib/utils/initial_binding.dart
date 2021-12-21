import 'package:clone_netflix/controllers/home_page_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController(), fenix: true);
  }
}
