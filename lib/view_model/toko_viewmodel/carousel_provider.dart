import 'package:flutter/foundation.dart';

class CarouselProvider with ChangeNotifier {
  int _currentSlide = 0;

  int get currentSlide => _currentSlide;

  void setCurrentSlide(int index) {
    _currentSlide = index;
    notifyListeners();
  }
}
