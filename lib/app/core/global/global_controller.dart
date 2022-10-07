import 'package:adoption_app/app/core/models/cities_model.dart';
import 'package:adoption_app/app/core/models/document_type_model.dart';
import 'package:adoption_app/app/core/models/localities_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GlobalController extends GetxController {
  List<DocumentTypeModel> docTypes = [];
  List<CitiesModel> cities = [];
  List<LoaclitiesModel> localities = [];

}
