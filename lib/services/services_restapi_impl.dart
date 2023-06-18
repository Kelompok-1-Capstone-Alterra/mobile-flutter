import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:mobile_flutter/models/plant_stats_model.dart';
import 'package:mobile_flutter/models/profile_model.dart';
import 'package:mobile_flutter/models/article_response_model.dart';
import 'package:mobile_flutter/models/plants_response_model.dart';
import 'package:mobile_flutter/models/weather_response_model.dart';
import 'package:mobile_flutter/services/services_restapi.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/all_products_response.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/my_plants_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/all_product_response_model.dart';
import '../utils/response_dummy/explore_monitoring/article_trending_response.dart';
import '../utils/response_dummy/explore_monitoring/weather_response.dart';
import '../models/user_model.dart';

class ServicesRestApiImpl extends ServicesRestApi {
  //--singleton--
  static final ServicesRestApiImpl _instance = ServicesRestApiImpl._internal();
  ServicesRestApiImpl._internal();
  factory ServicesRestApiImpl() {
    return _instance;
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
    ),
  );
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

// ------------------------------------- ------------- ----------------------------------
// ------------------------------------- MEMBERSHIP--------------------------------------
// ------------------------------------- ------------- ----------------------------------
  @override
  Future<void> registerEndpoint(User user) async {
    try {
      // Lakukan permintaan POST ke endpoint registrasi
      await _dio.post(
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
      final response = await _dio.post(
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
      final response = await _dio.get(
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
      await _dio.put(
        '/users/$userId/password',
        data: {'password': newPassword},
      );
    } catch (error) {
      throw Exception(e);
    }
  }

  // ------------------------------------- ------------- --------------------------------
  // ---------------------------------------- settings ----------------------------------
  // ------------------------------------- ------------- --------------------------------

  @override
  Future<ProfileModel> getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('/auth/users/profiles');
      final profile = ProfileModel.fromJson(response.data['data']);
      print(response.statusCode);
      print(response.data['data']);
      return profile;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> changeName(newName) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      _dio.options.headers['Authorization'] = 'Bearer $token';
      Map name = {'name': newName};
      final response = await _dio.put('/auth/users/profiles/name', data: name);
      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> changePassword(newPassword) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      _dio.options.headers['Authorization'] = 'Bearer $token';
      Map password = {"password": newPassword};
      final response =
          await _dio.put('/auth/users/profiles/password', data: password);
      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<PlantStatsModel>> getPlantStats(status) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://6475e319e607ba4797dcd15f.mockapi.io/users/profiles/plantstats',
        queryParameters: {'status': status},
      );

      List<dynamic> data = response.data;
      List<PlantStatsModel> plantStats =
          data.map((item) => PlantStatsModel.fromJson(item)).toList();

      return plantStats;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

 

  @override
  Future<void> sendComplaintEmails(phone, email, message) async {
    final dio = Dio();
    try {
      Map data = {
        "phone": phone,
        "email": email,
        "message": message,
      };
      final response =
          await dio.put('https://34.128.85.215:8080/users/helps', data: data);
      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> sendSuggestion(String message) async {
    final dio = Dio();
    try {
      Map data = {
        "message": message,
      };
      final response =
          await dio.put('https://34.128.85.215:8080/users/helps', data: data);
      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> uploadProfilePic(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          "pictures": await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      final response = await _dio.post('/pictures', data: formData);
      final image = response.data["urls"][0];
      print(response.statusCode);
      print(image);
      return image;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateProfilePic(String pic) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      _dio.options.headers['Authorization'] = 'Bearer $token';

      Map data = {'picture': pic};

      final response =
          await _dio.put('/auth/users/profiles/pictures', data: data);

      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
