import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

class HomeListFilters extends StatelessWidget {
  const HomeListFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt selected = RxInt(0);

    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterItem(
            label: "todos",
            selected: selected.value == 0,
            onTap: () => selected.value = 0,
          ),
          FilterItem(
            label: "perros",
            selected: selected.value == 1,
            onTap: () => selected.value = 1,
          ),
          FilterItem(
            label: "gatos",
            selected: selected.value == 2,
            onTap: () => selected.value = 2,
          ),
        ],
      );
    });
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    required this.label,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            color: selected ? Colors.orangeAccent : Colors.transparent,
            borderRadius: BorderRadius.circular(20).r),
        width: 200.r,
        padding: const EdgeInsets.symmetric(vertical: 20).r,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 35.r),
        ),
      ),
    );
  }
}
