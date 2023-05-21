import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ItemPertanyaanPusatBantuanWidget extends StatelessWidget {
  const ItemPertanyaanPusatBantuanWidget({
    super.key,
    required this.title,
    this.navigateTo,
  });
  final String title;
  final Widget? navigateTo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => navigateTo!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 12,
            child: Text(
              title,
              style: ThemeData().textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
            ),
          ),
          const Expanded(
              flex: 1, child: Icon(FluentIcons.ios_chevron_right_20_regular)),
        ],
      ),
    );
  }
}
