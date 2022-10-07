// To parse this JSON data, do
//
//     final documentTypeModel = documentTypeModelFromJson(jsonString);

import 'dart:convert';

DocumentTypeModel documentTypeModelFromJson(String str) => DocumentTypeModel.fromJson(json.decode(str));

String documentTypeModelToJson(DocumentTypeModel data) => json.encode(data.toJson());

class DocumentTypeModel {
    DocumentTypeModel({
        required this.id,
        required this.name,
        required this.externalCode,
    });

    final int id;
    final String name;
    final String externalCode;

    factory DocumentTypeModel.fromJson(Map<String, dynamic> json) => DocumentTypeModel(
        id: json["id"],
        name: json["name"],
        externalCode: json["external_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "external_code": externalCode,
    };
}
