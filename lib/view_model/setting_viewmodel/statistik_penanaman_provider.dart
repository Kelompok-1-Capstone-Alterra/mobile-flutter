import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/plant_stats_model.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class StatistikaPenanamanProvider with ChangeNotifier {
  final serviceRestApiImpl = ServicesRestApiImpl();
  String selectedFilter = 'all';

  List<PlantStatsModel> allItems = [];
  List<PlantStatsModel> get harvestItems =>
      allItems.where((item) => item.status == 'harvest').toList();
  List<PlantStatsModel> get deadItems =>
      allItems.where((item) => item.status == 'dead').toList();

  MyState state = MyState.initial;

  void setFilter(String value) {
    state = MyState.loading;
    notifyListeners();
    selectedFilter = value;
    state = MyState.loaded;
    notifyListeners();
  }

  Future<void> getAllPlantStats() async {
    try {
      state = MyState.loading;
      final response = await serviceRestApiImpl.getPlantStats(selectedFilter);
      notifyListeners();

      allItems = response;
      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
