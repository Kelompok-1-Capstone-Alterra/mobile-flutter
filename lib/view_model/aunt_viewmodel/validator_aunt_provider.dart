import 'package:flutter/material.dart';

class ValidatorProvider extends ChangeNotifier {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Format email salah';
    }

    return null; // validasi berhasil
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Minimal 8 karakter';
    }

    return null; // validasi berhasil
  }

  String? validateComfrimPassword(
    String? value,
    String? confirmpasswordController,
    String? passwordController,
  ) {
    // print(confirmpasswordController);
    // print(passwordController);
    if (value == null || value.isEmpty) {
      return 'Konformasi Kata sandi tidak boleh kosong';
    } else if (value.length < 8) {
      return 'Minimal 8 karakter';
    } else if (confirmpasswordController != passwordController) {
      return "Kata sandi tidak sesuai";
    } else {
      return null; // validasi berhasil
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (value.length < 2) {
      return 'Minimal 2 karakter';
    }
    return null; // validasi berhasil
  }
}
