import 'package:adoption_app/app/core/api/cities_service.dart';
import 'package:adoption_app/app/core/api/oauth.dart';
import 'package:adoption_app/app/core/api/pets_service.dart';
import 'package:adoption_app/app/core/models/breeds_model.dart';
import 'package:adoption_app/app/core/models/cities_model.dart';
import 'package:adoption_app/app/core/models/document_type_model.dart';
import 'package:adoption_app/app/core/models/localities_model.dart';
import 'package:adoption_app/app/core/models/pets_type_model.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/core/models/user_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GlobalController extends GetxController {
  OauthService oauthService = OauthService();
  CitiesService citiesService = CitiesService();
  PetsServices petsServices = PetsServices();

  Box<UserModel> user = Hive.box<UserModel>('user');

  List<DocumentTypeModel> docTypes = [];
  List<CitiesModel> cities = [];
  List<LoaclitiesModel> localities = [];
  List<PetsTypesModel> petsType = [];
  List<BreedsModel> breeds = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDocumentTypes();
    getCities();
    getLoacalities();
    getPetsType();
    getBreeds();
  }

  getDocumentTypes() async {
    ResponseModel response = await oauthService.getDocumentType();
    if (!response.error) {
      docTypes = response.result;
    }
  }

  getCities() async {
    ResponseModel<List<CitiesModel>> response = await citiesService.getCities();
    if (!response.error) {
      cities = response.result!;
    }
  }

  getLoacalities() async {
    ResponseModel<List<LoaclitiesModel>> response =
        await citiesService.getLocalities();
    if (!response.error) {
      localities = response.result!;
    }
  }

  getPetsType() async {
    ResponseModel<List<PetsTypesModel>> response =
        await petsServices.getPetsType();
    if (!response.error) {
      petsType = response.result!;
    }
  }

  getBreeds() async {
    ResponseModel<List<BreedsModel>> response = await petsServices.getBreeds();
    if (!response.error) {
      breeds = response.result!;
    }
  }
}
