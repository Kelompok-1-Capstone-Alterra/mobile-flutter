import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class KondisiTanamanCard extends StatelessWidget {
  final String title;

  const KondisiTanamanCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 15,
      shadowColor: Colors.black26,
      color: title == 'Sangat Sehat' || title == 'Sehat'
          ? primary[100]
          : title == 'Buruk' || title == 'Sangat Buruk'
              ? error[100]
              : neutral[10],
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: title == 'Sangat Sehat'
                    ? primary[400]
                    : title == 'Sehat'
                        ? success
                        : title == 'Buruk'
                            ? error
                            : title == 'Sangat Buruk'
                                ? error[400]
                                : neutral,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                FluentIcons.plant_grass_20_regular,
                color: neutral[10],
              ),
            ),
            const SizedBox(width: 36),
            AutoSizeText(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
