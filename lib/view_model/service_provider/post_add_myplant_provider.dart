import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/add_my_plant_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class PostAddMyPlantProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.initial;
  AddMyplantResponseModel? postResponse;

  addMyPlant({
    required int plantId,
    required String location,
    required String namedPlant,
  }) async {
    try {
      state = MyState.loading;
      notifyListeners();

      final response = await service.addMyPlant(
          plantId: plantId, location: location, namedPlant: namedPlant);
      postResponse = response;
      state = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
      throw Exception(e.toString());
      // buat snackbar gagal
    }
  }
}
