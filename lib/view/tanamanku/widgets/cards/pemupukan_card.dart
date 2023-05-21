import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class PemupukanCard extends StatelessWidget {
  const PemupukanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 15,
      shadowColor: Colors.black26,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: neutral[10],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(FluentIcons.food_grains_20_regular),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: AutoSizeText(
                "Pemupukan",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/pemupukan.png',
                    color: neutral[10],
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: CircleBorder(),
                      splashColor: Colors.black12.withOpacity(0.05),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
