import 'package:adoption_app/app/pages/form_pet/form_pet_controller.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:adoption_app/app/widgets/custom_icon.dart';
import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:adoption_app/app/widgets/custom_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FormPets extends StatelessWidget {
  const FormPets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 100).r,
          child: GetBuilder<FormPetsController>(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                const CustomIcon(),
                const Spacer(),
                Text(
                  "Agregar Mascota",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 70.r,
                      fontWeight: FontWeight.w600),
                ),
                70.verticalSpace,
                CustomInput(
                    placeholder: "nombre",
                    onChage: (val) {
                      _.name = val;
                    }),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                        child: CustomSelect(
                      items: _.petsType,
                      placeholder: "Mascota",
                      onSelected: (val) {
                        _.petType = val;
                        _.getBreeds(val);
                      },
                    )),
                    20.horizontalSpace,
                    GetBuilder<FormPetsController>(
                        id: "breeds",
                        builder: (_) {
                          return Expanded(
                              child: CustomSelect(
                            items: _.breeds,
                            placeholder: "Raza",
                            onSelected: (val) {
                              _.breed = val;
                            },
                          ));
                        })
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                        child: CustomSelect(
                      items: _.genderSelect,
                      placeholder: "Genero",
                      onSelected: (val) {
                        _.gender = val;
                      },
                    )),
                    20.horizontalSpace,
                    Expanded(
                        child: CustomSelect(
                      items: _.ageSelect,
                      placeholder: "Edad",
                      onSelected: (val) {
                        _.age = val;
                      },
                    ))
                  ],
                ),
                const Spacer(),
                CustomButton(
                    label: "Agregar",
                    onTap: () {
                      _.createPet();
                    }),
                100.verticalSpace,
              ],
            );
          }),
        ),
      ),
    );
  }
}
