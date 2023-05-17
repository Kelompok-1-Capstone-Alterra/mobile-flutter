import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/artikel/screen/artikel_screen.dart';
import 'package:mobile_flutter/view/dashboard/screen/dashboard_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/tanamanku_screen.dart';
import 'package:mobile_flutter/view/toko/screen/toko_screen.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;

  final iconList = <IconData>[
    FluentIcons.home_12_regular,
    FluentIcons.leaf_one_16_regular,
    FluentIcons.news_16_regular,
    FluentIcons.building_shop_16_regular,
  ];

  final iconText = <String>[
    'Home',
    'Tanamanku',
    'Artikel',
    'Toko',
  ];

  final List<Widget> pages = [
    const DashboardScreen(),
    const TanamankuScreen(),
    const ArtikelScreen(),
    const TokoScreen(),
  ];

  void setSelectedIndex(BuildContext context, int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
