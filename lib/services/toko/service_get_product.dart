import 'package:dio/dio.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';
import 'package:mobile_flutter/models/toko/get_product_by_id.dart';
import 'package:mobile_flutter/utils/dio/global_dio.dart';
import 'package:provider/provider.dart';

import '../../utils/keys/navigator_keys.dart';
import '../../view_model/aunt_viewmodel/shared_preferences_provider.dart';

class ProductService {
  final _dioWithInterceptor = DioGlobal().globalDio;

  Future<List<Produk>> fetchProducts() async {
    // URL layanan API
    String apiUrl = '/auth/users/products';

    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      Response response = await _dioWithInterceptor.get(apiUrl,
          options: Options(headers: {'Authorization': token}));

      if (response.statusCode == 200) {
        final responseData = response.data;
        GetProducts productsData = GetProducts.fromJson(responseData['data']);

        List<Produk> products = [];
        if (productsData.fertilizers != null) {
          products.addAll(productsData.fertilizers!);
        }
        if (productsData.pesticides != null) {
          products.addAll(productsData.pesticides!);
        }
        if (productsData.seeds != null) {
          products.addAll(productsData.seeds!);
        }
        if (productsData.tools != null) {
          products.addAll(productsData.tools!);
        }

        return products;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Failed to fetch products');
    }
  }

//Service Api product by id
  Future<GetProductById> fetchProductById(int productId) async {
    // URL layanan API
    String apiUrl = '/auth/users/products/$productId/detail';

    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      Response response = await _dioWithInterceptor.get(apiUrl,
          options: Options(headers: {'Authorization': token}));

      if (response.statusCode == 200) {
        final responseData = response.data;
        GetProductById productData =
            GetProductById.fromJson(responseData['data']);

        if (productData.product!.id == productId) {
          return productData;
        } else {
          throw Exception('Product not found');
        }
      } else {
        throw Exception('Failed to fetch product by ID');
      }
    } catch (error) {
      throw Exception('Failed to fetch product by ID');
    }
  }

//Service Api category

  Future<List<Produk>> fetchProductsByCategory(String category) async {
    // URL layanan API
    String apiUrl = '/auth/users/products';

    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      Response response = await _dioWithInterceptor.get(apiUrl,
          options: Options(headers: {'Authorization': token}));

      if (response.statusCode == 200) {
        final responseData = response.data;
        GetProducts productsData = GetProducts.fromJson(responseData['data']);

        List<Produk> products = [];

        if (category == "Pupuk" && productsData.fertilizers != null) {
          products.addAll(productsData.fertilizers!);
        } else if (category == "Pestisida" && productsData.pesticides != null) {
          products.addAll(productsData.pesticides!);
        } else if (category == "Bibit" && productsData.seeds != null) {
          products.addAll(productsData.seeds!);
        } else if (category == "Alat Tani" && productsData.tools != null) {
          products.addAll(productsData.tools!);
        }

        return products;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Failed to fetch products by category');
    }
  }

  Future<String> getSellerWa(int productId) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/users/products/$productId/contact',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      final String waPhoneNumber = response.data['data']['seller_contact'];
      return waPhoneNumber;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
