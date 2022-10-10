import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:adoption_app/app/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: Get.nestedKey(12),
              initialRoute: AppRoutes.home,
              onGenerateRoute: (val) => AppPages.homePageRoutes(val),
            ),
          ),
          const NavBar(),
          50.verticalSpace,
        ],
      ),
    );
  }
}
