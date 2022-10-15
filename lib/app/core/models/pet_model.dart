// To parse this JSON data, do
//
//     final petModel = petModelFromJson(jsonString);

import 'dart:convert';

PetModel petModelFromJson(String str) => PetModel.fromJson(json.decode(str));

String petModelToJson(PetModel data) => json.encode(data.toJson());

class PetModel {
  PetModel({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.weight,
    required this.breedId,
    required this.userId,
    required this.petTypeId,
  });

  int? id;
  String name;
  String age;
  String gender;
  int weight;
  int breedId;
  int userId;
  int petTypeId;

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        id: json["id"],
        name: json["name"],
        age: json["age"].toString(),
        gender: json["gender"],
        weight: int.parse(json["weight"].toString()),
        breedId: int.parse(json["breed_id"].toString()),
        userId: int.parse(json["user_id"].toString()),
        petTypeId: int.parse(json["pet_type_id"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "weight": weight,
        "breed_id": breedId,
        "user_id": userId,
        "pet_type_id": petTypeId,
      };
}
