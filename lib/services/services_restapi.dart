import '../models/weather_response_model.dart';

abstract class ServicesRestApi {
  void contohEndpoint();

  // ------ explore and monitoring ------------
  Future<WeatherResponseModel?> getWeather(
      {required double latitude, required double longitude});
}
