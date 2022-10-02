import 'package:adoption_app/app/pages/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBindigns implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
