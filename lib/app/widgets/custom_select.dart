import 'package:adoption_app/app/core/models/select_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSelect extends StatelessWidget {
  const CustomSelect(
      {Key? key,
      required this.placeholder,
      this.width,
      this.modalTitle = "Seleccione una",
      required this.items,
      required this.onSelected})
      : super(key: key);

  final String placeholder;
  final String modalTitle;
  final List<SelectModel> items;
  final double? width;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    RxString selected = "".obs;

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(CustomSelectSheet(
          modalTitle: modalTitle,
          items: items,
          selected: selected,
          onSelected: onSelected,
        ));
      },
      child: Container(
        height: 115.r,
        width: width ?? 220.r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30).r,
            color: Colors.white,
            border: Border.all(color: Colors.black12)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20).r,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Flexible(
                child: Text(
                  selected.value != "" ? selected.value : placeholder,
                  style: TextStyle(
                      fontSize: 40.r,
                      fontWeight: FontWeight.w400,
                      color: selected.value != ""
                          ? const Color.fromRGBO(16, 16, 16, 1)
                          : const Color.fromRGBO(205, 205, 207, 1)),
                  maxLines: 1,
                ),
              );
            }),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color.fromRGBO(205, 205, 207, 1),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSelectSheet extends StatelessWidget {
  const CustomSelectSheet({
    Key? key,
    required this.modalTitle,
    required this.items,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final String modalTitle;
  final List<SelectModel> items;
  final RxString selected;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 700.r),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))
              .r,
          color: Colors.white,
          border: Border.all(color: Colors.black12)),
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50).r,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              modalTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 45.r,
                  fontWeight: FontWeight.w500),
            ),
          ),
          20.verticalSpace,
          Expanded(
              child: items.isNotEmpty
                  ? SingleChildScrollView(
                      child: Obx(() {
                        return Column(
                          children: items
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      selected.value = e.value;
                                      onSelected(e.id);
                                      Future.delayed(
                                          const Duration(milliseconds: 150),
                                          () => Get.back());
                                    },
                                    child: Container(
                                        width: 400.r,
                                        decoration: BoxDecoration(
                                            color: selected.value == e.value
                                                ? const Color(0xFF33e3ff)
                                                    .withOpacity(0.2)
                                                : Colors.white,
                                            border: Border.all(
                                              color: Colors.black12,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30).r),
                                        padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 50)
                                            .r,
                                        margin: const EdgeInsets.symmetric(
                                                vertical: 10)
                                            .r,
                                        alignment: Alignment.center,
                                        child: Text(
                                          e.value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: selected.value == e.value
                                                  ? Colors.black
                                                  : const Color.fromRGBO(
                                                      205, 205, 207, 1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 40.r),
                                        )),
                                  ))
                              .toList(),
                        );
                      }),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No hay Datos",
                        style: TextStyle(fontSize: 50.w),
                      ),
                    ))
        ],
      ),
    );
  }
}
