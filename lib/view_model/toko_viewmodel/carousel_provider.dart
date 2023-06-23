import 'package:flutter/foundation.dart';

class CarouselProvider with ChangeNotifier {
  int _currentSlide = 0;
  int _currentIndex = 0;
  int get currentSlide => _currentSlide;
  int get currentIndex => _currentIndex;

  void setCurrentSlide(int index) {
    _currentSlide = index;
    notifyListeners();
  }

  void setImageSlide(int indexImage) {
    _currentIndex = indexImage;
    notifyListeners();
  }
}
