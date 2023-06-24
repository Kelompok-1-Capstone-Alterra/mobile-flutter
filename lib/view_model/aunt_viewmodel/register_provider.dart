import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordObscureText = true;
  bool _isError = false;
  bool _isEmailError = false;

  bool get isError => _isError;
  bool get isEmailError => _isEmailError;

  void setIsError(bool value) {
    _isError = value;
    notifyListeners();
  }

  void setIsEmailError(bool value) {
    _isEmailError = value;
    notifyListeners();
  }

  void sandiObscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    notifyListeners();
  }

  void controllerClear() {
    namaController.clear();
    emailController.clear();
    passwordController.clear();
    passwordObscureText = true;
    _isError = false;
    _isEmailError = false;
    notifyListeners();
  }
}
