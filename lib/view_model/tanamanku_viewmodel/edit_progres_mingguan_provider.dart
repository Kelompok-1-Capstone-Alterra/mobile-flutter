import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class EditProgresMingguanProvider with ChangeNotifier {
  List<XFile>? image = [];

  int counter = 0;

  bool isButtonDisabled = false;

  List<Map<String, dynamic>> qualityItems = [
    {'label': 'Sangat Buruk', 'isSelected': false},
    {'label': 'Buruk', 'isSelected': false},
    {'label': 'Baik', 'isSelected': false},
    {'label': 'Sangat Baik', 'isSelected': true},
  ];

  void toggleItemSelection(int index) {
    for (var i = 0; i < qualityItems.length; i++) {
      if (i == index) {
        qualityItems[i]['isSelected'] = true;
      } else {
        qualityItems[i]['isSelected'] = false;
      }
    }
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

  void checkAllItemsUnselected() {
    for (var item in qualityItems) {
      if (item['isSelected']) {
        isButtonDisabled = false;
      }
    }
  }

  Future<void> addAssetImage(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final tempDir = await getTemporaryDirectory();
    final tempPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    final tempFile = File(tempPath);
    await tempFile.writeAsBytes(byteData.buffer.asUint8List());

    image!.add(XFile(tempFile.path));
    notifyListeners();
  }

  void refresh() {
    image = [];

    isButtonDisabled = false;

    qualityItems = [
      {'label': 'Sangat Buruk', 'isSelected': false},
      {'label': 'Buruk', 'isSelected': false},
      {'label': 'Baik', 'isSelected': false},
      {'label': 'Sangat Baik', 'isSelected': true},
    ];
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
