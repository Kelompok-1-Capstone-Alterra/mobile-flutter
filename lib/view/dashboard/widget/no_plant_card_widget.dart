import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../utils/themes/custom_color.dart';

class NoPlantCardWidget extends StatelessWidget {
  const NoPlantCardWidget({
    super.key,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: _horizontal),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        color: Colors.white,
        elevation: 15,
        shadowColor: Colors.black26,
        // shadowColor: const Color.fromARGB(40, 0, 0, 0),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FluentIcons.leaf_two_16_regular,
              color: primary[500],
              size: 30,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                AutoSizeText(
                  "Kamu belum memiliki tanaman",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: primary[400],
                      ),
                ),
                const SizedBox(
                  height: 6,
                ),
                AutoSizeText(
                  "klik tombol tambah untuk memilih tanaman",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: neutral[50],
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
