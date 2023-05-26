import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/widgets/item_statistika_penanaman_widget.dart';
import 'package:mobile_flutter/view/settings/widgets/label_mati_widget.dart';
import 'package:mobile_flutter/view/settings/widgets/label_panen_widget.dart';

class StatistikaPenanamanProvider with ChangeNotifier {
  String selectedFilter = 'Semua';

  void setFilter(String value) {
    selectedFilter = value;
    notifyListeners();
  }

  // All items
  List<ItemStatistikaPenanamanWidget> items = [
    const ItemStatistikaPenanamanWidget(
      label: LabelPanenWidget(),
      kondisiTanaman: 'Panen',
    ),
    const ItemStatistikaPenanamanWidget(
      label: LabelMatiWidget(),
      kondisiTanaman: 'Mati',
    ),
    const ItemStatistikaPenanamanWidget(
      label: LabelPanenWidget(),
      kondisiTanaman: 'Panen',
    ),
    const ItemStatistikaPenanamanWidget(
      label: LabelMatiWidget(),
      kondisiTanaman: 'Mati',
    ),
  ];

  // items = semua
  List<ItemStatistikaPenanamanWidget> get semuaItems => items;

  // items = panen
  List<ItemStatistikaPenanamanWidget> get panenItems =>
      items.where((item) => item.kondisiTanaman == 'Panen').toList();

  // items = mati
  List<ItemStatistikaPenanamanWidget> get matiItems =>
      items.where((item) => item.kondisiTanaman == 'Mati').toList();
}
