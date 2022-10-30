import 'package:adoption_app/app/pages/home/home_controller.dart';
import 'package:adoption_app/app/pages/home/widgets/home_header.dart';
import 'package:adoption_app/app/pages/home/widgets/home_list_filter.dart';
import 'package:adoption_app/app/widgets/pet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: GetBuilder<HomeController>(
            id: 'pets',
            builder: (_) {
              return Column(
                children: [
                  const HomeHeader(),
                  30.verticalSpace,
                  const HomeListFilters(),
                  30.verticalSpace,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80).r,
                          child: Obx(() {
                            if (_.loading.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (_.pets.isEmpty && !_.loading.value) {
                              return Text("error");
                            }

                            return Column(
                              children: [
                                20.verticalSpace,
                                ..._.pets
                                    .map((e) => PetsItem(
                                          pet: e,
                                        ))
                                    .toList()
                              ],
                            );
                          })),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
