import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailProgressProvider with ChangeNotifier {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/sample_tomat.png'},
    {"id": 2, "image_path": 'assets/images/sample_tomat.png'},
    {"id": 3, "image_path": 'assets/images/sample_tomat.png'}
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  void setCurrentIndex(int currentIndex) {
    currentIndex = this.currentIndex;
    notifyListeners();
  }
}
