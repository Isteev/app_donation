import 'package:adoption_app/app/pages/login/login_controller.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:adoption_app/app/widgets/form_builder.dart';
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
          child: GetBuilder<LoginController>(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                200.verticalSpace,
                const Text('logo'),
                300.verticalSpace,
                FormBuilder(
                  formControl: _.loginForm,
                  builder: (form) {
                    return Column(
                      children: [
                        CustomInput(
                          placeholder: "Correo",
                          form: form['email'],
                          onChage: (val) {
                          },
                        ),
                        20.verticalSpace,
                        CustomInput(
                          placeholder: "Contraseña",
                          form: form['password'],
                          onChage: (val) {
                          },
                          pass: true,
                        ),
                      ],
                    );
                  },
                ),
                const Spacer(),
                CustomButton(
                  label: 'Iniciar Sesion',
                  onTap: () {
                    _.login();
                  },
                ),
                20.verticalSpace,
                CustomButton(
                  label: 'Registrarse',
                  textColor: Colors.black,
                  backGround: Colors.grey.withOpacity(0.2),
                  onTap: () {
                    Get.toNamed(AppRoutes.register);
                  },
                ),
                100.verticalSpace,
              ],
            );
          }),
        ),
      ),
    );
  }
}
