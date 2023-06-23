import 'package:dio/dio.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_icon_widget.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:provider/provider.dart';

class AddProgressProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();

  bool? isActive;
  String? from;
  String? to;
  bool? isEnabled;

  List<XFile> image = [];

  int counter = 0;

  bool isButtonDisabled = true;

  List<Map<String, dynamic>> qualityItems = [
    {'label': 'Sangat Buruk', 'isSelected': false},
    {'label': 'Buruk', 'isSelected': false},
    {'label': 'Sehat', 'isSelected': false},
    {'label': 'Sangat Sehat', 'isSelected': false},
  ];

  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();

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

  void checkAllItemsUnselected() {
    for (var item in qualityItems) {
      if (item['isSelected']) {
        isButtonDisabled = false;
      }
    }
  }

  void refresh() {
    image = [];

    isButtonDisabled = true;

    descriptionController.clear();

    qualityItems = [
      {'label': 'Sangat Buruk', 'isSelected': false},
      {'label': 'Buruk', 'isSelected': false},
      {'label': 'Sehat', 'isSelected': false},
      {'label': 'Sangat Sehat', 'isSelected': false},
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

  Future<void> getWeeklyProgressData(int idTanaman) async {
    try {
      state = MyState.loading;

      final response = await services.getOverview(idTanaman);

      isActive = response.weeklyProgress?.isActive;
      from = response.weeklyProgress?.from;
      to = response.weeklyProgress?.to;
      isEnabled = response.weeklyProgress?.isEnabled;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> addWeeklyProgres(BuildContext context, int idTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      Map<String, dynamic> selectedItem =
          qualityItems.firstWhere((item) => item['isSelected'] == true);

      var formData = FormData();

      List<String> imageUrl = [];

      if (image.isNotEmpty) {
        for (var i = 0; i < image.length; i++) {
          var imageFile = await MultipartFile.fromFile(image[i].path);
          formData.files.add(MapEntry('pictures', imageFile));
        }

        imageUrl = await services.addPhoto(formData);
      }

      await services.addWeeklyProgress(
        idTanaman,
        selectedItem['label'],
        descriptionController.text,
        imageUrl,
      );

      state = MyState.loaded;
      notifyListeners();

      if (context.mounted) {
        await customShowDialogIcon(
          context: context,
          iconDialog: FluentIcons.plant_ragweed_20_regular,
          title: 'Progres',
          desc: 'Progres mingguan tanaman kamu berhasil ditambahkan',
        );
        if (context.mounted) {
          refresh();
          Provider.of<TanamankuProvider>(context, listen: false)
              .setSelectedIndex(context, 1);
          Navigator.pop(context);
        }
      }
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void refreshData() {
    isActive = false;
    from = '';
    to = '';
    isEnabled = false;
  }
}
