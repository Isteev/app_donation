import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 100).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profle'),
            40.verticalSpace,
            CustomButton(
                label: "Agregar Mascota",
                onTap: () {
                  Get.toNamed(AppRoutes.formPets);
                })
          ],
        ),
      ),
    );
  }
}
