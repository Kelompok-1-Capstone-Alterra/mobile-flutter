import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/article_response_model.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetArticleLikedProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;
  List<ArticleResponseModel> artikelLiked = [];

  void getArticleLikedtData() async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }

    try {
      artikelLiked.clear();
      final response = await service.getLikedArticles();
      artikelLiked = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  bool isContainInLikedList(int artikelId) {
    for (var value in artikelLiked) {
      if (value.id == artikelId) {
        return true;
      }
    }
    return false;
  }

  void liked(int artikelId) async {
    Future.delayed(const Duration(seconds: 3));
    await service.like(artikelId);
  }

  void unLiked(int artikelId) async {
    Future.delayed(const Duration(seconds: 3));
    await service.unLike(artikelId);
  }
}
