import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordObscureText = true;

  void sandiObscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    notifyListeners();
  }

  void controllerClear() {
    namaController.clear();
    emailController.clear();
    passwordController.clear();
    passwordObscureText = true;
    notifyListeners();
  }
}
