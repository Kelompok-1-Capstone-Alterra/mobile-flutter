import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_fertilizing.dart';
import 'package:provider/provider.dart';

class PemupukanCard extends StatelessWidget {
  final int idTanaman;
  const PemupukanCard({super.key, this.idTanaman = 0});

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
              child: const Icon(FluentIcons.food_grains_20_regular),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: AutoSizeText(
                "Pemupukan",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Consumer<AddFertilizingProvider>(
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
                  return Stack(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: provider.isEnabled! ? primary : neutral[40],
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/icons/pemupukan.png',
                          color:
                              provider.isEnabled! ? neutral[10] : neutral[20],
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: provider.isEnabled!
                              ? InkWell(
                                  customBorder: const CircleBorder(),
                                  splashColor: Colors.black12.withOpacity(0.05),
                                  onTap: () {
                                    provider.addFertilizing(idTanaman);
                                  },
                                )
                              : null,
                        ),
                      ),
                    ],
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
