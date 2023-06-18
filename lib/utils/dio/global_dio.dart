import 'package:dio/dio.dart';
import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/interceptor/dio_interceptor.dart';

class DioGlobal {
  late final Dio globalDio;

  DioGlobal() {
    globalDio = Dio(
      BaseOptions(
        baseUrl: AppConstant.baseUrl,
      ),
    );

    globalDio.interceptors.add(DioInterceptor());
  }
}
