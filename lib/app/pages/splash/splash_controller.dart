import 'package:adoption_app/app/core/api/cities_service.dart';
import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/cities_model.dart';
import 'package:adoption_app/app/core/models/localities_model.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  OauthService oauthService = OauthService();
  CitiesService citiesService = CitiesService();

  GlobalController globalController = Get.find();

  @override
  void onInit() async {
    super.onInit();

    getDocumentTypes();
    getCities();
    getLoacalities();
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offNamed(AppRoutes.login);
    });
  }

  getDocumentTypes() async {
    ResponseModel response = await oauthService.getDocumentType();
    if (!response.error) {
      globalController.docTypes = response.result;
    }
  }

  getCities() async {
    ResponseModel<List<CitiesModel>> response = await citiesService.getCities();
    if (!response.error) {
      globalController.cities = response.result!;
    }
  }

  getLoacalities() async {
    ResponseModel<List<LoaclitiesModel>> response =
        await citiesService.getLocalities();
    if (!response.error) {
      globalController.localities = response.result!;
    }
  }
}
