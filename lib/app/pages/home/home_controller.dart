import 'package:adoption_app/app/core/api/pets_service.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/pet_model.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalController globalController = Get.find();
  PetsServices petsServices = PetsServices();

  List<PetModel> pets = [];
  bool loading = true;

  @override
  void onInit() {
    super.onInit();
    getPets();
  }

  getPets() async {
    ResponseModel<List<PetModel>> response = await petsServices.getPets();

    if (response.message == "percho") {
      pets = response.result!;
    }

    loading = false;
    update(['pets']);
  }
}
