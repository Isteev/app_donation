import 'package:adoption_app/app/core/models/cities_model.dart';
import 'package:adoption_app/app/core/models/localities_model.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CitiesService {
  String path = "${dotenv.env['PETS_URL_API']}";

  Future<ResponseModel<List<CitiesModel>>> getCities() async {
    try {
      Response response = await Dio().get("$path/cities");

      return ResponseModel(
          message: "percho",
          result: (response.data['data'] as List)
              .map((e) => CitiesModel.fromJson(e))
              .toList());
    } catch (e) {
      return ResponseModel(error: true, message: e.toString());
    }
  }

  Future<ResponseModel<List<LoaclitiesModel>>> getLocalities() async {
    try {
      Response response = await Dio().get("$path/localities");

      return ResponseModel(
          message: "percho",
          result: (response.data['data'] as List)
              .map((e) => LoaclitiesModel.fromJson(e))
              .toList());
    } catch (e) {
      return ResponseModel(error: true, message: e.toString());
    }
  }
}
