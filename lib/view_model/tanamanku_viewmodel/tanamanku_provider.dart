import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/my_plant_name_response_model.dart';
import 'package:mobile_flutter/models/plant_details_reponse_model.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class TanamankuProvider with ChangeNotifier {
  MyState state = MyState.initial;
  int selectedIndex = 0;
  final services = ServicesRestApiImpl();
  MyPlantNameResponseModel? _details;
  MyPlantNameResponseModel get getDetails => _details!;

  PlantDetailsResponseModel? _plantDetails;
  PlantDetailsResponseModel get getPlantDetails => _plantDetails!;

  void setSelectedIndex(BuildContext context, int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void refresh() {
    selectedIndex = 0;
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  Future<void> getMyPlantName(int idTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      final response = await services.getMyPlantName(idTanaman);
      _details = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> getPlantDetail(int idDetailTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      final response = await services.getPlantDetails(idDetailTanaman);
      _plantDetails = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
