import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/aunt/screen/login_screen.dart';
import 'package:mobile_flutter/view/aunt/screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/widget/bottom_navbar/custom_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      _toOnBoarding();
    } else {
      // Periksa status login
      checkLoginStatus();
    }
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // Navigasi ke halaman utama karena pengguna sudah login
      _toHome();
    } else {
      // Tampilkan halaman login karena pengguna belum login
      _toLogin();
    }
  }

  void _toHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const CustomBottomNavbar(),
      ),
    );
  }

  void _toLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _toOnBoarding() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnBroadingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    checkOnboardingStatus();
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
