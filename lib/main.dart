import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_flutter/my_app.dart';
import 'package:mobile_flutter/utils/http_overriding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpOverriding();

  // await Future.delayed(const Duration(seconds: 3));
  // FlutterNativeSplash.remove();

  runApp(const MyApp());
}
