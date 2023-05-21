import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

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
            SizedBox(
              height: 50.0,
              child: Row(
                children: List.generate(7, (index) {
                  return Expanded(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: neutral[40],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primary,
                        ),
                      ),
                      child: Icon(
                        FluentIcons.drop_12_filled,
                        color: neutral[10],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
