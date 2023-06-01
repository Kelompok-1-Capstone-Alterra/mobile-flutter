import 'package:flutter/material.dart';

class ChangePasswordProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController changePasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordObscureText = true;
  bool confirmObscureText = true;

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
    notifyListeners();
  }
}
