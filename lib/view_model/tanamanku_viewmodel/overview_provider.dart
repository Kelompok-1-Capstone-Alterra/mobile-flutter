import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/overview_response_model.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';

class OverviewProvider with ChangeNotifier {
  bool? sudahMenanam;

  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();
  OverviewResponseModel? _overview;
  OverviewResponseModel get getOverviewData => _overview!;

  Future<void> getOverview(int idTanaman) async {
    try {
      state = MyState.loading;

      final response = await services.getOverview(idTanaman);
      _overview = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void addSudahMenanam() {
    sudahMenanam = true;
    notifyListeners();
  }

  void refresh() {
    sudahMenanam = false;
  }
}
