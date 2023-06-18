import 'package:flutter/material.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class UbahNamaProvider with ChangeNotifier {
  final serviceRestApiImpl = ServicesRestApiImpl();
  final formKey = GlobalKey<FormState>();
  final TextEditingController ubahNamaC = TextEditingController();

  MyState state = MyState.initial;

  Future<void> changeName(String newName) async {
    state = MyState.loading;
    notifyListeners();

    await serviceRestApiImpl.changeName(newName);
    state = MyState.loaded;
    notifyListeners();
  }
}
