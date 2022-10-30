import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))
              .r,
          color: const Color(0xFFf9f9f9),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -5),
                spreadRadius: 1,
                blurRadius: 15),
            BoxShadow(
                color: Color(0xFFf9f9f9),
                offset: Offset(0, 30),
                spreadRadius: 1,
                blurRadius: 20),
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 50).r,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () {
                Get.offNamed(AppRoutes.home, id: 12);
              },
              child: Text('home')),
          Text('pets'),
          GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.profile, id: 12);
              },
              child: Text('profile')),
        ],
      ),
    );
  }
}
