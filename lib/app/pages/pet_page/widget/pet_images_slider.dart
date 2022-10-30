import 'package:adoption_app/app/pages/pet_page/pet_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PetImagesSlider extends StatelessWidget {
  const PetImagesSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt current = 0.obs;
    CarouselController imageController = CarouselController();
    CarouselController pointsController = CarouselController();

    return GetBuilder<PetController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
              items: _.pet.petImages.map((e) {
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
              carouselController: imageController,
              options: CarouselOptions(
                initialPage: current.value,
                height: 600.r,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  current.value = index;
                  pointsController.animateToPage(index);
                },
              )),
          20.verticalSpace,
          SizedBox(
            width: 200.r,
            child: CarouselSlider.builder(
                itemCount: _.pet.petImages.length,
                itemBuilder: (context, index, realIndex) {
                  return Obx(() {
                    return CircleAvatar(
                      backgroundColor: current.value == index
                          ? Colors.black
                          : Colors.grey[400],
                    );
                  });
                },
                carouselController: pointsController,
                options: CarouselOptions(
                  initialPage: current.value,
                  height: 20.r,
                  viewportFraction: 0.2,
                  enlargeCenterPage: _.pet.petImages.length > 2,
                  enableInfiniteScroll: false,
                  // onPageChanged: (index, reason) => chanPage(index),
                )),
          )
        ],
      );
    });
  }
}
