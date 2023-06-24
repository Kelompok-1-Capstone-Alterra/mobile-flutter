import 'dart:ffi';
import 'package:get/get.dart';
import 'network_controller.dart';

class DepedencyInjection {
  static Void? init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    return null;
  }
}
