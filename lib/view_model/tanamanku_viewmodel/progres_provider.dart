import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/progres_response_model.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class ProgresProvider with ChangeNotifier {
  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();
  List<ProgresResponseModel> weeklyProgressList = [];

  Future<void> getProgres(int idTanaman) async {
    try {
      state = MyState.loading;

      final response = await services.getProgres(idTanaman);
      weeklyProgressList = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
