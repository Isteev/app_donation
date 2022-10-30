import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/form/form_control.dart';
import 'package:adoption_app/app/core/form/form_model.dart';
import 'package:adoption_app/app/core/form/form_validators.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/core/models/select_model.dart';
import 'package:adoption_app/app/core/models/user_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterController extends GetxController {
  OauthService oauthService = OauthService();
  GlobalController globalController = Get.find();

  List<SelectModel> itemsDocType = [];
  List<SelectModel> itemsCities = [];
  List<SelectModel> itemsLoaclities = [];

  @override
  void onInit() {
    super.onInit();

    itemsDocType = globalController.docTypes
        .map((e) => SelectModel(id: e.id.toString(), value: e.externalCode))
        .toList();

    itemsCities = globalController.cities
        .map((e) => SelectModel(id: e.id.toString(), value: e.name))
        .toList();
  }

  FormControl registerForm = FormControl(form: {
    "first_name":
        FormModel(value: '', validators: [FormValidators().isRequired]),
    "last_name":
        FormModel(value: '', validators: [FormValidators().isRequired]),
    "email": FormModel(value: '', validators: [FormValidators().isRequired]),
    "password": FormModel(value: '', validators: [FormValidators().isRequired]),
    "password2":
        FormModel(value: '', validators: [FormValidators().isRequired]),
    "document_number":
        FormModel(value: '', validators: [FormValidators().isRequired]),
    "document_type_id":
        FormModel(value: '', validators: [FormValidators().isRequired]),
    "city_id": FormModel(value: '', validators: [FormValidators().isRequired]),
    "locality_id":
        FormModel(value: '', validators: [FormValidators().isRequired]),
    "country_id": FormModel(value: '1', validators: []),
  });

  register() async {
    if (registerForm.validate()) {
      if (registerForm.form["password"]!.value !=
          registerForm.form["password2"]!.value) {
        validatePass();
        return;
      }

      ResponseModel<UserModel> response =
          await oauthService.register(registerForm.toJson());

      if (response.error) {
        Get.snackbar("Error", response.message!);
        return;
      }

      Box<UserModel> box = Hive.box<UserModel>('user');
      box.clear();

      await box.add(response.result!);

      Get.offAllNamed(AppRoutes.main);
    }
  }

  getLocalities(int id) {
    itemsLoaclities = globalController.localities
        .where((element) => element.cityId == id)
        .map((e) => SelectModel(id: e.id.toString(), value: e.name))
        .toList();

    update(['localities']);
  }

  validatePass() {
    registerForm.form["password"]!.error.add("Contraseñas no coinciden");
    registerForm.form["password2"]!.error.add("Contraseñas no coinciden");
    registerForm.errors.value.add(registerForm.form["password"]!.error);
    Get.snackbar("error", "Dudoso!! Contraseñas no coinciden");
  }
}
