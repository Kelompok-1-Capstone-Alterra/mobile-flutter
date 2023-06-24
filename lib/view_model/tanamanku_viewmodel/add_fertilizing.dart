import 'package:flutter/material.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class AddFertilizingProvider with ChangeNotifier {
  bool? isActive;
  bool? isEnabled;

  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();

  Future<void> getFertilizingData(int idTanaman) async {
    try {
      final response = await services.getOverview(idTanaman);

      isActive = response.fertilizing?.isActive;
      isEnabled = response.fertilizing?.isEnabled;

      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> addFertilizing(int idTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      await services.addFertilizing(idTanaman);

      getFertilizingData(idTanaman);

      await Future.delayed(const Duration(seconds: 1));

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void refresh() {
    isActive = false;
    isEnabled = false;
  }
}
