import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_flutter/my_app.dart';
import 'package:mobile_flutter/utils/http_overriding.dart';
import 'package:mobile_flutter/utils/network_checker/depedency_injector.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpOverriding();
  Provider.debugCheckInvalidValueType = null;

  runApp(const MyApp());
  DepedencyInjection.init();
}
