import 'package:flutter/material.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class MasukanSaranProvider with ChangeNotifier {
  final serviceRestApiImpl = ServicesRestApiImpl();

  final formKey = GlobalKey<FormState>();
  final TextEditingController masukanSaranC = TextEditingController();

  MyState state = MyState.initial;

  Future<void> sendSuggestion(String message) async {
    state = MyState.loading;
    notifyListeners();

    await serviceRestApiImpl.sendSuggestion(message);
    state = MyState.loaded;
    notifyListeners();
  }
}
