import 'package:flutter/material.dart';

class SettingValidatorProvider with ChangeNotifier {
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (value.length < 2) {
      return 'Minimal 2 karakter';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Minimal 8 karakter';
    }

    return null;
  }

  String? validateConfirmPassword(String? value, String textEditingController) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi Kata sandi tidak boleh kosong';
    } else if (value.length < 8) {
      return 'Minimal 8 karakter';
    } else if (value != textEditingController) {
      return "Kata sandi tidak sesuai";
    } else {
      return null;
    }
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'No Hp tidak boleh kosong';
    } else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
        value.contains(RegExp(r'[a-z]'))) {
      return 'Nomor harus terdiri dari angka';
    } else if (value.length < 10) {
      return 'Minimal 10 angka';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Format email salah';
    }

    return null;
  }

  String? validateCatatan(String? value) {
    if (value == null || value.isEmpty) {
      return 'Catatan tidak boleh kosong';
    }
    return null;
  }

  String? validateMasukanSaran(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bagian ini tidak boleh kosong';
    } else if (value.length < 4) {
      return "Minimal 4 karakter";
    }
    return null;
  }
}
