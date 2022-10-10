import 'package:adoption_app/app/pages/form_pet/form_pet_bindigs.dart';
import 'package:adoption_app/app/pages/form_pet/form_pet_page.dart';
import 'package:adoption_app/app/pages/home/home_bindings.dart';
import 'package:adoption_app/app/pages/home/home_page.dart';
import 'package:adoption_app/app/pages/login/login_bindings.dart';
import 'package:adoption_app/app/pages/login/login_page.dart';
import 'package:adoption_app/app/pages/main/main.dart';
import 'package:adoption_app/app/pages/profile/profile_bindings.dart';
import 'package:adoption_app/app/pages/profile/profile_page.dart';
import 'package:adoption_app/app/pages/register/register_bindings.dart';
import 'package:adoption_app/app/pages/register/register_page.dart';
import 'package:adoption_app/app/pages/splash/splash_bindings.dart';
import 'package:adoption_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainApp(),
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBindigns()),
    GetPage(
        name: AppRoutes.register,
        page: () => const RegisterPage(),
        binding: RegisterBindings()),
    GetPage(
        name: AppRoutes.spalsh,
        page: () => const SplashPage(),
        binding: SplashBindigs()),
    GetPage(
        name: AppRoutes.formPets,
        page: () => const FormPets(),
        binding: FormPetsBindings())
  ];

  static Route<dynamic> homePageRoutes(RouteSettings route) {
    Get.routing.args = route.arguments;
    if (route.name != null) Get.routing.current = route.name!;
    switch (route.name) {
      case AppRoutes.home:
        return GetPageRoute(
            routeName: AppRoutes.home,
            settings: route,
            page: () => const HomePage(),
            binding: HomeBindigns());

      case AppRoutes.profile:
        return GetPageRoute(
            routeName: AppRoutes.profile,
            settings: route,
            page: () => const ProfilePage(),
            binding: ProfileBindigs());

      default:
        return GetPageRoute(
            routeName: AppRoutes.home,
            settings: route,
            page: () => const HomePage(),
            binding: HomeBindigns());
    }
  }
}
