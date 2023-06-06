import 'dart:math';

import 'package:dio/dio.dart';
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
}
