import 'package:flutter/material.dart';
import 'package:mobile_flutter/services/services_restapi_impl.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:provider/provider.dart';

class EditNamaTanamanProvider with ChangeNotifier {
  final TextEditingController namaController = TextEditingController();
  MyState state = MyState.initial;
  final services = ServicesRestApiImpl();

  String? validateName(value) {
    if (value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  Future<void> changeMyPlantName(BuildContext context, int idTanaman) async {
    try {
      state = MyState.loading;
      notifyListeners();

      await services
          .changeMyPlantName(
            idTanaman,
            namaController.text,
          )
          .then((value) =>
              Provider.of<TanamankuProvider>(context, listen: false)
                  .getMyPlantName(idTanaman));

      state = MyState.loaded;
      notifyListeners();

      if (context.mounted) {
        await customShowDialogText(
          context: context,
          title: 'Nama tanaman',
          desc: 'Nama tanaman berhasil di edit',
        );

        if (context.mounted) {
          namaController.clear();

          if (context.mounted) {
            Navigator.pop(context);
          }
        }
      }
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
