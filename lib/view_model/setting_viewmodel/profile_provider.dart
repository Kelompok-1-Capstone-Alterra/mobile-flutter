import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';

class ProfileProvider with ChangeNotifier {
  final serviceRestApiImpl = ServicesRestApiImpl();
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

  Future<void> upImage() async {
    try {
      final pic = await serviceRestApiImpl.uploadProfilePic(selectedImage!);
      await serviceRestApiImpl.updateProfilePic(pic);

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
