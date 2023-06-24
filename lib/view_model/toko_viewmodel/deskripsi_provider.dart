import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko/get_product_by_id.dart';

class CurrentProductProvider with ChangeNotifier {
  GetProductById? _currentProduct;
  bool _isLoading = true;

  GetProductById? get currentProduct => _currentProduct;
  bool get isLoading => _isLoading;

  void setCurrentProduct(GetProductById? product) {
    _currentProduct = product;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
  }
}
