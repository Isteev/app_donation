import 'package:adoption_app/app/core/models/breeds_model.dart';
import 'package:adoption_app/app/core/models/pet_model.dart';
import 'package:adoption_app/app/core/models/pets_type_model.dart';
import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PetsServices {
  String path = "${dotenv.env['PETS_URL_API']}";

  Future<ResponseModel<List<PetsTypesModel>>> getPetsType() async {
    try {
      Response response = await Dio().get("$path/pet-types");

      return ResponseModel(
          message: "percho",
          result: (response.data['data'] as List)
              .map((e) => PetsTypesModel.fromJson(e))
              .toList());
    } catch (e) {
      return ResponseModel(error: true, message: e.toString());
    }
  }

  Future<ResponseModel<List<BreedsModel>>> getBreeds() async {
    try {
      Response response = await Dio().get("$path/breeds");

      return ResponseModel(
          message: "percho",
          result: (response.data['data'] as List)
              .map((e) => BreedsModel.fromJson(e))
              .toList());
    } catch (e) {
      return ResponseModel(error: true, message: e.toString());
    }
  }

  Future<ResponseModel<PetModel>> createPet(images, data) async {
    FormData form = FormData.fromMap({"images": images, ...data});

    try {
      Response response = await Dio().post("$path/pets/new-pet", data: form);

      if (response.data['status'] == "dudoso") {
        return ResponseModel(
            error: true, message: response.data['message'].toString());
      }

      return ResponseModel(
          message: "percho", result: PetModel.fromJson(response.data['data']));
    } catch (e) {
      return ResponseModel(error: true, message: e.toString());
    }
  }

  Future<ResponseModel<List<PetModel>>> getPets(filters) async {
    try {
      Response response = await Dio().post("$path/pets", data: filters);
      return ResponseModel(
          message: "percho",
          result: (response.data as List)
              .map((e) => PetModel.fromJson(e))
              .toList());
    } catch (e) {
      print(e);
      return ResponseModel(error: true, message: e.toString());
    }
  }

  Future<ResponseModel<PetModel>> getPetsById(id) async {
    try {
      Response response = await Dio().get("$path/pets/$id");
      return ResponseModel(
          message: "percho", result: PetModel.fromJson(response.data));
    } catch (e) {
      print(e);
      return ResponseModel(error: true, message: e.toString());
    }
  }
}
