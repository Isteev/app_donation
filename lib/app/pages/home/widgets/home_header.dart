import 'package:adoption_app/app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60))
              .r,
          color: const Color(0xFFf9f9f9),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                spreadRadius: 1,
                blurRadius: 15),
          ]),
      padding: EdgeInsets.only(
          left: 50.r,
          right: 50.r,
          top: MediaQuery.of(context).padding.top,
          bottom: 50.r),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Logo'),
              Text('name app'),
            ],
          ),
          20.verticalSpace,
          CustomInput(
            placeholder: "Busca tu mascota",
            onChage: (val) => {},
            borderRadius: BorderRadius.circular(50).r,
            suffix: Padding(
              padding: const EdgeInsets.only(right: 20).r,
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
