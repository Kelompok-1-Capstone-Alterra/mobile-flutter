import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController changePasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordObscureText = true;
  bool confirmObscureText = true;
  bool _isError = false;

  late int _userId;
  int get userId => _userId;
  bool get isError => _isError;

  void setIsError(bool value) {
    _isError = value;
    notifyListeners();
  }

  void controllerEmailClear() {
    emailController.clear();
    _isError = false;
    notifyListeners();
  }

  void sandiObscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    notifyListeners();
  }

  void konfirmasiObscureTextStatus() {
    confirmObscureText = !confirmObscureText;
    notifyListeners();
  }

  void controllerClear() {
    changePasswordController.clear();
    confirmPasswordController.clear();
    passwordObscureText = true;
    confirmObscureText = true;
    _isError = false;
    notifyListeners();
  }

  set userId(int value) {
    _userId = value;
    notifyListeners();
  }
}
