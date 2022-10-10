import 'package:adoption_app/app/core/api/cities_service.dart';
import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  GlobalController globalController = Get.find();

  @override
  void onInit() async {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offNamed(AppRoutes.login);
    });
  }
}
