import 'package:flutter/material.dart';

import '../../models/article_weather_response_model.dart';
import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetWeatherArticleProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  ArticleWeatherResponseModel? articleWeather;

  void getWeatherArticleData({required int labelId}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      final response = await service.getWeatherArticle(labelId: labelId);
      articleWeather = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
