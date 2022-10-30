import 'package:adoption_app/app/core/api/pets_service.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/pet_model.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalController globalController = Get.find();
  PetsServices petsServices = PetsServices();

  List<PetModel> pets = [];
  RxBool loading = true.obs;
  RxInt type = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getPets();
  }

  getPets() async {
    loading.value = true;
    ResponseModel<List<PetModel>> response =
        await petsServices.getPets({'type': type > 0 ? type.value : null});

    if (response.message == "percho") {
      pets = response.result!;
    }

    loading.value = false;
  }
}
