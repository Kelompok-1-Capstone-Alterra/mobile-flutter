import 'package:flutter/material.dart';

import '../../models/available_plant_response_model.dart';
// import '../../models/plants_response_model.dart';
import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

//di provider ini untuk dapatin data availble plants dan mencari data dalam available plants

class GetAvailablePlantsProvider extends ChangeNotifier {
  final searchFieldController = TextEditingController();
  String searchQuery = "";
  //

  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  List<AvailablePlantResponseModel> availablePlants = [];
  List<AvailablePlantResponseModel> searchedPlants = [];

  //fetch data available
  void getAvailablePlantsData() async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
    }
    try {
      availablePlants.clear();

      final response = await service.getAvailablePlants();
      availablePlants = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  //get hasil pencarian dari data available
  void searchAvailablePlants() async {
    searchedPlants.clear();
    print("mencari ${searchFieldController.text}");
    searchQuery = searchFieldController.text;
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
    }
    try {
      final response = await service.getSearchAvailablePlants(searchQuery);

      searchedPlants = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  clearSearch() {
    searchFieldController.clear();
    searchQuery = "";
    searchedPlants.clear();
    notifyListeners();
  }
}
