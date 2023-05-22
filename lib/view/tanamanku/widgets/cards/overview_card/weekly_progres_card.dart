import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class WeeklyProgressCard extends StatelessWidget {
  const WeeklyProgressCard({super.key});

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
              child: const Icon(FluentIcons.clipboard_text_32_regular),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Weekly Progress",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  AutoSizeText(
                    "24 -30 May",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: neutral[50],
                        ),
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
                FluentIcons.chevron_right_16_regular,
                color: neutral[10],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
