import 'package:flutter/material.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class AddWateringProvider with ChangeNotifier {
  int? week;
  int? day;
  int? period;
  bool? isActive;
  List<int> history = [];

  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();

  Future<void> getWateringData(int idTanaman) async {
    try {
      final response = await services.getOverview(idTanaman);

      week = response.watering?.week;
      day = response.watering?.day;
      period = response.watering?.period;
      history.clear();
      history = response.watering!.history!;

      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> addWatering(int idTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      await services.addWatering(idTanaman);

      getWateringData(idTanaman);

      await Future.delayed(const Duration(seconds: 1));

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void addHistoryFromList(List<int> list) {
    history.clear();
    notifyListeners();
    history = List.from(list);
    notifyListeners();
  }

  void refresh() {
    week = 1;
    day = 1;
    period = 1;
    isActive = false;
    history = [];
  }
}
