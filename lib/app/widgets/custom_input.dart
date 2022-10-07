import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {Key? key,
      required this.placeholder,
      required this.onChage,
      this.suffix,
      this.borderRadius,
      this.pass = false})
      : super(key: key);

  final String placeholder;
  final Function(String) onChage;
  final BorderRadius? borderRadius;
  final Widget? suffix;
  final bool pass;

  @override
  Widget build(BuildContext context) {
    RxBool show = pass.obs;

    return Obx(() {
        return SizedBox(
          height: 115.r,
          child: CupertinoTextField(
            decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(30).r,
                color: Colors.white,
                border: Border.all(color: Colors.black12)),
            padding: const EdgeInsets.all(30).r,
            placeholder: placeholder,
            onChanged: (val) => onChage(val),

            //extra
            obscureText: show.value,

            //icons
            suffix: suffix ?? (pass ? Padding(
              padding: const EdgeInsets.only(right: 25).r,
              child: GestureDetector(
                    onTap: () => show.value = !show.value ,
                    child: SvgPicture.asset( show.value? "assets/icons/close_eye.svg": "assets/icons/open_eye.svg", color: Colors.black26,),
                  ),
            ): Container() ),
          ),
        );
      }
    );
  }
}
