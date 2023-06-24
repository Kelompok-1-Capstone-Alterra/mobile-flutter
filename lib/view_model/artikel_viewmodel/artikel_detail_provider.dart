import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/article_by_id_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class ArtikelProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  List<ArticleByIdResponseModel>? articleDetail = [];

  void getArticleDetail({required int artikelId}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      final response = await service.getArtikelById(artikelId);
      articleDetail = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
