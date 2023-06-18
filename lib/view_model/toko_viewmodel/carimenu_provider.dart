import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';
import 'package:mobile_flutter/services/toko/service_get_product.dart';

class ProductProvider with ChangeNotifier {
  List<Produk> products = [];
  List<Produk> filteredProducts = [];
  bool isLoading = true;
  bool isProductAvailable = true;

  Future<void> fetchProducts() async {
    ProductService productService = ProductService();
    List<Produk> fetchedProducts = await productService.fetchProducts();
    products = fetchedProducts;
    filteredProducts = fetchedProducts;
    isLoading = false;
    isProductAvailable = fetchedProducts.isNotEmpty;
    notifyListeners();
  }

  void filterProducts(String search) {
    if (search.isEmpty) {
      filteredProducts = products;
    } else {
      filteredProducts = products.where((product) {
        return product.productName!
            .toLowerCase()
            .contains(search.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
