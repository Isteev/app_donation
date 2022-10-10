import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/core/models/select_model.dart';
import 'package:adoption_app/app/core/models/user_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

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

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String password2 = "";
  String documentNumber = "";
  String documentType = "";

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

    ResponseModel response =
        await oauthService.register(user.toJson(), password);

    if (response.error) {
      Get.snackbar("Error", response.message!);
      return;
    }

    Get.offAllNamed(AppRoutes.main);
  }

  getLocalities(int id) {
    itemsLoaclities = globalController.localities
        .where((element) => element.cityId == id)
        .map((e) => SelectModel(id: e.id.toString(), value: e.name))
        .toList();

    update(['localities']);
  }
}
