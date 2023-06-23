import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../keys/navigator_keys.dart';
import '../widget/snackbar_custom/snackbar_cutom.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // final navigatorKeys.currentContext! = navigatorKeys.currentContext!;

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      navigatorKeys.currentContext!.read<SnackbarCustomProvider>().isShowing =
          true;
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        borderRadius: 20,
        maxWidth: 250,
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: const Color.fromARGB(255, 94, 105, 121),
        messageText: Container(
          margin: const EdgeInsets.only(left: 5),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Koneksi bermasalah",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(255, 233, 235, 238)),
              ),
              Text(
                "Periksa kembali koneksi anda",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    height: 1.25,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: Color.fromARGB(255, 233, 235, 238)),
              ),
            ],
          ),
        ),
        boxShadows: [
          BoxShadow(
            offset: const Offset(0, 5),
            // offset: Offset(10, 10),
            color: Colors.black.withOpacity(0.25), //New
            blurRadius: 10.0,
          )
        ],
        icon: Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Icon(
            Icons.wifi_off_outlined,
            color: Color.fromARGB(255, 233, 235, 238),
            size: 25,
          ),
        ),
        margin: const EdgeInsets.only(top: 25),
        snackStyle: SnackStyle.FLOATING,
        padding:
            const EdgeInsets.only(left: 15, bottom: 14, top: 14, right: 14),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        navigatorKeys.currentContext!.read<SnackbarCustomProvider>().isShowing =
            false;
      }
    }
  }
}
