// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
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

    final int? id;
    final String documentNumber;
    final String firstName;
    final String lastName;
    final String? email;
    final int localityId;
    final int cityId;
    final int countryId;
    final int documentTypeId;
    final int? oauthId;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        documentNumber: json["document_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        localityId: json["locality_id"],
        cityId: json["city_id"],
        countryId: json["country_id"],
        documentTypeId: json["document_type_id"],
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
