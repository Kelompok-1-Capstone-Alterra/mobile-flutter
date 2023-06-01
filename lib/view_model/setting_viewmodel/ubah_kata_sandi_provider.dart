import 'package:flutter/material.dart';

class UbahKataSandiProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController ubahKataSandiC = TextEditingController();
  final TextEditingController konfirmasiKataSandiC = TextEditingController();

  bool sandiObscureText = true;
  bool konfirmasiObscureText = true;

  void sandiObscureTextStatus() {
    sandiObscureText = !sandiObscureText;
    notifyListeners();
  }

  void konfirmasiObscureTextStatus() {
    konfirmasiObscureText = !konfirmasiObscureText;
    notifyListeners();
  }
}
