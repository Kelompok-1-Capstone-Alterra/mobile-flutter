import 'package:dio/dio.dart';
import 'package:mobile_flutter/models/all_product_response_model.dart';
import 'package:mobile_flutter/models/my_plant_name_response_model.dart';
import 'package:mobile_flutter/models/overview_response_model.dart';
import 'package:mobile_flutter/models/plants_response_model.dart';
import 'package:mobile_flutter/models/progres_detail_response_model.dart';
import 'package:mobile_flutter/models/progres_response_model.dart';

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

  Future<void> deleteMyPlants(List<int> myPlantIds);

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

  // Explore Monitoring Fauzi
  Future<MyPlantNameResponseModel> getMyPlantName(int idTanaman);
  Future<OverviewResponseModel> getOverview(int idTanaman);
  Future<List<ProgresResponseModel>> getProgres(int idTanaman);
  Future<ProgresDetailResponseModel> getProgresDetail(
    int idTanaman,
    int idProgress,
  );
  Future<void> addWeeklyProgress(
    int idTanaman,
    String? condition,
    String? description,
    List<String>? pictures,
  );
  Future<List<String>> addPhoto(FormData formData);
  Future<void> addFertilizing(int idTanaman);
  Future<void> addWatering(int idTanaman);
  Future<void> addDeadProgress(
    int idTanaman,
    String? condition,
    String? description,
    List<String>? pictures,
  );
}
