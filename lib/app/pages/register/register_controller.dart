import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/core/models/user_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterController extends GetxController {
  OauthService oauthService = OauthService();

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String password2 = "";
  String documentNumber = "";

  register() async {
    if (password != password2) {
      Get.snackbar("error", "Dudoso!! Contraseñas no coinciden");
      return;
    }

    UserModel user = UserModel(
        documentNumber: documentNumber,
        firstName: firstName,
        lastName: lastName,
        email: email,
        localityId: 1,
        cityId: 1,
        countryId: 1,
        documentTypeId: 1);

    ResponseModel response = await oauthService.register(user.toJson(), password);

    if (response.error) {
      Get.snackbar("Error", response.message!);
      print(response.message);

      return;
    }

    Get.offAllNamed(AppRoutes.home);
  }
}
