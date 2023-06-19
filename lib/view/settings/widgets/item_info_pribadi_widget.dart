import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/screens/ubah_kata_sandi_screen.dart';
import 'package:mobile_flutter/view/settings/screens/ubah_nama_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

enum NavigateType { ubahNama, ubahKataSandi, none }

class ItemInfoPribadiWidget extends StatelessWidget {
  const ItemInfoPribadiWidget({
    super.key,
    required this.title,
    required this.desc,
    this.isTapable = true,
    required this.navigateScreen,
    required this.defaultValue,
  });
  final String title;
  final String desc;
  final bool isTapable;
  final String defaultValue;

  final NavigateType navigateScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isTapable
            ? pushNewScreen(
                context,
                screen: navigateScreen == NavigateType.ubahNama
                    ? UbahNamaScreen(
                        defaultValue: defaultValue,
                      )
                    : UbahKataSandiScreen(defaultValue: defaultValue),
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              )
            : '';
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Text(
              title,
              style: ThemeData().textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(
              desc,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: ThemeData().textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: neutral[50],
                  ),
            ),
          ),
          Expanded(
            flex: 1,
            child: isTapable
                ? const Icon(FluentIcons.ios_chevron_right_20_regular)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
