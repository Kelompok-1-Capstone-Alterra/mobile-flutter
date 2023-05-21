import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class SudahMenanamCard extends StatelessWidget {
  const SudahMenanamCard({super.key});

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
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/images/sudah_menanam.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Sudah Melakukan",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 14,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  AutoSizeText(
                    "Penanaman ?",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 14,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(primary),
              ),
              padding: const EdgeInsets.all(13),
              icon: Icon(
                FluentIcons.plant_ragweed_20_regular,
                color: neutral[10],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
