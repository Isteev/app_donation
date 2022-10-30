import 'package:adoption_app/app/core/models/user_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileController extends GetxController {
  logOut() {
    Hive.box<UserModel>('user').clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
