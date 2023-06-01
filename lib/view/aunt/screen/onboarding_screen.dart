import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/view/aunt/screen/register_screen.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/shared_preferences_provider.dart';
import 'package:provider/provider.dart';

class OnBroadingScreen extends StatefulWidget {
  const OnBroadingScreen({super.key});

  @override
  State<OnBroadingScreen> createState() => _OnBroadingScreenState();
}

class _OnBroadingScreenState extends State<OnBroadingScreen> {
  void _toRegister() {
    Provider.of<SharedPreferencesProvider>(context, listen: false)
        .completeOnboarding();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RegisterScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  void _toLogin() {
    Provider.of<SharedPreferencesProvider>(context, listen: false)
        .completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Buat Akun Baru',
        finishButtonTextStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: neutral[10]),
        onFinish: () => _toRegister(),
        finishButtonStyle: const FinishButtonStyle(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          backgroundColor: primary,
        ),
        skipTextButton: Text(
          'Skip',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: error),
        ),
        trailing: Text(
          'Login',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        trailingFunction: () => _toLogin(),
        controllerColor: primary,
        totalPage: 3,
        headerBackgroundColor: Colors.white,
        pageBackgroundColor: Colors.white,
        centerBackground: true,
        background: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              height: screenHeight * 0.4,
              child: SvgPicture.asset('assets/svg/onboarding_1.svg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              height: screenHeight * 0.4,
              child: SvgPicture.asset('assets/svg/onboarding_2.svg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              height: screenHeight * 0.4,
              child: SvgPicture.asset('assets/svg/onboarding_3.svg'),
            ),
          ),
        ],
        speed: 1.8,
        pageBodies: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 414,
                ),
                Text(
                  'Monitoring tanamanmu dengan Agriplan',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Agriplan siap membantu anda memonitoring kondisi dan meningkatkan produktivitas tanaman anda.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 414,
                ),
                Text(
                  'Pantau Kondisi tanaman secara real-time',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Dengan Agriplan, pantau kondisi tanaman secara real-time dan mengoptimalkan pengelolaan tanaman anda.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 414,
                ),
                Text(
                  'Gabung dan pantau tanamanmu sekarang juga',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Daftar dan mulai memanfaatkan fitur-fitur AgriPlan untuk kesuksesan tanaman Anda.',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
