import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.backGround = const Color(0xFFf5af4c),
    this.textColor = Colors.white,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final Color backGround;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backGround,
          borderRadius: BorderRadius.circular(30).r,
        ),
        padding: const EdgeInsets.all(30).r,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
              color: textColor, fontSize: 45.r, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
