import 'package:adoption_app/app/pages/home/widgets/home_header.dart';
import 'package:adoption_app/app/pages/home/widgets/home_list_filter.dart';
import 'package:adoption_app/app/widgets/nav_bar.dart';
import 'package:adoption_app/app/widgets/pet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const HomeHeader(),
            30.verticalSpace,
            const HomeListFilters(),
            30.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80).r,
                  child: Column(
                    children: [
                      20.verticalSpace,
                      ...List.generate(5, (index) => const PetsItem())
                    ],
                  ),
                ),
              ),
            ),
            const NavBar(),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
