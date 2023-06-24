import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:provider/provider.dart';

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
            Consumer<OverviewProvider>(builder: (context, provider, _) {
              return AutoSizeText(
                'Suhu ideal tanaman ${provider.getOverviewData.temperatureAlert!.name ?? '-'} antara ${provider.getOverviewData.temperatureAlert!.min ?? '0'}°C - ${provider.getOverviewData.temperatureAlert!.max ?? '0'}°C. Suhu daerahmu sekarang ${provider.getOverviewData.temperatureAlert!.current ?? '0'}°C.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                minFontSize: 14,
                style: Theme.of(context).textTheme.bodySmall,
              );
            }),
          ],
        ),
      ),
    );
  }
}
