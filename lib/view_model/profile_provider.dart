import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  File? selectedImage;

  void setSelectedImage(File? image) {
    selectedImage = image;
    notifyListeners();
  }

  Future<void> selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageFile = File(
        pickedImage.path,
      );
      setSelectedImage(imageFile);
    }
  }
}
