import 'package:dio/dio.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_icon_widget.dart';

class AddPanenMatiProvider with ChangeNotifier {
  final TextEditingController descriptionController = TextEditingController();
  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();

  List<XFile> image = [];

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
    image.add(value);
    notifyListeners();
  }

  void addListImage(List<XFile> value) {
    image.addAll(value);
    notifyListeners();
  }

  void removeImage(int index) {
    if (index >= 0 && index < image.length) {
      image.removeAt(index);
      notifyListeners();
    }
  }

  void refresh() {
    image = [];
    selectedValue = '';
    descriptionController.clear();
  }

  String? validateDesc(value) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (value.trim().isEmpty) {
      return 'Deskripsi harus memuat 1 karakter';
    }
    return null;
  }

  Future<void> addDeadProgress(BuildContext context, int idTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      var formData = FormData();

      List<String> imageUrl = [];

      if (image.isNotEmpty) {
        for (var i = 0; i < image.length; i++) {
          var imageFile = await MultipartFile.fromFile(image[i].path);
          formData.files.add(MapEntry('pictures', imageFile));
        }

        imageUrl = await services.addPhoto(formData);
      }

      await services.addDeadProgress(
        idTanaman,
        selectedValue,
        descriptionController.text,
        imageUrl,
      );

      state = MyState.loaded;
      notifyListeners();

      if (context.mounted) {
        await customShowDialogIcon(
            context: context,
            iconDialog: FluentIcons.plant_ragweed_20_regular,
            title: 'Data tanaman mati',
            desc:
                'Penyebab tanaman kamu mati sudah di simpan! Cek History Tanaman kamu di menu Statistika Penanaman.');
        if (context.mounted) {
          refresh();
          Navigator.pop(context);
        }
        // Navigator.pop(context);
      }
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> addHarvestProgress(BuildContext context, int idTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      var formData = FormData();

      List<String> imageUrl = [];

      if (image.isNotEmpty) {
        for (var i = 0; i < image.length; i++) {
          var imageFile = await MultipartFile.fromFile(image[i].path);
          formData.files.add(MapEntry('pictures', imageFile));
        }

        imageUrl = await services.addPhoto(formData);
      }

      await services.addHarvestProgress(
        idTanaman,
        null,
        descriptionController.text,
        imageUrl,
      );

      state = MyState.loaded;
      notifyListeners();

      if (context.mounted) {
        await customShowDialogIcon(
            context: context,
            iconDialog: FluentIcons.premium_16_regular,
            title: 'Selamat',
            desc:
                'Kamu berhasil memanen tanaman kamu! Cek History Tanaman kamu di menu Statistika Penanaman.');
        if (context.mounted) {
          refresh();
          Navigator.pop(context);
        }
        // Navigator.pop(context);
      }
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
