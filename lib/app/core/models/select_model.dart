// To parse this JSON data, do
//
//     final selectModel = selectModelFromJson(jsonString);

import 'dart:convert';

SelectModel selectModelFromJson(String str) => SelectModel.fromJson(json.decode(str));

String selectModelToJson(SelectModel data) => json.encode(data.toJson());

class SelectModel {
    SelectModel({
        required this.id,
        required this.value,
    });

    final String id;
    final String value;

    factory SelectModel.fromJson(Map<String, dynamic> json) => SelectModel(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}
