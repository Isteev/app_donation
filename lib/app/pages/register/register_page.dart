import 'package:adoption_app/app/pages/register/register_controller.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:adoption_app/app/widgets/custom_icon.dart';
import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:adoption_app/app/widgets/custom_select.dart';
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
        child: GetBuilder<RegisterController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              const CustomIcon(),
              const Spacer(),
              Text(
                "Registrate",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 80.r,
                    fontWeight: FontWeight.w600),
              ),
              70.verticalSpace,
              CustomInput(
                  placeholder: "Nombres",
                  onChage: (val) {
                    _.firstName = val;
                  }),
              20.verticalSpace,
              CustomInput(
                  placeholder: "Apellidos",
                  onChage: (val) {
                    _.lastName = val;
                  }),
              20.verticalSpace,
              Row(
                children: [
                  CustomSelect(
                    placeholder: "Tipo",
                    items: _.itemsDocType,
                    onSelected: (val) {
                      _.documentType = val;
                    },
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: CustomInput(
                        placeholder: "N° documento",
                        onChage: (val) {
                          _.documentNumber = val;
                        }),
                  ),
                ],
              ),
              20.verticalSpace,
              CustomInput(
                  placeholder: "Correo",
                  onChage: (val) {
                    _.email = val;
                  }),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: CustomSelect(
                    items: _.itemsCities,
                    placeholder: "Ciudad",
                    onSelected: (val) {
                      _.getLocalities(int.parse(val));
                    },
                  )),
                  20.horizontalSpace,
                  GetBuilder<RegisterController>(
                      id: "localities",
                      builder: (_) {
                        return Expanded(
                            child: CustomSelect(
                          items: _.itemsLoaclities,
                          placeholder: "Localidad",
                          onSelected: (val) {},
                        ));
                      })
                ],
              ),
              20.verticalSpace,
              CustomInput(
                placeholder: "Contraseña",
                onChage: (val) {
                  _.password = val;
                },
                pass: true,
              ),
              20.verticalSpace,
              CustomInput(
                placeholder: "Validar contraseña",
                onChage: (val) {
                  _.password2 = val;
                },
                pass: true,
              ),
              const Spacer(),
              CustomButton(
                  label: 'Registar',
                  onTap: () {
                    _.register();
                  }),
              100.verticalSpace,
            ],
          );
        }),
      )),
    );
  }
}
