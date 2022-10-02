import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetsItem extends StatelessWidget {
  const PetsItem({
    Key? key,
  }) : super(key: key);

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
                    'Carla marcela',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 38.r),
                  ),
                  Text(
                    '5 mnt',
                    style: TextStyle(
                        color: const Color(0xFF888687), fontSize: 30.r),
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/like.svg")
            ],
          ),
          20.verticalSpace,
          Container(
              width: double.infinity,
              height: 600.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/pet.jpg",
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }
}
