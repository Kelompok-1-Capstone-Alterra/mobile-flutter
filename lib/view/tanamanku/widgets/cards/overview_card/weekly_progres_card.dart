import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/converter/convert_date.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/add_progress_mingguan_screen.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class WeeklyProgressCard extends StatelessWidget {
  final int idTanaman;
  const WeeklyProgressCard({super.key, this.idTanaman = 0});

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
                    "Progres Mingguan",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Consumer<OverviewProvider>(
                    builder: (context, provider, _) {
                      final String fromMonth = formatDateMMM(
                          provider.getOverviewData.weeklyProgress!.from!);

                      final String toMonth = formatDateMMM(
                          provider.getOverviewData.weeklyProgress!.to!);

                      String fromFormat = '';

                      if (fromMonth == toMonth) {
                        fromFormat = formatDatedd(
                            provider.getOverviewData.weeklyProgress!.from!);
                      } else {
                        fromFormat = formatDateddMMM(
                            provider.getOverviewData.weeklyProgress!.from!);
                      }

                      final String toFormat = formatDateddMMMyyyy(
                          provider.getOverviewData.weeklyProgress!.to!);

                      return AutoSizeText(
                        "$fromFormat - $toFormat",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: neutral[50],
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Consumer<AddProgressProvider>(
              builder: (context, provider, _) {
                return IconButton(
                  onPressed: () {
                    provider.isEnabled!
                        ? pushNewScreen(
                            context,
                            screen:
                                AddProgressMingguanScreen(idTanaman: idTanaman),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          )
                        : null;
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        provider.isEnabled! ? primary : neutral[40]),
                  ),
                  padding: const EdgeInsets.all(13),
                  icon: Icon(
                    FluentIcons.chevron_right_16_regular,
                    color: neutral[10],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
