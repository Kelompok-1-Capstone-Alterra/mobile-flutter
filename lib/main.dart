import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_flutter/my_app.dart';
import 'package:mobile_flutter/utils/http_overriding.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Provider.debugCheckInvalidValueType = null;

  HttpOverrides.global = HttpOverriding();

  // await Future.delayed(const Duration(seconds: 3));
  // FlutterNativeSplash.remove();

  runApp(const MyApp());
}
