import 'package:flutter/material.dart';

class OverviewProvider with ChangeNotifier {
  int counterPenyiraman = 0;
  int batasPenyiraman = 2;
  bool sudahMenanam = false;
  bool pemupukan = false;

  void addPenyiraman() {
    counterPenyiraman++;
    notifyListeners();
  }

  void addPemupukan() {
    pemupukan = true;
    notifyListeners();
  }

  void addSudahMenanam() {
    sudahMenanam = true;
    notifyListeners();
  }

  void refresh() {
    counterPenyiraman = 0;
    batasPenyiraman = 2;
    sudahMenanam = false;
    pemupukan = false;
  }
}
