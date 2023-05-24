import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      duration: const Duration(milliseconds: 3000),
      defaultNextScreen: const HomeScreen(),
      backgroundColor: primary,
      splashScreenBody: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset('assets/images/logo-white.png'),
            ),
            const Spacer(),
            Text(
              "V 1.0",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: neutral[10]),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
