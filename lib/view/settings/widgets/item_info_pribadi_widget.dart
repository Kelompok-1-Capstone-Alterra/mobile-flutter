import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/screens/ubah_kata_sandi_screen.dart';
import 'package:mobile_flutter/view/settings/screens/ubah_nama_screen.dart';

enum NavigateType { ubahNama, ubahKataSandi, none }

class ItemInfoPribadiWidget extends StatelessWidget {
  const ItemInfoPribadiWidget({
    super.key,
    required this.title,
    required this.desc,
    this.isTapable = true,
    required this.navigateScreen,
  });
  final String title;
  final String desc;
  final bool isTapable;

  final NavigateType navigateScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isTapable
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => navigateScreen == NavigateType.ubahNama
                      ? const UbahNamaScreen()
                      : const UbahKataSandiScreen(),
                ),
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
