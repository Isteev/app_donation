// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel<T> {
    ResponseModel({
        this.message,
        this.error = false,
        this.result,
    });

    final String? message;
    final bool error;
    final T? result;

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        message: json["message"],
        error: json["error"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "result": result,
    };
}
