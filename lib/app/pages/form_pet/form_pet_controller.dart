import 'package:adoption_app/app/core/api/pets_service.dart';
import 'package:adoption_app/app/core/form/form_control.dart';
import 'package:adoption_app/app/core/form/form_model.dart';
import 'package:adoption_app/app/core/form/form_validators.dart';
import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/core/models/select_model.dart';
import 'package:get/get.dart';

class FormPetsController extends GetxController {
  GlobalController globalController = Get.find();

  PetsServices petsServices = PetsServices();

  late List<SelectModel> petsType;
  late List<SelectModel> genderSelect;
  late List<SelectModel> ageSelect;

  List<SelectModel> breeds = [];

  FormControl petsForm = FormControl(form: {
    'name': FormModel(value: "", validators: [FormValidators().isRequired]),
    'age': FormModel(value: "", validators: [FormValidators().isRequired]),
    'gender': FormModel(value: "", validators: [FormValidators().isRequired]),
    'weight': FormModel(value: "10", validators: [FormValidators().isRequired]),
    'breed_id': FormModel(value: "", validators: [FormValidators().isRequired]),
    'user_id': FormModel(value: "", validators: []),
    'pet_type_id':
        FormModel(value: "", validators: [FormValidators().isRequired]),
  });

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
    petsForm.form["user_id"]!.value =
        globalController.user.getAt(0)!.id.toString();
    if (petsForm.validate()) {
      ResponseModel response = await petsServices.createPet(petsForm.getValues());

      if (response.error) {
        Get.snackbar('error', response.message!);
        return;
      }

      print(response.result);
    }
  }
}
