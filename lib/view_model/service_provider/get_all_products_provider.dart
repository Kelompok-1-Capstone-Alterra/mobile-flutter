import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/all_product_response_model.dart';

import '../../models/product.dart';
import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetAllProductsProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  List<Product> productsShuffled = [];

  late AllProductsResponseModel allProducts;

  void getAllProductsData() async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }

    try {
      productsShuffled.clear();
      final response = await service.getAllProducts();
      allProducts = response;

      productsShuffled = [
        ...?response.fertilizers,
        ...?response.pesticides,
        ...?response.seeds,
        ...?response.tools,
      ];
      productsShuffled.shuffle();

      // fertilizer = response.fertilizers!;
      // products.add(response.fertilizers);

      // // pesticides = response.pesticides!;
      // products.add(response.pesticides);

      // // seeds = response.seeds!;
      // products.add(response.seeds);

      // // tools = response.tools!;
      // products.add(response.tools);

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
