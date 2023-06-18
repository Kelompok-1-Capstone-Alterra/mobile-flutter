import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

import '../keys/navigator_keys.dart';

class DioInterceptor extends Interceptor {
// nanti context nya isi ini navigatorKeys.currentContext!;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // mintak validasi punya token kalau ga ada pop semua screen lempar ke login

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    //kalau error buat per kode yang di tentukan di contract
    /*
      400 = “bad request” string(255)
      401 = “unauthorized” string(255)
      403 = “forbidden” string(255)
      404 = “not found” string(255)
      408 = “request time out” string(255)
      409 = “conflict string(255)
      429 = “too many request” string(255)
      500 = “internal server error” string(255)
      504 = “gateway timeout” string(255)
    */

    super.onError(err, handler);

    AnimatedSnackBar(
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 50,
      ),
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xffff0000),
            borderRadius: BorderRadius.circular(10),
          ),

          // height: 50,
          child: Text(
            'Maaf! Terjadi kesalahan.',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: neutral[10],
                ),
            textAlign: TextAlign.justify,
          ),
        );
      }),
    ).show(navigatorKeys.currentContext!);
  }
}
