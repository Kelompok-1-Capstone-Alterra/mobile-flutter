import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:provider/provider.dart';

class PemupukanDetailCard extends StatelessWidget {
  const PemupukanDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProgressProvider>(builder: (context, provider, _) {
      return Card(
        margin: const EdgeInsets.all(0),
        elevation: 15,
        shadowColor: Colors.black26,
        color: provider.getProgresDetailData.fertilizing?.history != 0
            ? primary[100]
            : error[100],
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
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: provider.getProgresDetailData.fertilizing?.history != 0
                      ? primary
                      : null,
                  shape: BoxShape.circle,
                ),
                child: provider.getProgresDetailData.fertilizing?.history != 0
                    ? Icon(
                        FluentIcons.checkmark_16_regular,
                        color: neutral[10],
                      )
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }
}
