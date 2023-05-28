import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:provider/provider.dart';

class SudahMenanamCard extends StatelessWidget {
  const SudahMenanamCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OverviewProvider>(context, listen: false);
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
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/images/sudah_menanam.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: AutoSizeText(
                "Sudah Melakukan Penanaman?",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                minFontSize: 14,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                provider.addSudahMenanam();
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    neutral[10],
                  ),
                  backgroundColor: const MaterialStatePropertyAll(primary)),
              child: const Text('Sudah'),
            ),
          ],
        ),
      ),
    );
  }
}
