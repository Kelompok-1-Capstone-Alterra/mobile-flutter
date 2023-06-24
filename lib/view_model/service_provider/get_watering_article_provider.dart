import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/watering_article_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetWateringArticleProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  WateringArticleResponse? wateringArticle;

  void getWateringArticleData({required int plantId}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      final response = await service.getWateringArticle(plantId);
      wateringArticle = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
