import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              "Registrate",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 80.r,
                  fontWeight: FontWeight.w600),
            ),
            70.verticalSpace,
            CustomInput(placeholder: "Nombres", onChage: (val) {}),
            20.verticalSpace,
            CustomInput(placeholder: "Apellidos", onChage: (val) {}),
            20.verticalSpace,
            CustomInput(placeholder: "N° documento", onChage: (val) {}),
            20.verticalSpace,
            CustomInput(placeholder: "Correo", onChage: (val) {}),
            20.verticalSpace,
            CustomInput(placeholder: "Contraseña", onChage: (val) {}),
            20.verticalSpace,
            CustomInput(placeholder: "Validar contraseña", onChage: (val) {}),
            Spacer(),
            CustomButton(
                label: 'Registar',
                onTap: () {
                  Get.offNamed(AppRoutes.home);
                }),
            100.verticalSpace,
          ],
        ),
      )),
    );
  }
}
