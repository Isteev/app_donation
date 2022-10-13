import 'package:adoption_app/app/pages/register/register_controller.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:adoption_app/app/widgets/custom_icon.dart';
import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:adoption_app/app/widgets/custom_select.dart';
import 'package:adoption_app/app/widgets/form_builder.dart';
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
        child: GetBuilder<RegisterController>(
            id: "form_register",
            builder: (_) {
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
                  FormBuilder(
                      formControl: _.registerForm,
                      builder: (form) {
                        return Column(
                          children: [
                            CustomInput(
                                placeholder: "Nombres",
                                form: form['first_name'],
                                onChage: (val) {
                                }),
                            20.verticalSpace,
                            CustomInput(
                                placeholder: "Apellidos",
                                form: form['last_name'],
                                onChage: (val) {
                                }),
                            20.verticalSpace,
                            Row(
                              children: [
                                CustomSelect(
                                  placeholder: "Tipo",
                                  items: _.itemsDocType,
                                  form: form['document_type_id'],
                                  onSelected: (val) {
                                  },
                                ),
                                20.horizontalSpace,
                                Expanded(
                                  child: CustomInput(
                                      placeholder: "N° documento",
                                      form: form['document_number'],
                                      onChage: (val) {
                                      }),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            CustomInput(
                                placeholder: "Correo",
                                form: form['email'],
                                onChage: (val) {
                                }),
                            20.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                    child: CustomSelect(
                                  items: _.itemsCities,
                                  placeholder: "Ciudad",
                                  form: form['city_id'],
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
                                        form: form['locality_id'],
                                        onSelected: (val) {},
                                      ));
                                    })
                              ],
                            ),
                            20.verticalSpace,
                            CustomInput(
                              placeholder: "Contraseña",
                              form: form['password'],
                              onChage: (val) {
                              },
                              pass: true,
                            ),
                            20.verticalSpace,
                            CustomInput(
                              placeholder: "Validar contraseña",
                              form: form['password2'],
                              onChage: (val) {
                              },
                              pass: true,
                            ),
                          ],
                        );
                      }),
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
