import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_watering.dart';
import 'package:provider/provider.dart';

class ProgresPenyiraman extends StatelessWidget {
  const ProgresPenyiraman({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: Colors.black26,
      color: primary[100],
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Text(
              'Progres Penyiraman',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<AddWateringProvider>(
              builder: (context, provider, _) {
                int currentDay = provider.day!;
                return SizedBox(
                  height: 50.0,
                  child: Row(
                    children: List.generate(7, (index) {
                      int? wateringValue = provider.history?[index];
                      Color? color = wateringValue == provider.period
                          ? primary
                          : neutral[40];
                      return Expanded(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: index == currentDay - 1
                                  ? primary
                                  : Colors.transparent,
                            ),
                          ),
                          child: Icon(
                            wateringValue == provider.period
                                ? FluentIcons.checkmark_16_regular
                                : wateringValue != provider.period &&
                                        currentDay > index + 1
                                    ? FluentIcons.snooze_20_filled
                                    : FluentIcons.drop_12_filled,
                            color: neutral[10],
                          ),
                        ),
                      );
                    }),
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
