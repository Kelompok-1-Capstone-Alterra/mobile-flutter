import 'package:mobile_flutter/models/all_product_response_model.dart';
import 'package:mobile_flutter/models/plants_response_model.dart';

import '../models/article_response_model.dart';
import '../models/weather_response_model.dart';

abstract class ServicesRestApi {
  void contohEndpoint();

  // ------ explore and monitoring ------------
  Future<WeatherResponseModel?> getWeather(
      {required double latitude, required double longitude});

  Future<List<PlantsResponseModel>> getMyPlants();
  Future<void> deleteMyPlants(List<int> myPlantIds);

  Future<List<ArticleResponseModel>> getTrendingArticle();
  Future<AllProductsResponseModel> getAllProducts();
}
