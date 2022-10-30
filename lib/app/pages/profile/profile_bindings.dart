import 'package:adoption_app/app/pages/profile/profile_controller.dart';
import 'package:get/instance_manager.dart';

class ProfileBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
