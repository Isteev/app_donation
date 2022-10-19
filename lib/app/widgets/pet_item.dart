import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/core/models/pet_model.dart';
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
    return Container(
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
      padding: const EdgeInsets.all(50).r,
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
          CarouselSlider(
              items: pet.petImages.map((e) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: e.url,
                      fit: BoxFit.cover,
                    ));
              }).toList(),
              options: CarouselOptions(
                  height: 600.r,
                  viewportFraction: 1,
                  enableInfiniteScroll: false))
        ],
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
