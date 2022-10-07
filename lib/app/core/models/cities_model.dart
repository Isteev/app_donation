// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

CitiesModel citiesModelFromJson(String str) => CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

class CitiesModel {
    CitiesModel({
        required this.id,
        required this.name,
        required this.countryId,
    });

    final int id;
    final String name;
    final int countryId;

    factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
    };
}
