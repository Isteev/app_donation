// To parse this JSON data, do
//
//     final BreedsModel = BreedsModelFromJson(jsonString);

import 'dart:convert';

BreedsModel breedsModelFromJson(String str) =>
    BreedsModel.fromJson(json.decode(str));

String breedsModelToJson(BreedsModel data) => json.encode(data.toJson());

class BreedsModel {
  BreedsModel({
    required this.id,
    required this.name,
    required this.petTypeId,
  });

  final String id;
  final String name;
  final String petTypeId;

  factory BreedsModel.fromJson(Map<String, dynamic> json) => BreedsModel(
        id: json["id"].toString(),
        name: json["name"],
        petTypeId: json["pet_type_id"].toString(),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
