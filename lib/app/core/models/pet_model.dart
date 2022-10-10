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
  int age;
  String gender;
  int weight;
  int breedId;
  int userId;
  int petTypeId;

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        weight: json["weight"],
        breedId: json["breed_id"],
        userId: json["user_id"],
        petTypeId: json["pet_type_id"],
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
