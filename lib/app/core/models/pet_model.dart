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
    required this.status,
    required this.adoptionStatus,
    required this.breedId,
    required this.userId,
    required this.petTypeId,
    required this.petImages,
  });

  int? id;
  String name;
  String age;
  String gender;
  int weight;
  int status;
  int adoptionStatus;
  int breedId;
  int userId;
  int petTypeId;
  List<PetImage> petImages;

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        weight: json["weight"],
        status: json["status"],
        adoptionStatus: json["adoption_status"],
        breedId: json["breed_id"],
        userId: json["user_id"],
        petTypeId: json["pet_type_id"],
        petImages: List<PetImage>.from(
            json["pet_images"].map((x) => PetImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": gender,
        "weight": weight,
        "status": status,
        "adoption_status": adoptionStatus,
        "breed_id": breedId,
        "user_id": userId,
        "pet_type_id": petTypeId,
        "pet_images": List<dynamic>.from(petImages.map((x) => x.toJson())),
      };
}

class PetImage {
  PetImage({
    required this.id,
    required this.key,
    required this.url,
    required this.status,
    required this.petId,
  });

  int id;
  String key;
  String url;
  int status;
  int petId;

  factory PetImage.fromJson(Map<String, dynamic> json) => PetImage(
        id: json["id"],
        key: json["key"],
        url: json["url"],
        status: json["status"],
        petId: json["pet_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "url": url,
        "status": status,
        "pet_id": petId,
      };
}
