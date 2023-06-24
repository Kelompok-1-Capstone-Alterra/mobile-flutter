import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/progres_detail_response_model.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class DetailProgressProvider with ChangeNotifier {
  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();
  ProgresDetailResponseModel? _progresDetail;
  ProgresDetailResponseModel get getProgresDetailData => _progresDetail!;

  List imageList = [];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  void setCurrentIndex(int currentIndex) {
    this.currentIndex = currentIndex;
    notifyListeners();
  }

  Future<void> getProgresDetail(int idTanaman, int idProgress) async {
    try {
      state = MyState.loading;

      final response = await services.getProgresDetail(idTanaman, idProgress);
      _progresDetail = response;

      List<String> pictureList = _progresDetail?.progress?.pictures ?? [];

      imageList.clear(); // Bersihkan list sebelum menambahkan data baru
      imageList.addAll(pictureList.map((imageName) {
        return {
          'image_path': imageName,
        };
      }).toList());

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
