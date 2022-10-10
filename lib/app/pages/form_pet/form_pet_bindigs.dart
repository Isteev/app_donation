import 'package:adoption_app/app/pages/form_pet/form_pet_controller.dart';
import 'package:get/instance_manager.dart';

class FormPetsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPetsController>(() => FormPetsController());
  }
}
