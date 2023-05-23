import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class NoProgressCard extends StatelessWidget {
  const NoProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 128,
          width: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 15,
            shadowColor: Colors.black26,
            surfaceTintColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FluentIcons.leaf_two_16_regular,
                  color: primary[500],
                  size: 30,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      "Kamu belum menambahkan progres",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: primary[400],
                          ),
                    ),
                    AutoSizeText(
                      "tanaman kamu",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: primary[400],
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
