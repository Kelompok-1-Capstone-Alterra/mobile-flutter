import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
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
      resizeToAvoidBottomInset: false,
      body: Consumer<SharedPreferencesProvider>(
        builder: (context, sharedPrefs, _) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: _buildPage(sharedPrefs),
          );
        },
      ),
    );
  }

  Widget _buildPage(SharedPreferencesProvider sharedPrefs) {
    if (sharedPrefs.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: primary,
        ),
      );
    } else if (sharedPrefs.isFirstTime) {
      return const OnBroadingScreen();
    } else if (sharedPrefs.isLoggedIn) {
      return const CustomBottomNavbar();
    } else {
      return const LoginScreen();
    }
  }
}
