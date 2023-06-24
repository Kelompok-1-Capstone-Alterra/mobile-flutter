import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordObscureText = true;
  bool _isError = false;
  bool _visible = false;

  bool get isError => _isError;
  bool get visibled => _visible;

  void setIsVisible(bool value) {
    _visible = value;
    notifyListeners();
  }

  void setIsError(bool value) {
    _isError = value;
    notifyListeners();
  }

  void passwordObscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    notifyListeners();
  }

  void controllerClear() {
    emailController.clear();
    passwordController.clear();
    passwordObscureText = true;
    _isError = false;
    _visible = false;
    notifyListeners();
  }
}
