import 'package:adoption_app/app/core/api/pets_service.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/pet_model.dart';
import 'package:adoption_app/app/core/models/select_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class FormPetsController extends GetxController {
  GlobalController globalController = Get.find();

  PetsServices petsServices = PetsServices();

  late List<SelectModel> petsType;
  late List<SelectModel> genderSelect;
  late List<SelectModel> ageSelect;

  List<SelectModel> breeds = [];

  String name = "";
  String age = "";
  String gender = "";
  String breed = "";
  String petType = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intiValues();
  }

  intiValues() {
    petsType = globalController.petsType
        .map((e) => SelectModel(id: e.id.toString(), value: e.name))
        .toList();

    genderSelect = [
      SelectModel(id: "F", value: "Hembra"),
      SelectModel(id: "M", value: "Macho"),
    ];

    ageSelect = [
      SelectModel(id: "0", value: "Menor a un año"),
      SelectModel(id: "1", value: "Un año"),
      SelectModel(id: "2", value: "Dos años"),
      SelectModel(id: "3", value: "Tres años"),
      SelectModel(id: "4", value: "cuatro años"),
      SelectModel(id: "5", value: "Mas"),
    ];
  }

  getBreeds(id) {
    breeds = globalController.breeds
        .where((element) => element.petTypeId == id)
        .map((e) => SelectModel(id: e.id.toString(), value: e.name))
        .toList();

    update(['breeds']);
  }

  createPet() async {
    PetModel pet = PetModel(
        name: name,
        age: int.parse(age),
        gender: gender,
        weight: 10,
        breedId: int.parse(breed),
        userId: 1,
        petTypeId: int.parse(petType));

    await petsServices.createPet(pet.toJson());
  }
}
