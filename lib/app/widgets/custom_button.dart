import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.backGround = const Color(0xFFf5af4c),
    this.textColor = Colors.white,
    this.loading,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final Color backGround;
  final Color textColor;
  final RxBool? loading;

  @override
  Widget build(BuildContext context) {
    RxBool load = loading ?? false.obs;

    return GestureDetector(
      onTap: () {
        if (!load.value) {
          onTap();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backGround,
          borderRadius: BorderRadius.circular(30).r,
        ),
        padding: const EdgeInsets.all(30).r,
        alignment: Alignment.center,
        child: Obx(() {
          if (load.value) {
            return SizedBox(
                height: 52.r,
                width: 52.r,
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                  strokeWidth: 4.r,
                ));
          }
          return Text(
            label,
            style: TextStyle(
                color: textColor, fontSize: 45.r, fontWeight: FontWeight.w600),
          );
        }),
      ),
    );
  }
}
