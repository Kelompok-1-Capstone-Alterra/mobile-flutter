import 'package:flutter/material.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class EmailKamiProvider with ChangeNotifier {
  final serviceRestApiImpl = ServicesRestApiImpl();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nomorHpC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController catatanC = TextEditingController();

  MyState state = MyState.initial;

  Future<void> sendComplaintEmails(
      String phone, String email, String message) async {
    state = MyState.loading;
    notifyListeners();

    await serviceRestApiImpl.sendComplaintEmails(phone, email, message);
    state = MyState.loaded;
    notifyListeners();
  }
}
