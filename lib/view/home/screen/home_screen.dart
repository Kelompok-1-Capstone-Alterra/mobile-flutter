import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/bottom_navbar/custom_bottom_navbar.dart';
import 'package:mobile_flutter/view/aunt/screen/login_screen.dart';
import 'package:mobile_flutter/view/aunt/screen/onboarding_screen.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/shared_preferences_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SharedPreferencesProvider>(
        builder: (context, sharedPrefs, _) {
          if (sharedPrefs.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (sharedPrefs.isFirstTime) {
            return const OnBroadingScreen();
          } else if (sharedPrefs.isLoggedIn) {
            return const CustomBottomNavbar();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
