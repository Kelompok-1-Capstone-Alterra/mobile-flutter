import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/theme.dart';
import 'package:mobile_flutter/utils/widget/bottom_navbar/custom_navbar_provider.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:mobile_flutter/view_model/dashboard_viewmodel/dashboard_provider.dart';
import 'package:mobile_flutter/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomNavbarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agriplan - App',
        theme: agriplantLight,
        home: const HomeScreen(),
      ),
    );
  }
}
