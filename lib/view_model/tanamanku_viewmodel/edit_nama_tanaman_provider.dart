import 'package:flutter/material.dart';

class EditNamaTanamanProvider with ChangeNotifier {
  String? validateName(value) {
    if (value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }
}
