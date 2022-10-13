import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  GlobalController globalController = Get.find();

  @override
  void onInit() async {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 500), () {
      globalController.user.values.isEmpty ?
      Get.offNamed(AppRoutes.login): Get.offNamed(AppRoutes.main);
    });
  }
}
