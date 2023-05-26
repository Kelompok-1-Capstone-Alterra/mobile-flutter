import 'package:flutter/material.dart';

import '../../models/card_myplant_model.dart';

class TambahkanTanamanProvider extends ChangeNotifier {
  final searchField = TextEditingController();
  String searchQuery = "";
  List<CardMyPlantModel> data = [
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum',
      plantName: 'Tomat',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Cabai',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Pisang',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Anggur',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Wortel',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Bawang Merah',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Bawang Putih',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Jeruk Nipis',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Bayam',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Kacang Panjang',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'Bawang Bombai',
    ),
  ];
  List<CardMyPlantModel> showData = [];

  void search() {
    searchQuery = searchField.text.toLowerCase();
    showData.clear();
    if (searchQuery.isEmpty) {
      showData.addAll(data);
      notifyListeners();
    } else {
      showData.addAll(
        data.where(
          (element) => element.plantName.toLowerCase().contains(searchQuery),
        ),
      );
      notifyListeners();
    }
  }

  void clearSearch() {
    searchField.clear();
    searchQuery = "";
    showData.clear();
    showData.addAll(data);
    notifyListeners();
  }
}
