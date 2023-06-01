import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordObscureText = true;

  void passwordObscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    notifyListeners();
  }

  void controllerClear() {
    emailController.clear();
    passwordController.clear();
    passwordObscureText = true;
    notifyListeners();
  }
}
