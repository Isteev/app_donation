import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  OauthService oauthService = OauthService();

  String email = "";
  String pass = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  login() async {
    ResponseModel response =
        await oauthService.login({"email": email, "password": pass});

    if (response.error) {
      Get.snackbar("Error", response.message!);

      return;
    }

    Get.offAllNamed(AppRoutes.home);
  }
}
