import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/form/form_control.dart';
import 'package:adoption_app/app/core/form/form_model.dart';
import 'package:adoption_app/app/core/form/form_validators.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/core/models/user_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginController extends GetxController {
  OauthService oauthService = OauthService();
  FormControl loginForm = FormControl(form: {
    "email": FormModel(value: '', validators: [FormValidators().isRequired]),
    "password": FormModel(value: '', validators: [FormValidators().isRequired]),
  });

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  login() async {
    if (loginForm.validate()) {
      Box<UserModel> box = Hive.box<UserModel>('user');
      box.clear();

      ResponseModel response = await oauthService.login(loginForm.toJson());

      if (response.error) {
        Get.snackbar("Error", response.message!);

        return;
      }

      await box.add(response.result);

      Get.offAllNamed(AppRoutes.main);
    }
  }
}
