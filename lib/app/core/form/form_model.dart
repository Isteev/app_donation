// To parse this JSON data, do
//
//     final formModel = formModelFromJson(jsonString);

import 'dart:convert';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel<T> {
    FormModel({
        required this.value,
        required this.validators,
        this.error = const [],
    });

    T? value;
    List<Function(dynamic)> validators;
    List error;

    factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        value: json["value"],
        validators: List<Function(dynamic)>.from(json["validators"].map((x) => x)),
        error: List<String>.from(json["error"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "validators": List<dynamic>.from(validators.map((x) => x)),
        "error": List<dynamic>.from(error.map((x) => x)),
    };
}
