import 'package:flutter/material.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class UbahKataSandiProvider with ChangeNotifier {
  final serviceRestApiImpl = ServicesRestApiImpl();
  final formKey = GlobalKey<FormState>();
  final TextEditingController ubahKataSandiC = TextEditingController();
  final TextEditingController konfirmasiKataSandiC = TextEditingController();

  MyState state = MyState.initial;

  bool sandiObscureText = true;
  bool konfirmasiObscureText = true;

  void sandiObscureTextStatus() {
    sandiObscureText = !sandiObscureText;
    notifyListeners();
  }

  void konfirmasiObscureTextStatus() {
    konfirmasiObscureText = !konfirmasiObscureText;
    notifyListeners();
  }

  Future<void> changePassword(String newPassword) async {
    state = MyState.loading;
    notifyListeners();

    await serviceRestApiImpl.changePassword(newPassword);
    state = MyState.loaded;
    notifyListeners();
  }
}
