// To parse this JSON data, do
//
//     final PetsTypesModel = PetsTypesModelFromJson(jsonString);

import 'dart:convert';

PetsTypesModel petsTypesModelFromJson(String str) =>
    PetsTypesModel.fromJson(json.decode(str));

String petsTypesModelToJson(PetsTypesModel data) => json.encode(data.toJson());

class PetsTypesModel {
  PetsTypesModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory PetsTypesModel.fromJson(Map<String, dynamic> json) => PetsTypesModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
