import 'package:adoption_app/app/pages/form_pet/form_pet_controller.dart';
import 'package:adoption_app/app/widgets/custom_button.dart';
import 'package:adoption_app/app/widgets/custom_icon.dart';
import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:adoption_app/app/widgets/custom_select.dart';
import 'package:adoption_app/app/widgets/form_builder.dart';
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
                50.verticalSpace,
                AddImagesFormPet(
                  controller: _,
                ),
                40.verticalSpace,
                FormBuilder(
                    formControl: _.petsForm,
                    builder: (form) {
                      return Column(
                        children: [
                          CustomInput(
                              placeholder: "nombre",
                              form: form['name']!,
                              onChage: (val) {}),
                          20.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                  child: CustomSelect(
                                items: _.petsType,
                                placeholder: "Mascota",
                                form: form['pet_type_id'],
                                onSelected: (val) {
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
                                      form: form['breed_id'],
                                      onSelected: (val) {},
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
                                form: form['gender'],
                                onSelected: (val) {},
                              )),
                              20.horizontalSpace,
                              Expanded(
                                  child: CustomSelect(
                                items: _.ageSelect,
                                placeholder: "Edad",
                                form: form['age'],
                                onSelected: (val) {},
                              ))
                            ],
                          ),
                        ],
                      );
                    }),
                const Spacer(),
                CustomButton(
                    label: "Agregar",
                    loading: _.loading,
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

class AddImagesFormPet extends StatelessWidget {
  const AddImagesFormPet({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final FormPetsController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Row(
          children: [
            Obx(() {
              return Row(
                children: controller.images
                    .map((image) => Container(
                          height: 450.r,
                          width: 350.r,
                          margin: const EdgeInsets.only(
                                  right: 35, top: 20, bottom: 20)
                              .r,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30).r,
                              border:
                                  Border.all(color: Colors.white, width: 15.r),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                    spreadRadius: 1,
                                    blurRadius: 5),
                                BoxShadow(
                                    color: Color(0xFFf9f9f9),
                                    offset: Offset(0, 30),
                                    spreadRadius: 1,
                                    blurRadius: 20),
                              ]),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30).r,
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                                frameBuilder: (context, child, frame,
                                    wasSynchronouslyLoaded) {
                                  if (frame == null) {
                                    return Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child:
                                            const CircularProgressIndicator());
                                  }
                                  return child;
                                },
                              )),
                        ))
                    .toList(),
              );
            }),
            GestureDetector(
              onTap: () {
                controller.imagePiker();
              },
              child: Container(
                height: 450.r,
                width: 350.r,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30).r),
                alignment: Alignment.center,
                child: Text("agregar imagen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
