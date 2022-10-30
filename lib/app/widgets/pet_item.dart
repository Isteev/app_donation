import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/pet_model.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PetsItem extends StatelessWidget {
  const PetsItem({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    RxInt current = 1.obs;
    RxBool showCount = false.obs;

    chanPage(index) {
      current.value = index + 1;
      showCount.value = true;
      Future.delayed(const Duration(milliseconds: 700), () {
        showCount.value = false;
      });
    }

    return GestureDetector(
      onTap: () {
        Get.offNamed(AppRoutes.pet, id: 12, arguments: pet);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50).r,
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 0),
                  spreadRadius: 0.5,
                  blurRadius: 2),
            ]),
        padding: const EdgeInsets.all(55).r,
        margin: const EdgeInsets.only(bottom: 30).r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 38.r),
                    ),
                    Text(
                      getBreed(pet.breedId),
                      style: TextStyle(
                          color: const Color(0xFF888687), fontSize: 30.r),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/icons/like.svg")
              ],
            ),
            20.verticalSpace,
            Stack(
              children: [
                CarouselSlider(
                    items: pet.petImages.map((e) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: e.url,
                                fit: BoxFit.cover,
                              )),
                        ],
                      );
                    }).toList(),
                    options: CarouselOptions(
                      initialPage: current.value - 1,
                      height: 600.r,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) => chanPage(index),
                    )),
                Positioned(
                    bottom: 25.r,
                    right: 25.r,
                    child: Obx(() {
                      return AnimatedOpacity(
                        opacity: showCount.value ? 1 : 0,
                        duration: const Duration(milliseconds: 150),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.cyan[200]!.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20).r),
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15)
                                .r,
                            child: Text(
                              '$current/${pet.petImages.length}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.r,
                                  letterSpacing: 3.r,
                                  fontWeight: FontWeight.w800),
                            )),
                      );
                    }))
              ],
            )
          ],
        ),
      ),
    );
  }

  getBreed(idBreed) {
    GlobalController globalController = Get.find();
    return globalController.breeds
        .firstWhere((element) => element.id == idBreed.toString())
        .name;
  }
}
