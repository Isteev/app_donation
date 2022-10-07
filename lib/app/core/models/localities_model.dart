// To parse this JSON data, do
//
//     final loaclitiesModel = loaclitiesModelFromJson(jsonString);

import 'dart:convert';

LoaclitiesModel loaclitiesModelFromJson(String str) => LoaclitiesModel.fromJson(json.decode(str));

String loaclitiesModelToJson(LoaclitiesModel data) => json.encode(data.toJson());

class LoaclitiesModel {
    LoaclitiesModel({
        required this.id,
        required this.name,
        required this.cityId,
    });

    final int id;
    final String name;
    final int cityId;

    factory LoaclitiesModel.fromJson(Map<String, dynamic> json) => LoaclitiesModel(
        id: json["id"],
        name: json["name"],
        cityId: json["city_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city_id": cityId,
    };
}
