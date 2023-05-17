import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/theme.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'Agriplan - App',
        theme: agriplantLight,
        home: const HomeScreen(),
      ),
    );
  }
}
