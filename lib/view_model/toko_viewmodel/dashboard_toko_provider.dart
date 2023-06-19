import 'package:flutter/foundation.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';
import 'package:mobile_flutter/services/toko/service_get_product.dart';

class TokoProvider with ChangeNotifier {
  List<Produk> products = [];
  bool isLoading = false;

  Future<void> fetchProducts() async {
    isLoading = true;

    try {
      ProductService productService = ProductService();
      List<Produk> fetchedProducts = await productService.fetchProducts();

      products = fetchedProducts;
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
