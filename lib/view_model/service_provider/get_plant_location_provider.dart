import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/location_plant_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetPlantLocationProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  List<LocationPlantResponseModel> plantinglocation = [];

  void getPlantingLocationData(int plantId) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
    }
    try {
      plantinglocation.clear();

      final response = await service.getPlantLocation(plantId);
      plantinglocation = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
