import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ServiceLocations {
  static final ServiceLocations _serviceLocations =
      ServiceLocations._internal();
  factory ServiceLocations() {
    return _serviceLocations;
  }
  ServiceLocations._internal();

  //  bool servicePermission = false;

  Future<bool> _handlerLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //
      debugPrint("service is disable");
      //
      AppSettings.openLocationSettings();
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location services are disabled. Please enable the services')));
      // return false;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      //
      debugPrint("service was denied");
      //
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      //
      debugPrint("service denied forever");
      //
      await Geolocator.openAppSettings().then((value) async {
        permission = await Geolocator.requestPermission();
      });

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }

      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      // return false;
    }

    return true;
  }

  Future<Position?> getUserLocation() async {
    final hasPermission = await _handlerLocationPermission();
    if (hasPermission) {
      try {
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return position;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return null;
  }
}
