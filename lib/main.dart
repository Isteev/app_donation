import 'package:adoption_app/app/core/global/global_controller.dart';
import 'package:adoption_app/app/pages/splash/splash_bindings.dart';
import 'package:adoption_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 1920),
        builder: (_, __) {
          GlobalController globalController = Get.put(GlobalController());
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            initialRoute: AppRoutes.spalsh,
            initialBinding: SplashBindigs(),
          );
        });
  }
}
