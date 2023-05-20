import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  bool isTanamankuEmpty = false;

  void tanamankuEmpty() {
    isTanamankuEmpty = !isTanamankuEmpty;
    notifyListeners();
  }
}
