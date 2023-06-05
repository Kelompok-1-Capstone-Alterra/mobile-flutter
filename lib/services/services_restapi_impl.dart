import 'package:dio/dio.dart';
import 'package:mobile_flutter/models/plants_response_model.dart';
import 'package:mobile_flutter/models/weather_response_model.dart';
import 'package:mobile_flutter/services/services_restapi.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/my_plants_response.dart';

import '../utils/response_dummy/explore_monitoring/weather_response.dart';

class ServicesRestApiImpl extends ServicesRestApi {
  //--singleton--
  static final ServicesRestApiImpl _instance = ServicesRestApiImpl._internal();
  ServicesRestApiImpl._internal();
  factory ServicesRestApiImpl() {
    return _instance;
  }

  // final Dio _dio = Dio();

  @override
  void contohEndpoint() {}

  @override
  Future<WeatherResponseModel?> getWeather(
      {required double latitude, required double longitude}) async {
    try {
      //
      // final response = await _dio.get(
      //   '/users/weather',
      // );
      // final model = WeatherResponseModel.fromJson(response.data);

      //progress dummy wait 2 second
      await Future.delayed(
        const Duration(seconds: 2),
      );
      //
      final model = WeatherResponseModel.fromJson(weatherResponse);
      return model;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<PlantsResponseModel>> getMyPlants() async {
    try {
      List<PlantsResponseModel> plantsData = [];
      //
      // final response = await _dio.get(
      //   '/users/plants',
      // );
      // final model = PlantsResponseModel.fromJson(response.data);

      //progress dummy wait 2 second
      await Future.delayed(
        const Duration(seconds: 2),
        //
      );

      for (var json in myPlantSResponse) {
        plantsData.add(PlantsResponseModel.fromJson(json));
      }

      return plantsData;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
