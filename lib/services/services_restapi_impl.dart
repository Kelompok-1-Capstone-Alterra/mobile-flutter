import 'dart:io';
import 'dart:math';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_flutter/models/article_by_id_response_model.dart';
import 'package:mobile_flutter/models/plant_stats_model.dart';
import 'package:mobile_flutter/models/profile_model.dart';
import 'package:mobile_flutter/models/article_response_model.dart';
import 'package:mobile_flutter/models/fertilizing_article_response_model.dart';
import 'package:mobile_flutter/models/location_plant_response_model.dart';
import 'package:mobile_flutter/models/plant_details_reponse_model.dart';
import 'package:mobile_flutter/models/planting_article_response_model.dart';
import 'package:mobile_flutter/models/my_plant_name_response_model.dart';
import 'package:mobile_flutter/models/overview_response_model.dart';
import 'package:mobile_flutter/models/plants_response_model.dart';
import 'package:mobile_flutter/models/temperature_article_response_model.dart';
import 'package:mobile_flutter/models/watering_article_response_model.dart';
import 'package:mobile_flutter/models/progres_detail_response_model.dart';
import 'package:mobile_flutter/models/progres_response_model.dart';
import 'package:mobile_flutter/models/weather_response_model.dart';
import 'package:mobile_flutter/services/services_restapi.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/dio/global_dio.dart';
import 'package:mobile_flutter/utils/keys/navigator_keys.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/api_response.dart';
import 'package:mobile_flutter/utils/response_dummy/explore_monitoring/my_plants_response.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/shared_preferences_provider.dart';
import 'package:provider/provider.dart';
import '../models/add_my_plant_response_model.dart';
import '../models/all_product_response_model.dart';
import '../models/article_weather_response_model.dart';
import '../models/available_plant_response_model.dart';
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
  Future<String> getUsername() async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/profiles/name',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      if (response.data['data'] == null || response.data['data'] == "") {
        return "";
      } else {
        final String name = response.data['data'];
        return name;
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ArticleWeatherResponseModel> getWeatherArticle(
      {required int labelId}) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/weather/$labelId',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      return ArticleWeatherResponseModel.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<WeatherResponseModel?> getWeather(
      {required double latitude, required double longitude}) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/weather/$latitude/$longitude',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      final result = WeatherResponseModel.fromJson(response.data['data']);
      return result;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MyPlantsResponseModel>> getMyPlants() async {
    try {
      List<MyPlantsResponseModel> plantsData = [];
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
        plantsData.add(MyPlantsResponseModel.fromJson(json));
      }

      return plantsData;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<AvailablePlantResponseModel>> getAvailablePlants() async {
    try {
      List<AvailablePlantResponseModel> availablePlants = [];
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/plants',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.data['data'] != null) {
        for (var element in response.data['data']) {
          availablePlants.add(AvailablePlantResponseModel.fromJson(element));
        }
      }
      return availablePlants;
    } on DioError catch (e) {
      // print(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<AvailablePlantResponseModel>> getSearchAvailablePlants(
      String name) async {
    try {
      List<AvailablePlantResponseModel> searchResult = [];
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/plants/search?name=$name',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.data['data'] != null) {
        for (var json in response.data['data']) {
          searchResult.add(AvailablePlantResponseModel.fromJson(json));
        }
      }
      return searchResult;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PlantDetailsResponseModel> getPlantDetails(int plantId) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/plants/$plantId',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      final details = PlantDetailsResponseModel.fromJson(response.data['data']);
      return details;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<LocationPlantResponseModel>> getPlantLocation(int plantId) async {
    try {
      List<LocationPlantResponseModel> plantLocation = [];

      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/plants/$plantId/location',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.data['data'] != null) {
        for (var json in response.data['data']) {
          plantLocation.add(LocationPlantResponseModel.fromJson(json));
        }
      }
      return plantLocation;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ArticleResponseModel>> getTrendingArticle() async {
    try {
      List<ArticleResponseModel> articleData = [];
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/users/articles/trending',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      //progress dummy wait 1 second
      await Future.delayed(
        const Duration(seconds: 1),
        //
      );

      if (response.data['data'] != null) {
        for (var json in response.data['data']) {
          articleData.add(ArticleResponseModel.fromJson(json));
        }
      }
      return articleData;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<WateringArticleResponse> getWateringArticle(int plantId) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/articles/watering/$plantId',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      final resultArticle =
          WateringArticleResponse.fromJson(response.data['data']);
      return resultArticle;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<TempArticleResponseModel> getTemperatureArticle(int plantId) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/articles/temperature/$plantId',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      final resultArticle =
          TempArticleResponseModel.fromJson(response.data['data']);
      return resultArticle;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<FertilizingArticleResponseModel> getFertilizingArticle(
      int plantId) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/articles/fertilizing/$plantId',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      final resultArticle =
          FertilizingArticleResponseModel.fromJson(response.data['data']);
      return resultArticle;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PlantingArticleResponseModel> getPlantingArticle(
      int plantId, String location) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/articles/planting/$plantId/$location',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      final resultArticle =
          PlantingArticleResponseModel.fromJson(response.data['data']);
      return resultArticle;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AllProductsResponseModel> getAllProducts() async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/users/products',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      final model = AllProductsResponseModel.fromJson(response.data['data']);
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
  Future<AddMyplantResponseModel> addMyPlant(
      {required plantId,
      required String location,
      required String namedPlant}) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.post(
        '/auth/plants/$plantId',
        data: {"location": location, "name": namedPlant},
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      final result = AddMyplantResponseModel.fromJson(response.data['data']);
      return result;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  // Fauzi Section
  @override
  Future<MyPlantNameResponseModel> getMyPlantName(int idTanaman) async {
    try {
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
  Future<OverviewResponseModel> getOverview(int idTanaman) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/plants/$idTanaman/overview',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      final model = OverviewResponseModel.fromJson(response.data['data']);

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

  @override
  Future<ProgresDetailResponseModel> getProgresDetail(
      int idTanaman, int idProgress) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/plants/$idTanaman/progress/$idProgress',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      await Future.delayed(const Duration(seconds: 1));

      final model = ProgresDetailResponseModel.fromJson(response.data['data']);

      return model;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addWeeklyProgress(
    int idTanaman,
    String? condition,
    String? description,
    List<String>? pictures,
  ) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      await Future.delayed(const Duration(seconds: 1));

      List<Map<String, String>> weeklyPictures = [];

      if (pictures != null) {
        weeklyPictures = pictures.map((url) => {'url': url}).toList();
      }

      var jsonData = jsonEncode({
        'condition': condition,
        'description': description,
        'weekly_pictures': weeklyPictures,
      });

      await _dioWithInterceptor.post(
        '/auth/users/plants/$idTanaman/progress',
        data: jsonData,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<String>> addPhoto(FormData formData) async {
    try {
      var response = await _dioWithInterceptor.post(
        '/pictures',
        data: formData,
      );

      var responseData = response.data as Map<String, dynamic>;
      List<String> imageUrl = List<String>.from(responseData['urls']);
      return imageUrl;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addFertilizing(int idTanaman) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      await _dioWithInterceptor.post(
        '/auth/users/plants/$idTanaman/fertilizing',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addWatering(int idTanaman) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      await _dioWithInterceptor.post(
        '/auth/users/plants/$idTanaman/watering',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addDeadProgress(
    int idTanaman,
    String? condition,
    String? description,
    List<String>? pictures,
  ) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      await Future.delayed(const Duration(seconds: 1));

      List<Map<String, String>> weeklyPictures = [];

      if (pictures != null) {
        weeklyPictures = pictures.map((url) => {'url': url}).toList();
      }

      var jsonData = jsonEncode({
        'condition': condition,
        'description': description,
        'weekly_pictures': weeklyPictures,
      });

      await _dioWithInterceptor.post(
        '/auth/users/plants/$idTanaman/progress/dead',
        data: jsonData,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addHarvestProgress(
    int idTanaman,
    String? condition,
    String? description,
    List<String>? pictures,
  ) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      await Future.delayed(const Duration(seconds: 1));

      List<Map<String, String>> weeklyPictures = [];

      if (pictures != null) {
        weeklyPictures = pictures.map((url) => {'url': url}).toList();
      }

      var jsonData = jsonEncode({
        'condition': condition,
        'description': description,
        'weekly_pictures': weeklyPictures,
      });

      print(jsonData);

      await _dioWithInterceptor.post(
        '/auth/users/plants/$idTanaman/progress/harvest',
        data: jsonData,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      print(e.toString());
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

  // ------------------------------------- ------------- --------------------------------
  // ---------------------------------------- settings ----------------------------------
  // ------------------------------------- ------------- --------------------------------

  @override
  Future<ProfileModel> getProfile() async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      final response = await _dioWithInterceptor.get(
        '/auth/users/profiles',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      final profile = ProfileModel.fromJson(response.data['data']);

      return profile;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> changeName(newName) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      Map name = {'name': newName};

      await _dioWithInterceptor.put(
        '/auth/users/profiles/name',
        data: name,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> changePassword(newPassword) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      Map password = {'password': newPassword};

      await _dioWithInterceptor.put(
        '/auth/users/profiles/password',
        data: password,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  // @override
  // Future<List<PlantStatsModel>> getPlantStats(status) async {
  //   try {
  //     String token = await Provider.of<SharedPreferencesProvider>(
  //             navigatorKeys.currentContext!,
  //             listen: false)
  //         .getToken();
  //     final response = await _dioWithInterceptor.get(
  //       '/auth/users/plants/stats',
  //       queryParameters: {'status': status},
  //       options: Options(
  //         headers: {
  //           'Authorization': token,
  //         },
  //       ),
  //     );

  //     List<dynamic> data = response.data['data'];
  //     List<PlantStatsModel> plantStats =
  //         data.map((item) => PlantStatsModel.fromJson(item)).toList();

  //     return plantStats;
  //   } on DioError catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // with mockapi
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
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      Map data = {
        "phone": phone,
        "email": email,
        "message": message,
      };

      await _dioWithInterceptor.post(
        '/auth/users/helps',
        data: data,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> sendSuggestion(String message) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      Map data = {
        "message": message,
      };

      await _dioWithInterceptor.post(
        '/auth/users/suggestions',
        data: data,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
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

      final response =
          await _dioWithInterceptor.post('/pictures', data: formData);
      final image = response.data["urls"][0];
      return image;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateProfilePic(String pic) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();

      Map data = {'picture': pic};

      await _dioWithInterceptor.put(
        '/auth/users/profiles/pictures',
        data: data,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  // ------------------------------------- ------------- --------------------------------
  // ---------------------------------------- Artikel ----------------------------------
  // ------------------------------------- ------------- --------------------------------
  @override
  Future<List<ArticleResponseModel>> getLatestArticles() async {
    try {
      List<ArticleResponseModel> articleData = [];
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/articles/latest',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      //progress wait 1 second
      await Future.delayed(const Duration(seconds: 1));

      if (response.data['data'] != null) {
        for (var json in response.data['data']) {
          articleData.add(ArticleResponseModel.fromJson(json));
        }
      }

      return articleData;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ArticleByIdResponseModel>> getArtikelById(int artikelId) async {
    try {
      List<ArticleByIdResponseModel> articleData = [];
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/articles/$artikelId',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      //progress wait 1 second
      await Future.delayed(const Duration(seconds: 1));

      if (response.data['data'] != null) {
        for (var json in response.data['data']) {
          articleData.add(ArticleByIdResponseModel.fromJson(json));
        }
      }

      return articleData;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ArticleResponseModel>> getLikedArticles() async {
    try {
      List<ArticleResponseModel> articleData = [];
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      final response = await _dioWithInterceptor.get(
        '/auth/users/articles/liked',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      //progress wait 1 second
      await Future.delayed(const Duration(seconds: 1));

      if (response.data['data'] != null) {
        for (var json in response.data['data']) {
          articleData.add(ArticleResponseModel.fromJson(json));
        }
      }

      return articleData;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> like(int articleId) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      await _dioWithInterceptor.post(
        '/auth/users/articles/$articleId/liked',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> unLike(int articleId) async {
    try {
      String token = await Provider.of<SharedPreferencesProvider>(
              navigatorKeys.currentContext!,
              listen: false)
          .getToken();
      await _dioWithInterceptor.delete(
        '/auth/users/articles/$articleId/liked',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
