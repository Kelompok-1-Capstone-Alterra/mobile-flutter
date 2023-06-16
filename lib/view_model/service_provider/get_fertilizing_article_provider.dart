import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/fertilizing_article_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetFertilizingArticleProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  FertilizingArticleResponseModel? fertilizingArticle;

  void getFertilizingArticleData({required int plantId}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      final response = await service.getFertilizingArticle(plantId);
      fertilizingArticle = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
