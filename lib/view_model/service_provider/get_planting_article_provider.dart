import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/planting_article_response_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetPlantingArticleProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;

  PlantingArticleResponseModel? plantingArticle;

  YoutubePlayerController? ytPlayerController;
  Future<void> getPlantingArticleData(
      {required int plantId, required String location}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      final response = await service.getPlantingArticle(plantId, location);
      plantingArticle = response;

      final String? urlVideo =
          YoutubePlayer.convertUrlToId(plantingArticle!.linkVideo!);

      ytPlayerController = YoutubePlayerController(
        initialVideoId: urlVideo!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: false,
        ),
      );

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void refreshScreen() {
    notifyListeners();
  }
}
