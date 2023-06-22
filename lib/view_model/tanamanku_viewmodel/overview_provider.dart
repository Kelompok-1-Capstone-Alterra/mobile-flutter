import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/overview_response_model.dart';
import 'package:mobile_flutter/models/plant_details_reponse_model.dart';
import 'package:mobile_flutter/services/service_location.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_fertilizing.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_watering.dart';
import 'package:provider/provider.dart';

class OverviewProvider with ChangeNotifier {
  bool? sudahMenanam = false;

  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();
  final serviceLocation = ServiceLocations();

  OverviewResponseModel? _overview;
  OverviewResponseModel get getOverviewData => _overview!;

  PlantDetailsResponseModel? _plantDetails;
  PlantDetailsResponseModel get getPlantDetails => _plantDetails!;

  Future<void> getOverview(int idTanaman, int idDetailTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      final response = await services.getOverview(idTanaman);
      _overview = response;

      final responseDetail = await services.getPlantDetails(idDetailTanaman);
      _plantDetails = responseDetail;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> getPlantDetail(int idDetailTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      final response = await services.getPlantDetails(idDetailTanaman);
      _plantDetails = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    try {
      state = MyState.loading;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 1));

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> startPlanting(
    BuildContext context,
    int idTanaman,
    int idDetailTanaman,
    double longitude,
    double latitude,
  ) async {
    try {
      state = MyState.loading;
      notifyListeners();

      await services.startPlanting(idTanaman, longitude, latitude);

      sudahMenanam = true;

      await getOverview(idTanaman, idDetailTanaman);

      if (sudahMenanam!) {
        if (context.mounted) {
          if (state != MyState.failed) {
            context.read<AddWateringProvider>().addHistoryFromList(
                  getOverviewData.watering!.history!,
                );
            context.read<AddWateringProvider>().week =
                getOverviewData.watering?.week;
            context.read<AddWateringProvider>().day =
                getOverviewData.watering?.day;
            context.read<AddWateringProvider>().period =
                getOverviewData.watering?.period;

            context.read<AddFertilizingProvider>().isActive =
                getOverviewData.fertilizing?.isActive;
            context.read<AddFertilizingProvider>().isEnabled =
                getOverviewData.fertilizing?.isEnabled;

            context.read<AddProgressProvider>().isActive =
                getOverviewData.weeklyProgress?.isActive;
            context.read<AddProgressProvider>().from =
                getOverviewData.weeklyProgress?.from;
            context.read<AddProgressProvider>().to =
                getOverviewData.weeklyProgress?.to;
            context.read<AddProgressProvider>().isEnabled =
                getOverviewData.weeklyProgress?.isEnabled;
          }
        }
      }

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
