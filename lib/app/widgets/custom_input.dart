import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.placeholder,
    required this.onChage,
    this.suffix,
    this.borderRadius,
  }) : super(key: key);

  final String placeholder;
  final Function(String) onChage;
  final BorderRadius? borderRadius;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(30).r,
          color: Colors.white,
          border: Border.all(color: Colors.black12)),
      padding: const EdgeInsets.all(30).r,
      placeholder: placeholder,
      onChanged: (val) => onChage(val),

      //extra

      //icons
      suffix: suffix,
    );
  }
}
