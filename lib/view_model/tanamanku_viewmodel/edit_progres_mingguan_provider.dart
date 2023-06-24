import 'package:dio/dio.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_flutter/models/progres_detail_response_model.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_icon_widget.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/progres_provider.dart';
import 'package:provider/provider.dart';

class EditProgresMingguanProvider with ChangeNotifier {
  MyState state = MyState.initial;
  MyState stateTombol = MyState.initial;
  final services = ServicesRestApiImpl();
  ProgresDetailResponseModel? _progresDetail;
  ProgresDetailResponseModel get getProgresDetailData => _progresDetail!;

  final TextEditingController descriptionController = TextEditingController();

  List imageList = [];
  List<XFile>? newImage = [];

  int counter = 0;

  bool isButtonDisabled = false;

  List<Map<String, dynamic>> qualityItems = [
    {'label': 'Sangat Buruk', 'isSelected': false},
    {'label': 'Buruk', 'isSelected': false},
    {'label': 'Baik', 'isSelected': false},
    {'label': 'Sangat Baik', 'isSelected': false},
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

  Future<void> removeImage(int index, String url) async {
    try {
      stateTombol = MyState.loading;
      notifyListeners();

      await services.removePhoto(url);

      imageList.removeAt(index);

      stateTombol = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> addListImage(List<XFile> value) async {
    try {
      stateTombol = MyState.loading;
      notifyListeners();

      var formData = FormData();

      List<String> imageUrl = [];
      List<XFile> newImage = [];

      newImage.clear();
      newImage.addAll(value);

      if (newImage.isNotEmpty) {
        for (var i = 0; i < newImage.length; i++) {
          var imageFile = await MultipartFile.fromFile(newImage[i].path);
          formData.files.add(MapEntry('pictures', imageFile));
        }

        imageUrl = await services.addPhoto(formData);
      }

      imageList.addAll(imageUrl.map((imageName) {
        return {
          'image_path': imageName,
        };
      }).toList());

      stateTombol = MyState.loaded;
      notifyListeners();
    } catch (e) {
      stateTombol = MyState.loaded;
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> addCameraImage(XFile value) async {
    try {
      stateTombol = MyState.loading;
      notifyListeners();

      var formData = FormData();

      List<String> imageUrl = [];
      List<XFile> newImage = [];

      newImage.clear();
      newImage.add(value);

      if (newImage.isNotEmpty) {
        for (var i = 0; i < newImage.length; i++) {
          var imageFile = await MultipartFile.fromFile(newImage[i].path);
          formData.files.add(MapEntry('pictures', imageFile));
        }

        imageUrl = await services.addPhoto(formData);
      }

      imageList.addAll(imageUrl.map((imageName) {
        return {
          'image_path': imageName,
        };
      }).toList());

      stateTombol = MyState.loaded;
      notifyListeners();
    } catch (e) {
      stateTombol = MyState.loaded;
      state = MyState.failed;
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
    newImage = [];
    imageList = [];

    descriptionController.clear();
    isButtonDisabled = false;

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

  Future<void> getProgresDetail(int idTanaman, int idProgress) async {
    try {
      state = MyState.loading;
      notifyListeners();

      final response = await services.getProgresDetail(idTanaman, idProgress);
      _progresDetail = response;

      List<String> pictureList = _progresDetail?.progress?.pictures ?? [];

      imageList.clear(); // Bersihkan list sebelum menambahkan data baru
      imageList.addAll(pictureList.map((imageName) {
        return {
          'image_path': imageName,
        };
      }).toList());

      String qualityItemsResponse = _progresDetail?.progress?.condition ?? '';

      if (qualityItemsResponse == 'Sangat Sehat') {
        qualityItems = [
          {'label': 'Sangat Buruk', 'isSelected': false},
          {'label': 'Buruk', 'isSelected': false},
          {'label': 'Sehat', 'isSelected': false},
          {'label': 'Sangat Sehat', 'isSelected': true},
        ];
      } else if (qualityItemsResponse == 'Sehat') {
        qualityItems = [
          {'label': 'Sangat Buruk', 'isSelected': false},
          {'label': 'Buruk', 'isSelected': false},
          {'label': 'Sehat', 'isSelected': true},
          {'label': 'Sangat Sehat', 'isSelected': false},
        ];
      } else if (qualityItemsResponse == 'Buruk') {
        qualityItems = [
          {'label': 'Sangat Buruk', 'isSelected': false},
          {'label': 'Buruk', 'isSelected': true},
          {'label': 'Sehat', 'isSelected': false},
          {'label': 'Sangat Sehat', 'isSelected': false},
        ];
      } else if (qualityItemsResponse == 'Sangat Buruk') {
        qualityItems = [
          {'label': 'Sangat Buruk', 'isSelected': true},
          {'label': 'Buruk', 'isSelected': false},
          {'label': 'Sehat', 'isSelected': false},
          {'label': 'Sangat Sehat', 'isSelected': false},
        ];
      } else {
        qualityItems = [
          {'label': 'Sangat Buruk', 'isSelected': false},
          {'label': 'Buruk', 'isSelected': false},
          {'label': 'Sehat', 'isSelected': false},
          {'label': 'Sangat Sehat', 'isSelected': false},
        ];
      }

      descriptionController.text = _progresDetail?.progress?.desc ?? '';

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> editWeeklyProgres(
      BuildContext context, int idTanaman, int idProgress) async {
    try {
      stateTombol = MyState.loading;
      notifyListeners();

      Map<String, dynamic> selectedItem =
          qualityItems.firstWhere((item) => item['isSelected'] == true);

      List<String> imagePath = [];

      for (var img in imageList) {
        imagePath.add(img['image_path']);
      }

      await services.editWeeklyProgress(
        idTanaman,
        idProgress,
        selectedItem['label'],
        descriptionController.text,
        imagePath,
      );

      stateTombol = MyState.loaded;
      notifyListeners();

      if (context.mounted) {
        context
            .read<DetailProgressProvider>()
            .getProgresDetail(idTanaman, idProgress);
        context.read<ProgresProvider>().getProgres(idTanaman);
        await customShowDialogIcon(
          context: context,
          iconDialog: FluentIcons.plant_ragweed_20_regular,
          title: 'Ubah Progres',
          desc: 'Progres mingguan tanaman kamu berhasil diubah',
        );
        if (context.mounted) {
          refresh();

          Navigator.pop(context);
        }
      }
    } catch (e) {
      stateTombol = MyState.loaded;
      state = MyState.failed;
      notifyListeners();
    }
  }
}
