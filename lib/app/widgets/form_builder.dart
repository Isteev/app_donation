import 'package:adoption_app/app/core/form/form_control.dart';
import 'package:adoption_app/app/core/form/form_model.dart';
import 'package:flutter/material.dart';

class FormBuilder extends StatelessWidget {
  const FormBuilder({
    Key? key,
    required this.builder, required this.formControl,
  }) : super(key: key);

  final FormControl formControl;
  final Widget Function(Map<String, FormModel<dynamic>>) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: formControl.errors,
      builder: (context, value, child) {
        return builder(formControl.form);
      }
    );
  }
}
