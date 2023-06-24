import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/article_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetTrendingArticleProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;
  List<ArticleResponseModel> artikelTrending = [];

  void getTrendingArticleData() async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }

    try {
      artikelTrending.clear();
      final response = await service.getTrendingArticle();
      artikelTrending = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
