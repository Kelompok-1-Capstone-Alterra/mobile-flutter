import 'package:flutter/material.dart';
import 'package:mobile_flutter/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Future.delayed(const Duration(seconds: 3));
  // FlutterNativeSplash.remove();

  runApp(const MyApp());
}
