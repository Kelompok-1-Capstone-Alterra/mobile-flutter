import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_flutter/my_app.dart';
import 'package:provider/provider.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Provider.debugCheckInvalidValueType = null;

  HttpOverrides.global = PostHttpOverrides();

  // await Future.delayed(const Duration(seconds: 3));
  // FlutterNativeSplash.remove();

  runApp(const MyApp());
}
