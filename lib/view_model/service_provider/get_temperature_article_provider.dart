import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/temperature_article_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetTemperatureArticleProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  TempArticleResponseModel? temperatureArticle;

  void getTemperatureArticleData({required int plantId}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      final response = await service.getTemperatureArticle(plantId);
      temperatureArticle = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
