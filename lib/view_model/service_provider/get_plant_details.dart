import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/plant_details_reponse_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetPlantDetailsProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;
  PlantDetailsResponseModel? plantDetails;

  void getplantDetailsProvider(int plantId) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
    }
    try {
      final response = await service.getPlantDetails(plantId);
      plantDetails = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
