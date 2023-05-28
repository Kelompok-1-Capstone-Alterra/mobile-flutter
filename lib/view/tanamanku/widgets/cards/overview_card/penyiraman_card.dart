import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:provider/provider.dart';

class PenyiramanCard extends StatelessWidget {
  const PenyiramanCard({super.key});

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
                  Consumer<OverviewProvider>(builder: (context, provider, _) {
                    return RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: provider.counterPenyiraman.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextSpan(
                            text: ' / ',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          TextSpan(
                            text: provider.batasPenyiraman.toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          TextSpan(
                            text: ' kali sehari',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            Consumer<OverviewProvider>(
              builder: (context, provider, _) => IconButton(
                onPressed:
                    provider.counterPenyiraman == provider.batasPenyiraman
                        ? null
                        : () {
                            provider.addPenyiraman();
                          },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    provider.counterPenyiraman == provider.batasPenyiraman
                        ? neutral[40]
                        : primary,
                  ),
                ),
                padding: const EdgeInsets.all(13),
                icon: Icon(
                  FluentIcons.drop_16_regular,
                  color: provider.counterPenyiraman == provider.batasPenyiraman
                      ? neutral[20]
                      : neutral[10],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
