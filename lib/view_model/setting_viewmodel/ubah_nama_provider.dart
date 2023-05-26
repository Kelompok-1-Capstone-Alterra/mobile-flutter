import 'package:flutter/material.dart';

class UbahNamaProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController ubahNamaC = TextEditingController();

  bool isValid = true;

  String? validatorUbahNama(String nama) {
    if (nama.length < 2) {
      return 'Min. 2 Karakter dan Maks. 30 Karakter';
    }
    return null;
  }

  void setValidity(bool value) {
    isValid = value;
    notifyListeners();
  }
}
