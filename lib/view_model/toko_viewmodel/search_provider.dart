import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String _search = '';

  String get search => _search;

  void setSearch(String search) {
    _search = search;
    notifyListeners();
  }

  void resetSearch() {
    _search = '';
    notifyListeners();
  }
}
