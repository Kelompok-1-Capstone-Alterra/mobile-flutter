import 'package:dio/dio.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';
import 'package:mobile_flutter/models/toko/get_product_by_id.dart';
import 'package:mobile_flutter/models/toko/get_product_by_category.dart';
import 'package:mobile_flutter/utils/response_dummy/recommendation/get_product_response.dart';
import 'package:mobile_flutter/utils/response_dummy/recommendation/get_product_by_id_response.dart';
import 'package:mobile_flutter/utils/response_dummy/recommendation/get_product_by_category_response.dart';

class ProductService {
// //servicedummy
//   Future<List<Produk>> fetchProducts() async {
//     DummyApiService dummyApiService = DummyApiService();
//     GetProducts dummyData = dummyApiService.getDummyData();

//     List<Produk> products = [];
//     if (dummyData.fertilizers != null) {
//       products.addAll(dummyData.fertilizers!);
//     }
//     if (dummyData.pesticides != null) {
//       products.addAll(dummyData.pesticides!);
//     }
//     if (dummyData.seeds != null) {
//       products.addAll(dummyData.seeds!);
//     }
//     if (dummyData.tools != null) {
//       products.addAll(dummyData.tools!);
//     }

//     return products;
//   }

//   Future<GetProductById> fetchProductById(int productId) async {
//     DummyProductByIdService dummyApiService = DummyProductByIdService();
//     GetProductById dummyData = dummyApiService.getDummyData();

//     if (dummyData.product!.id == productId) {
//       return dummyData;
//     } else {
//       throw Exception('Product not found');
//     }
//   }

//   Future<List<Produk>> fetchProductsByCategory(String category) async {
//     DummyApiService dummyApiService = DummyApiService();
//     GetProducts dummyData = dummyApiService.getDummyData();

//     List<Produk> products = [];

//     if (category == "Pupuk" && dummyData.fertilizers != null) {
//       products.addAll(dummyData.fertilizers!);
//     } else if (category == "Pestisida" && dummyData.pesticides != null) {
//       products.addAll(dummyData.pesticides!);
//     } else if (category == "Bibit" && dummyData.seeds != null) {
//       products.addAll(dummyData.seeds!);
//     } else if (category == "Alat Tani" && dummyData.tools != null) {
//       products.addAll(dummyData.tools!);
//     }

//     return products;
//   }

//service beneran
// Service Api product
  String bearerToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVXNlciB0ZXMiLCJyb2xlIjoidXNlciIsInVzZXJfaWQiOjN9.QSSZgZe_erZ2IELUqzx6LlvpJF6DTDbU663vt6RJPFM';

  late Dio _dio;

  ProductService() {
    _dio = Dio();
  }

  Future<List<Produk>> fetchProducts() async {
    // URL layanan API
    String apiUrl = 'https://34.128.85.215:8080/auth/users/products';

    try {
      Response response = await _dio.get(apiUrl,
          options: Options(headers: {'Authorization': 'Bearer $bearerToken'}));

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
    String apiUrl =
        'https://34.128.85.215:8080/auth/users/products/$productId/detail';

    try {
      Response response = await _dio.get(apiUrl,
          options: Options(headers: {'Authorization': 'Bearer $bearerToken'}));

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
    String apiUrl = 'https://34.128.85.215:8080/auth/users/products';

    try {
      Response response = await _dio.get(apiUrl,
          options: Options(headers: {'Authorization': 'Bearer $bearerToken'}));

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
}
