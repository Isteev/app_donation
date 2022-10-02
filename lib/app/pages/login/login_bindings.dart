import 'package:adoption_app/app/pages/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBindigns implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
