import 'dart:convert';

import 'package:adoption_app/app/core/form/form_model.dart';
import 'package:flutter/foundation.dart';

class FormControl {
  late Map<String, FormModel> form;
  Map<String, FormModel> get getForm => form;
  ValueNotifier<List<List>> errors = ValueNotifier([]);

  FormControl({required this.form});

  bool validate() {
    bool state = true;

    form.forEach((key, value) {
      value.error = [];
      errors.value = [];
      value.validators.forEach((funcVal) {
        final error = funcVal(value.value);
        if (error != null) {
          form[key]!.error.add(error);
          errors.value.add(form[key]!.error);
          state = false;
        }
      });
    });

    return state;
  }

  Map<String, dynamic> getValues() {
    return form.map((key, value) => MapEntry(key, value.value));
  }

  String toJson() {
    return jsonEncode(form.map((key, value) => MapEntry(key, value.value)));
  }
}
