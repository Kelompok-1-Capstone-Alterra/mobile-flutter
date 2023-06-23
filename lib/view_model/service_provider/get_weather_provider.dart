import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/weather_response_model.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

import '../../services/service_location.dart';
import '../../services/services_restapi_impl.dart';

class GetWeatherProvider extends ChangeNotifier {
  final serviceLocation = ServiceLocations();
  final service = ServicesRestApiImpl();

  MyState state = MyState.loading;

  final List<IconData> weatherIcon = [
    FluentIcons.weather_rain_20_regular,
    FluentIcons.weather_cloudy_20_regular,
    FluentIcons.weather_sunny_16_regular,
    FluentIcons.weather_partly_cloudy_day_16_regular,
  ];

  final List<String> weatherSvg = [
    "assets/svg/weather_hujan.svg",
    "assets/svg/weather_mendung.svg",
    "assets/svg/weather_cerah.svg",
    "assets/svg/weather_berawan.svg",
  ];

  double? latitude;
  double? longitude;
  WeatherResponseModel? currentWeather;
  String username = "";

  void getWeatherData({required BuildContext context}) async {
    //ini untuk dapatin lokasi serta handler service location
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    final location = await serviceLocation.getUserLocation().then((value) {
      if (value == null) {
        state = MyState.failed;
        notifyListeners();
      } else {
        return value;
      }
    });

    if (location != null) {
      latitude = location.latitude;
      longitude = location.longitude;

      print("latitude : $latitude -------- longitude : $longitude");
      try {
        //ini untuk dapatin cuaca dari restApi
        final response = await service.getWeather(
            latitude: latitude!, longitude: longitude!);
        currentWeather = response;

        state = MyState.loaded;
        // print(
        //     "fetch -------- latitude = ${location.latitude} and lontitude = ${location.longitude} -------");
        notifyListeners();
      } catch (e) {
        state = MyState.failed;
      }
    } else {
      state = MyState.failed;
      notifyListeners();
      // print("eror mas bro");
    }
  }

  void getUsernameData() async {
    try {
      final result = await service.getUsername();
      username = result;
    } catch (e) {
      state = MyState.failed;
    }
  }
}
