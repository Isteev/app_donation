import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Get.back();
        }
      },
      child: Container(
          padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20).r,
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          )),
    );
  }
}
