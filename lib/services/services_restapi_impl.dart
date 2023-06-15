import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_flutter/models/article_response_model.dart';
import 'package:mobile_flutter/models/my_plant_name_response_model.dart';
import 'package:mobile_flutter/models/plants_response_model.dart';
import 'package:mobile_flutter/models/progres_response_model.dart';
import 'package:mobile_flutter/models/weather_response_model.dart';
import 'dart:math';

import 'package:mobile_flutter/services/services_restapi.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/dio/global_dio.dart';
import 'package:mobile_flutter/utils/keys/navigator_keys.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/all_products_response.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/api_response.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/my_plants_response.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/shared_preferences_provider.dart';
import 'package:provider/provider.dart';

import '../models/all_product_response_model.dart';
import '../utils/response_dummy/explore_monitoring/article_trending_response.dart';
import '../utils/response_dummy/explore_monitoring/available_plants_response.dart';
import '../utils/response_dummy/explore_monitoring/weather_response.dart';

import '../models/user_model.dart';

class ServicesRestApiImpl extends ServicesRestApi {
  //--singleton--
  static final ServicesRestApiImpl _instance = ServicesRestApiImpl._internal();
  ServicesRestApiImpl._internal();
  factory ServicesRestApiImpl() {
    return _instance;
  }

  final Dio _dioWithoutInterceptor = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
    ),
  );

  final _dioWithInterceptor = DioGlobal().globalDio;

  // Buat instance Dio
  @override
  void contohEndpoint() {}

// ------------------------------------- ------------- ----------------------------------
// ------------------------------------- exlore monitoring-------------------------------
// ------------------------------------- ------------- ----------------------------------
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

  @override
  Future<List<PlantsResponseModel>> getAvailablePlants() async {
    try {
      List<PlantsResponseModel> availablePlants = [];
      //
      // final response = await _dio.get(
      //   '/auth/plants',
      // );
      // final model = PlantsResponseModel.fromJson(response.data);

      //progress dummy wait 2 second
      await Future.delayed(
        const Duration(seconds: 2),
        //
      );

      for (var json in availablePlantsResponse) {
        availablePlants.add(PlantsResponseModel.fromJson(json));
      }

      return availablePlants;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ArticleResponseModel>> getTrendingArticle() async {
    try {
      List<ArticleResponseModel> articleData = [];
      //
      // final response = await _dio.get(
      //   '/users/articles/trending',
      // );
      // final model = ArticleResponseModel.fromJson(response.data);

      //progress dummy wait 2 second
      await Future.delayed(
        const Duration(seconds: 2),
        //
      );

      for (var json in articleTrendingResponse) {
        articleData.add(ArticleResponseModel.fromJson(json));
      }

      return articleData;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AllProductsResponseModel> getAllProducts() async {
    try {
      //
      // final response = await _dio.get(
      //   '/users/articles/trending',
      // );
      // final model = ArticleResponseModel.fromJson(response.data);

      //progress dummy wait 2 second
      await Future.delayed(
        const Duration(seconds: 2),
      );

      final model = AllProductsResponseModel.fromJson(allProductResponse);
      return model;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future deleteMyPlants(List<int> myPlantIds) async {
    try {
      // final response = await _dio.delete(
      //   '/users/plants',
      //   data: {"myplant_id": myPlantIds},
      // );
      // return response.statusCode;

      //progress dummy wait 2 second
      await Future.delayed(
        const Duration(seconds: 2),
      );
      return 200;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<MyPlantNameResponseModel> getMyPlantName(int idTanaman) async {
    try {
      // final response = await _dio.get(
      //   '/genre/movie/list',
      //   queryParameters: {'language': language},
      // );

      await Future.delayed(const Duration(seconds: 1));

      String contents = ApiResponse.getMyPlantName;
      Map<String, dynamic> jsonResponse = jsonDecode(contents);

      final model = MyPlantNameResponseModel.fromJson(jsonResponse);

      return model;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProgresResponseModel>> getProgres(int idTanaman) async {
    try {
      List<ProgresResponseModel> weeklyProgressList = [];
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/users/plants/$idTanaman/progress',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      await Future.delayed(const Duration(seconds: 1));

      if (response.data['data'] != null) {
        weeklyProgressList = List<ProgresResponseModel>.from(
            response.data['data'].map((x) => ProgresResponseModel.fromJson(x)));
      }

      return weeklyProgressList;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

// ------------------------------------- ------------- ----------------------------------
// ------------------------------------- MEMBERSHIP--------------------------------------
// ------------------------------------- ------------- ----------------------------------
  @override
  Future<void> registerEndpoint(User user) async {
    try {
      // Lakukan permintaan POST ke endpoint registrasi
      await _dioWithoutInterceptor.post(
        '/users/register',
        data: user.toJson(),
      );
    } catch (e) {
      // jika email sudah terdaftar
      if (e is DioError && e.response?.statusCode == 400) {
        throw Exception('Email sudah terdaftar.');
      }
      throw Exception('Terjadi kesalahan saat mendaftar.');
    }
  }

  @override
  Future<String> loginEndpoint(String email, String password) async {
    try {
      // Lakukan permintaan POST ke endpoint login
      final response = await _dioWithoutInterceptor.post(
        '/users/login',
        data: {'email': email, 'password': password},
      );
      final String token = response.data['token'];
      // _dio.options.headers['Authorization'] = 'Bearer $token';
      return token;
    } catch (e) {
      // jika email sudah terdaftar
      if (e is DioError && e.response?.statusCode == 401) {
        throw Exception('Email atau kata sandi salah.');
      }
      throw Exception('Terjadi kesalahan saat login.');
    }
  }

  @override
  Future<int> checkEmailValidEndpoint(String email) async {
    try {
      final response = await _dioWithoutInterceptor.get(
        '/users/emails/check',
        data: {'email': email},
      );

      final int userId = response.data['user_id'];
      return userId;
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 404) {
        throw Exception('Email tidak terdaftar.');
      }
      throw Exception('Terjadi kesalahan.');
    }
  }

  @override
  Future<void> resetPasswordEndpoint(int userId, String newPassword) async {
    try {
      await _dioWithoutInterceptor.put(
        '/users/$userId/password',
        data: {'password': newPassword},
      );
    } catch (error) {
      throw Exception(e);
    }
  }
}
