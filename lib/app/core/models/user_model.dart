// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'hive/user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  UserModel({
    this.id,
    required this.documentNumber,
    required this.firstName,
    required this.lastName,
    required this.localityId,
    this.email,
    required this.cityId,
    required this.countryId,
    required this.documentTypeId,
    this.oauthId,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String documentNumber;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String localityId;
  @HiveField(6)
  final String cityId;
  @HiveField(7)
  final String countryId;
  @HiveField(8)
  final String documentTypeId;
  @HiveField(9)
  final int? oauthId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        documentNumber: json["document_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        localityId: json["locality_id"].toString(),
        cityId: json["city_id"].toString(),
        countryId: json["country_id"].toString(),
        documentTypeId: json["document_type_id"].toString(),
        oauthId: json["oauth_id"],
      );

  Map<String, dynamic> toJson() => {
        "document_number": documentNumber,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "locality_id": localityId,
        "city_id": cityId,
        "country_id": countryId,
        "document_type_id": documentTypeId,
      };
}
