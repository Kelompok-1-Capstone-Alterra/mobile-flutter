import 'package:flutter/material.dart';

import '../../models/notification_reponse_model.dart';
import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetNotificationProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;
  List<NotificationResponseModel> notifications = [];

  void getNotificationData(
      {required double latitude, required double longitude}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }

    try {
      notifications.clear();
      final response =
          await service.getNotification(latitude: 123, longitude: 321);
      notifications = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
