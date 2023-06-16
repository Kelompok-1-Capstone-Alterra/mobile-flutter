import 'package:mobile_flutter/models/all_product_response_model.dart';
import 'package:mobile_flutter/models/fertilizing_article_response_model.dart';
import 'package:mobile_flutter/models/location_plant_response_model.dart';
import 'package:mobile_flutter/models/plant_details_reponse_model.dart';
import 'package:mobile_flutter/models/planting_article_response_model.dart';
import 'package:mobile_flutter/models/plants_response_model.dart';
import 'package:mobile_flutter/models/temperature_article_response_model.dart';
import 'package:mobile_flutter/models/watering_article_response_model.dart';

import '../models/article_response_model.dart';
import '../models/weather_response_model.dart';
import 'package:mobile_flutter/models/user_model.dart';

abstract class ServicesRestApi {
  void contohEndpoint();

  // ------ explore and monitoring ------------
  Future<WeatherResponseModel?> getWeather(
      {required double latitude, required double longitude});

  Future<List<PlantsResponseModel>> getMyPlants();
  Future<List<PlantsResponseModel>> getAvailablePlants();
  Future<List<PlantsResponseModel>> getSearchAvailablePlants(String name);
  Future<PlantDetailsResponseModel> getPlantDetails(int plantId);
  Future<List<LocationPlantResponseModel>> getPlantLocation(int plantId);
  Future<PlantingArticleResponseModel> getPlantingArticle(
      int plantId, String location);
  Future<WateringArticleResponse> getWateringArticle(int plantId);
  Future<TempArticleResponseModel> getTemperatureArticle(int plantId);
  Future<FertilizingArticleResponseModel> getFertilizingArticle(int plantId);

  Future<void> deleteMyPlants(List<int> myPlantIds);
  Future<void> addMyPlant(
      {required plantId, required String location, required String namedPlant});

  Future<List<ArticleResponseModel>> getTrendingArticle();
  Future<AllProductsResponseModel> getAllProducts();
  //-------- Register Endpoint ---------
  Future<void> registerEndpoint(User user);

  //-------- Login Endpoint ---------
  Future<String> loginEndpoint(String email, String password);
  //-------- Check Email Endpoint ---------
  Future<int> checkEmailValidEndpoint(String email);
  //-------- Reset Password Endpoint ---------
  Future<void> resetPasswordEndpoint(
    int userId,
    String newPassword,
  );
}
