import 'package:adoption_app/app/pages/home/home_bindings.dart';
import 'package:adoption_app/app/pages/home/home_page.dart';
import 'package:adoption_app/app/pages/login/login_bindings.dart';
import 'package:adoption_app/app/pages/login/login_page.dart';
import 'package:adoption_app/app/pages/register/register_bindings.dart';
import 'package:adoption_app/app/pages/register/register_page.dart';
import 'package:adoption_app/app/pages/splash/splash_bindings.dart';
import 'package:adoption_app/app/pages/splash/splash_page.dart';
import 'package:get/route_manager.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBindigns()),
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
        binding: SplashBindigs())
  ];
}
