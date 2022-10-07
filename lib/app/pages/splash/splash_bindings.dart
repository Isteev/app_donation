import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/pages/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());

  }
}
