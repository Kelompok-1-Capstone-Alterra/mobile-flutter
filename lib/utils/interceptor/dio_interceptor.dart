import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../keys/navigator_keys.dart';
import '../widget/snackbar_custom/snackbar_cutom.dart';

class DioInterceptor extends Interceptor {
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
    SnackbarCustomProvider snackBar = Provider.of<SnackbarCustomProvider>(
        navigatorKeys.currentContext!,
        listen: false);

    if (err.response!.statusCode != null) {
      if (err.response!.statusCode == 404) {
        snackBar.showSnackbarBasic(
            title: "kesalahan 404",
            description: "Data tidak ditemukan",
            type: SnackbarType.error);
      } else if (err.response!.statusCode == 500) {
        snackBar.showSnackbarBasic(
            title: "Kesalahan 500",
            description: "Terjadi kesalahan pada server",
            type: SnackbarType.error);
      } else if (err.response!.statusCode == 401) {
        snackBar.showSnackbarBasic(
            title: "Kesalahan 401 ",
            description: "Autentikasi gagal, Silakan login kembali",
            type: SnackbarType.error);
      } else if (err.response!.statusCode == 400) {
        snackBar.showSnackbarBasic(
            title: "Kesalahan 400 ",
            description: "Terjadi kesalahan. Permintaan tidak valid",
            type: SnackbarType.error);
      } else {
        snackBar.showSnackbarBasic(
            title: "Error",
            description: "Maaf, terjadi suatu kesalahan",
            type: SnackbarType.error);
      }
    } else {
      snackBar.showSnackbarBasic(
          title: "Error",
          description: "Upss, terjadi suatu kesalahan",
          type: SnackbarType.error);
    }

    super.onError(err, handler);
  }
}
