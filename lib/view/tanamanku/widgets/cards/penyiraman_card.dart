import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

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
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: '0',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        TextSpan(
                          text: ' / ',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: '2',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: ' kali sehari',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     AutoSizeText(
                  //       '0',
                  //       style: Theme.of(context).textTheme.displayMedium,
                  //     ),
                  //     AutoSizeText(
                  //       ' / ',
                  //       style: Theme.of(context).textTheme.titleLarge,
                  //     ),
                  //     AutoSizeText(
                  //       '2',
                  //       style: Theme.of(context).textTheme.titleLarge,
                  //     ),
                  //     AutoSizeText(
                  //       '  kali sehari',
                  //       style: Theme.of(context).textTheme.titleSmall,
                  //     ),
                  //   ],
                  // ),
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
                FluentIcons.drop_16_regular,
                color: neutral[10],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
