import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/services_restapi_impl.dart';

class SharedPreferencesProvider with ChangeNotifier {
  bool _isFirstTime = true;
  bool _isLoggedIn = false;
  bool _isLoading = true;

  SharedPreferencesProvider() {
    checkOnboardingStatus();
    checkLoginStatus();
  }

  bool get isFirstTime => _isFirstTime;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  void checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isFirstTime = prefs.getBool('isFirstTime') ?? true;
    _isLoading = false;
    notifyListeners();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
    _isFirstTime = false;
    notifyListeners();
  }

  final Dio dio = Dio();

  Future<void> login({required String email, required String password}) async {
    final String token =
        await ServicesRestApiImpl().loginEndpoint(email, password);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    dio.options.headers['Authorization'] = 'Bearer $token';
    prefs.setBool('isLoggedIn', true);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    _isLoggedIn = false;
    bool? token = await prefs.remove('token');
    if (token == true) {
      token = null;
    }
    dio.options.headers['Authorization'] = '$token';
    // print(dio.options.headers['Authorization']);
    notifyListeners();
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      _isLoading = true;
    }
    _isLoading = false;
    dio.options.headers['Authorization'] = 'Bearer $token';
    // print(dio.options.headers['Authorization']);
    return dio.options.headers['Authorization'];
  }
}
