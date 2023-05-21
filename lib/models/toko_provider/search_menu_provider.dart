import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko_provider/base_model.dart';

class ProductProvider with ChangeNotifier {
  List<BaseModel> _allProducts = [];
  List<BaseModel> _filteredProducts = [];

  List<BaseModel> get allProducts => _allProducts;
  List<BaseModel> get filteredProducts => _filteredProducts;

  void setAllProducts(List<BaseModel> products) {
    _allProducts = products;
    _filteredProducts = products;
    notifyListeners();
  }

  void filterProducts(String keyword) {
    _filteredProducts = _allProducts
        .where((product) =>
            product.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
