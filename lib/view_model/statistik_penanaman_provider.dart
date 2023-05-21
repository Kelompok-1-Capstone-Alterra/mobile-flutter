import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/widgets/item_statistika_penanaman_widget.dart';
import 'package:mobile_flutter/view/settings/widgets/label_mati_widget.dart';
import 'package:mobile_flutter/view/settings/widgets/label_panen_widget.dart';

class StatistikaPenanamanProvider with ChangeNotifier {
  List<ItemStatistikaPenanamanWidget> items = [
    const ItemStatistikaPenanamanWidget(
      label: LabelPanenWidget(),
    ),
    const ItemStatistikaPenanamanWidget(
      label: LabelMatiWidget(),
    ),
    const ItemStatistikaPenanamanWidget(
      label: LabelPanenWidget(),
    ),
    const ItemStatistikaPenanamanWidget(
      label: LabelMatiWidget(),
    ),
  ];
}
