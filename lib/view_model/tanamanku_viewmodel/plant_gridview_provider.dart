import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/card_myplant_model.dart';

class PlantGridviewProvider extends ChangeNotifier {
  bool isDeleteMode = false;
  List<int> selectedIndexCard = [];
  List<CardMyPlantModel> dataSelected = [];
  List<CardMyPlantModel> data = [
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum',
      plantName: 'Tomat',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'cabai',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'pisang',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'anggur',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'wortel',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'buah zakar',
    ),
    CardMyPlantModel(
      picture: 'assets/images/sample_tomat.png',
      latinName: 'Solanum lycopersicum asdasda asdasda asdasdas',
      plantName: 'buah dada',
    ),
  ];

  onSelectedCard({required bool selectStatus, required int indexSelected}) {
    if (selectStatus == false) {
      data[indexSelected].isSelected = true;
      selectedIndexCard.add(indexSelected);
      dataSelected.add(data[indexSelected]);
      notifyListeners();
    } else if (selectStatus == true) {
      data[indexSelected].isSelected = false;
      selectedIndexCard.remove(indexSelected);
      dataSelected.remove(data[indexSelected]);
      notifyListeners();
    }
  }

  deleteModeOnClick() {
    // isDeleteMode = !isDeleteMode;
    isDeleteMode = true;
    notifyListeners();
    // print(isDeleteMode);
  }

  deleteAllSelected() {
    for (var value in dataSelected) {
      data.remove(value);
      // print("delete ${data[indexSelected].plantName}");
    }
    selectedIndexCard.clear();
    dataSelected.clear();
    isDeleteMode = false;
    notifyListeners();
  }

  cancelAllSelected() {
    for (var indexSelected in selectedIndexCard) {
      data[indexSelected].isSelected = false;
      // print("remove ${data[indexSelected].plantName} from selectedList");
    }
    selectedIndexCard.clear();
    dataSelected.clear();
    isDeleteMode = false;
    notifyListeners();
  }
}
