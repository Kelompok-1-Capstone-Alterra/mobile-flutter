import 'package:flutter/cupertino.dart';
import 'package:mobile_flutter/models/profile_model.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class GetProfileProvider with ChangeNotifier {
  final serviceRestApiImpl = ServicesRestApiImpl();
  ProfileModel profile = ProfileModel();

  MyState state = MyState.initial;

  Future<void> getUserProfile() async {
    try {
      state = MyState.loading;
      final response = await serviceRestApiImpl.getProfile();
      notifyListeners();

      profile = response;
      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
