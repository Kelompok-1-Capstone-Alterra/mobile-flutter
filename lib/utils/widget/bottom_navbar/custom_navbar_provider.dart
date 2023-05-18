import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/theme.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../view/artikel/screen/artikel_screen.dart';
import '../../../view/dashboard/screen/dashboard_screen.dart';
import '../../../view/tanamanku/screen/tanamanku_screen.dart';
import '../../../view/toko/screen/toko_screen.dart';
import '../../themes/custom_color.dart';

// enum ScreenSelected { home, tanamanku, artikel, toko }
class CustomNavbarProvider extends ChangeNotifier {
  // final iconList = <IconData>[
  //   FluentIcons.home_12_regular,
  //   FluentIcons.leaf_one_16_regular,
  //   FluentIcons.news_16_regular,
  //   FluentIcons.building_shop_16_regular,
  // ];

  // final iconText = <String>[
  //   'Home',
  //   'Tanamanku',
  //   'Artikel',
  //   'Toko',
  // ];
  // final List<Widget> pages = [
  //   const DashboardScreen(),
  //   const TanamankuScreen(),
  //   const ArtikelScreen(),
  //   const TokoScreen(),
  // ];

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const DashboardScreen(),
      const TanamankuScreen(),
      const ArtikelScreen(),
      const TokoScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: agriplantLight.textTheme.labelSmall!.copyWith(fontSize: 13),
        icon: const Icon(FluentIcons.home_16_regular),
        title: "Home",
        activeColorPrimary: success[500]!,
        inactiveColorPrimary: neutral[50],
      ),
      PersistentBottomNavBarItem(
        textStyle: agriplantLight.textTheme.labelSmall!.copyWith(
          fontSize: 13,
        ),
        icon: const Icon(FluentIcons.leaf_one_16_regular),
        title: "Tanamanku",
        activeColorPrimary: success[500]!,
        inactiveColorPrimary: neutral[50],
      ),
      PersistentBottomNavBarItem(
        textStyle: agriplantLight.textTheme.labelSmall!.copyWith(fontSize: 13),
        icon: const Icon(FluentIcons.news_16_regular),
        title: "Artikel",
        activeColorPrimary: success[500]!,
        inactiveColorPrimary: neutral[50],
      ),
      PersistentBottomNavBarItem(
        textStyle: agriplantLight.textTheme.labelSmall!.copyWith(fontSize: 13),
        icon: const Icon(FluentIcons.building_shop_16_regular),
        title: "Toko",
        activeColorPrimary: success[500]!,
        inactiveColorPrimary: neutral[50],
      ),
    ];
  }

  // ScreenSelected screenSelected = ScreenSelected.home;

  // void changeScreen({required ScreenSelected newSelectedScreen}) {
  //   screenSelected = newSelectedScreen;
  // }
}
