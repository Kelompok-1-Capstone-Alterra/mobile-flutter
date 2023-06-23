import 'package:flutter/material.dart';

import '../../models/notification_reponse_model.dart';
import '../../services/services_restapi_impl.dart';
import '../../utils/state/finite_state.dart';

class GetNotificationProvider extends ChangeNotifier {
  final service = ServicesRestApiImpl();
  MyState state = MyState.loading;
  List<NotificationResponseModel> notifications = [];
  double? setlatitude;
  double? setlongitude;

  List<int> unreadNotifId = [];

  void getNotificationData(
      {required double latitude, required double longitude}) async {
    setlatitude = latitude;
    setlongitude = longitude;
    // print("eksekusi---");

    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }

    try {
      notifications.clear();
      final response = await service.getNotification(
          latitude: latitude, longitude: longitude);
      notifications = response;

      unreadNotifCounter();

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void getNotificationDataWithoutParam() async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }

    try {
      notifications.clear();
      final response = await service.getNotification(
          latitude: setlatitude!, longitude: setlongitude!);
      notifications = response;

      unreadNotifCounter();

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void unreadNotifCounter() {
    unreadNotifId.clear();
    if (notifications.isNotEmpty) {
      for (NotificationResponseModel value in notifications) {
        if (value.readStatus == false) {
          unreadNotifId.add(value.idNotif!);
        }
      }
    }
  }

  void readNotification({required int notifId}) async {
    try {
      final response = await service.putReadNotification(notifId: notifId);

      if (response == 200) {
        getNotificationDataWithoutParam();
      }
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void readAllNotification() async {
    try {
      for (int unreadId in unreadNotifId) {
        await service.putReadNotification(notifId: unreadId);
      }

      getNotificationDataWithoutParam();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
