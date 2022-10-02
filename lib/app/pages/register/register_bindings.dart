import 'package:adoption_app/app/pages/register/register_controller.dart';
import 'package:get/instance_manager.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
