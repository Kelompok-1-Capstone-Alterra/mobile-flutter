import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';

import 'package:mobile_flutter/models/plant_stats_model.dart';
import 'package:mobile_flutter/models/profile_model.dart';
import 'package:mobile_flutter/services/services_restapi.dart';

import '../models/user_model.dart';

class ServicesRestApiImpl extends ServicesRestApi {
  static const String baseUrl = 'https://34.128.85.215:8080';

  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
  // Buat instance Dio
  @override
  void contohEndpoint() {
    // TODO: implement contohEndpoint
  }

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
  Future<ProfileModel> getProfile() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://6475e319e607ba4797dcd15f.mockapi.io/users/profiles/users/1');
      final profile = ProfileModel.fromJson(response.data);
      return profile;
    } on DioError catch (e) {
      throw Exception(e.toString());
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
  Future<void> changeName(newName) async {
    final dio = Dio();

    try {
      Map name = {"name": newName};
      final response = await dio.put(
          'https://6475e319e607ba4797dcd15f.mockapi.io/users/profiles/users/1',
          data: name);
      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> changePassword(newPassword) async {
    final dio = Dio();

    try {
      Map password = {"password": newPassword};
      final response = await dio.put(
          'https://6475e319e607ba4797dcd15f.mockapi.io/users/profiles/users/1',
          data: password);
      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
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
  Future<void> putImage(File file) async {
    final dio = Dio();

    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          "picture": await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      final response = await dio.put(
          'https://6475e319e607ba4797dcd15f.mockapi.io/users/profiles/users/1',
          data: formData);
      print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
