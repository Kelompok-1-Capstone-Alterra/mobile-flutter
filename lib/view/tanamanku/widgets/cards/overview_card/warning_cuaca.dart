import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class WarningCuaca extends StatelessWidget {
  const WarningCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: Colors.black26,
      color: error[200],
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  FluentIcons.warning_16_filled,
                  color: neutral,
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: AutoSizeText(
                    'Cuaca kamu saat ini tidak mendukung',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              'Suhu ideal tanaman tomat antara 24°C - 28°C. Suhu daerahmu sekarang 32°C.',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              minFontSize: 14,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
