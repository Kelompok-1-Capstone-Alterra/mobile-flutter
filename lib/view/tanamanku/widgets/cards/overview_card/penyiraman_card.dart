import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_watering.dart';
import 'package:provider/provider.dart';

class PenyiramanCard extends StatelessWidget {
  final int idTanaman;
  const PenyiramanCard({super.key, this.idTanaman = 0});

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Penyiraman',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Consumer<AddWateringProvider>(
                    builder: (context, provider, _) {
                      int? currentDay = provider.day;
                      return RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text:
                                  provider.history[currentDay! - 1].toString(),
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            TextSpan(
                              text: ' / ',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            TextSpan(
                              text: provider.period.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            TextSpan(
                              text: ' kali sehari',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Consumer<AddWateringProvider>(
              builder: (context, provider, _) {
                if (provider.state == MyState.loading) {
                  return Stack(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: primary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: neutral[10],
                            strokeWidth: 3,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return IconButton(
                    onPressed:
                        provider.history[provider.day! - 1] == provider.period
                            ? null
                            : () {
                                provider.addWatering(idTanaman);
                              },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        provider.history[provider.day! - 1] == provider.period
                            ? neutral[40]
                            : primary,
                      ),
                    ),
                    padding: const EdgeInsets.all(13),
                    icon: Icon(
                      FluentIcons.drop_16_regular,
                      color:
                          provider.history[provider.day! - 1] == provider.period
                              ? neutral[20]
                              : neutral[10],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
