import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPanenMatiProvider with ChangeNotifier {
  List<XFile>? image = [];

  bool isButtonDisabled = true;

  String? selectedValue;

  List<String> penyebab = [
    'Kekeringan',
    'Hama',
    'Kurang sinar matahari',
  ];

  void setSelectedValue(String? value) {
    selectedValue = value;
    notifyListeners();
  }

  void addImage(XFile value) {
    image?.add(value);
    notifyListeners();
  }

  void addListImage(List<XFile> value) {
    image?.addAll(value);
    notifyListeners();
  }

  void removeImage(int index) {
    if (index >= 0 && index < image!.length) {
      image?.removeAt(index);
      notifyListeners();
    }
  }

  void refresh() {
    image = [];

    isButtonDisabled = true;
  }

  String? validateDesc(value) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (value.trim().isEmpty) {
      return 'Deskripsi harus memuat 1 karakter';
    }
    return null;
  }
}
