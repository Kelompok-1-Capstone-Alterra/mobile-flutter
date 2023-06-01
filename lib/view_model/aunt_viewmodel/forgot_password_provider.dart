import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  void controllerClear() {
    emailController.clear();
    notifyListeners();
  }
}
