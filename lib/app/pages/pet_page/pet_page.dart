import 'package:adoption_app/app/core/models/pet_model.dart';
import 'package:adoption_app/app/pages/pet_page/pet_controller.dart';
import 'package:adoption_app/app/pages/pet_page/widget/pet_images_slider.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:adoption_app/app/widgets/custom_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PetPage extends StatelessWidget {
  const PetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PetController>(builder: (_) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(100).r,
                        bottomRight: const Radius.circular(100).r),
                    color: const Color(0xFFf9f9f9),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 5),
                          spreadRadius: 0.5,
                          blurRadius: 2),
                    ]),
                padding:
                    const EdgeInsets.only(left: 80, right: 80, bottom: 50).r,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomIcon(
                          onTap: () {
                            Get.offNamed(AppRoutes.home, id: 12);
                          },
                        ),
                        Expanded(
                          child: Text(
                            _.pet.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 50.w,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        85.horizontalSpace
                      ],
                    ),
                    20.verticalSpace,
                    const PetImagesSlider(),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
