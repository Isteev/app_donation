import 'package:adoption_app/app/core/models/response_model.dart';
import 'package:adoption_app/app/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OauthService {
  String path = "${dotenv.env['PETS_URL_API']}/oauth";

  Future<ResponseModel<UserModel>> register(user, pass) async {
    try {
      Response response = await Dio().post("$path/signup", data: {...user, "password": pass});

      if(response.data['status'] == "dudoso") {
        return ResponseModel(
          error: true,
          message: response.data['message']);
      }

      return ResponseModel(
          message: "success", result: UserModel.fromJson(response.data['data']));
    } catch (e) {
      return ResponseModel(error: true, message: e.toString());
    }
  }

  Future<ResponseModel<UserModel>> login(data) async {
    try {
      Response response = await Dio().post("$path/login", data: data);

      if (response.data['status'] == "percho") {
        return ResponseModel(
            message: "success", result: UserModel.fromJson(response.data['data']));
      } 

      return ResponseModel(message: response.data['message'], error: true);

    } catch (e) {
      return ResponseModel(error: true, message: e.toString());
    }
  }
}
