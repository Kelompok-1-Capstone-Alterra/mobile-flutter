import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ArtikelProvider with ChangeNotifier {
  List imageList = [
    {
      "id": 1,
      "image_path": 'assets/images/banner_artikel.png',
      "title": 'Bagaimana cara menanam di lahan yang sempit'
    },
    {
      "id": 2,
      "image_path": 'assets/images/banner_artikel.png',
      "title": 'Perubahan cuaca ekstream, pastikan tanaman tetap sehat'
    },
    {
      "id": 3,
      "image_path": 'assets/images/banner_artikel.png',
      "title": 'Tanaman sayur yang mudah ditanam di halaman rumah'
    }
  ];

  //------------------ Banner Carousel -------------------
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  void setCurrentIndex(int currentIndex) {
    this.currentIndex = currentIndex;
    notifyListeners();
  }

  //------------------ Deskripsi Html -------------------
  // bool fullDescription = false;

  // void showFullDescription() {
  //   fullDescription = true;
  //   // fullDescription = !fullDescription;
  //   notifyListeners();
  // }

  // String removeHtmlTags(String htmlString) {
  //   RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  //   return htmlString.replaceAll(exp, '');
  // }

  //------------------ Likes / Bookmark -------------------
  bool likes = false;
  void likesStatus() {
    likes = !likes;
    notifyListeners();
  }
}
