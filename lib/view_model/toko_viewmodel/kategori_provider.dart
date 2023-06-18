import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';

class KategoriProvider with ChangeNotifier {
  List<Produk> _products = [];
  List<Produk> _filteredProducts = [];
  bool _isLoading = true;
  bool _isProductAvailable = false;

  List<Produk> get products => _products;
  List<Produk> get filteredProducts => _filteredProducts;
  bool get isLoading => _isLoading;
  bool get isProductAvailable => _isProductAvailable;

  void setProducts(List<Produk> products) {
    _products = products;
    _filteredProducts = products;
    _isLoading = false;
    _isProductAvailable = products.isNotEmpty;
    notifyListeners();
  }

  void setFilteredProducts(List<Produk> filteredProducts) {
    _filteredProducts = filteredProducts;
    notifyListeners();
  }

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  void setProductAvailability(bool isProductAvailable) {
    _isProductAvailable = isProductAvailable;
    notifyListeners();
  }
}
