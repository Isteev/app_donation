import 'package:adoption_app/app/pages/pet_page/pet_controller.dart';
import 'package:get/instance_manager.dart';

class PetBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetController>(() => PetController());
  }
}
