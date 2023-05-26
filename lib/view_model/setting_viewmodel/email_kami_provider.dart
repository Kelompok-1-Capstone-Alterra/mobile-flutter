import 'package:flutter/material.dart';

class EmailKamiProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nomorHpC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController catatanC = TextEditingController();

  bool isValid = false;
  void setValidity(bool value) {
    isValid = value;
    notifyListeners();
  }
}
