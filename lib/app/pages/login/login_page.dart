import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              200.verticalSpace,
              Text('logo'),
              300.verticalSpace,
              CustomInput(
                placeholder: "Correo",
                onChage: (val) => {},
              ),
              20.verticalSpace,
              CustomInput(
                placeholder: "Contraseña",
                onChage: (val) => {},
              ),
              const Spacer(),
              CustomButton(
                label: 'Iniciar Sesion',
                onTap: () {
                  Get.offNamed(AppRoutes.home);
                },
              ),
              20.verticalSpace,
              CustomButton(
                label: 'Registrarse',
                textColor: Colors.black,
                backGround: Colors.grey.withOpacity(0.2),
                onTap: () {
                  Get.offNamed(AppRoutes.register);
                },
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
