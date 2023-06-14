import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/widgets/item_statistika_penanaman_widget.dart';
import 'package:mobile_flutter/view/settings/widgets/statistik_penanaman_empty_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/statistik_penanaman_provider.dart';
import 'package:provider/provider.dart';

class StatistikPenanamanScreen extends StatefulWidget {
  const StatistikPenanamanScreen({super.key});

  @override
  State<StatistikPenanamanScreen> createState() =>
      _StatistikPenanamanScreenState();
}

class _StatistikPenanamanScreenState extends State<StatistikPenanamanScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StatistikaPenanamanProvider>().getAllPlantStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: AutoSizeText(
          'Statistik Penanaman',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              hoverColor: primary[200],
              highlightColor: primary[200],
              focusColor: Colors.transparent,
              splashColor: primary[200],
            ),
            child: Consumer<StatistikaPenanamanProvider>(
              builder: (context, statPenanamanProvider, _) => DropdownButton(
                padding: const EdgeInsets.only(right: 5),
                items: const [
                  DropdownMenuItem(
                    value: '',
                    child: Text('Semua'),
                  ),
                  DropdownMenuItem(
                    value: 'harvest',
                    child: Text('Panen'),
                  ),
                  DropdownMenuItem(
                    value: 'dead',
                    child: Text('Mati'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    statPenanamanProvider.setFilter(value);
                    statPenanamanProvider.getAllPlantStats();
                  }
                },
                underline: const SizedBox(),
                style: ThemeData().textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                iconDisabledColor: neutral,
                iconEnabledColor: neutral,
                icon: const Icon(FluentIcons.filter_16_filled),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        child: Consumer<StatistikaPenanamanProvider>(
          builder: (context, statistikaPenanaman, _) {
            final state = statistikaPenanaman.state;
            if (state == MyState.initial) {
              const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state == MyState.loading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state == MyState.loaded) {
              if (statistikaPenanaman.selectedFilter == '') {
                if (statistikaPenanaman.allItems.isEmpty) {
                  return const StatistikPenanamanEmptyWidget(
                    kondisiTanaman: 'tanaman',
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 6 / 7,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: statistikaPenanaman.allItems.length,
                    itemBuilder: (context, index) {
                      final plantStats = statistikaPenanaman.allItems[index];
                      return ItemStatistikaPenanamanWidget(
                        index: index,
                        plantStatsModel: plantStats,
                      );
                    },
                  );
                }
              } else if (statistikaPenanaman.selectedFilter == 'harvest') {
                if (statistikaPenanaman.harvestItems.isEmpty) {
                  return const StatistikPenanamanEmptyWidget(
                    kondisiTanaman: 'tanaman panen',
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 6 / 7,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: statistikaPenanaman.harvestItems.length,
                    itemBuilder: (context, index) {
                      final plantStats =
                          statistikaPenanaman.harvestItems[index];
                      return ItemStatistikaPenanamanWidget(
                        index: index,
                        plantStatsModel: plantStats,
                      );
                    },
                  );
                }
              } else if (statistikaPenanaman.selectedFilter == 'dead') {
                if (statistikaPenanaman.harvestItems.isEmpty) {
                  return const StatistikPenanamanEmptyWidget(
                    kondisiTanaman: 'tanaman mati',
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 6 / 7,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: statistikaPenanaman.deadItems.length,
                    itemBuilder: (context, index) {
                      final plantStats = statistikaPenanaman.deadItems[index];
                      return ItemStatistikaPenanamanWidget(
                        index: index,
                        plantStatsModel: plantStats,
                      );
                    },
                  );
                }
              }
            } else if (state == MyState.failed) {
              return const Center(
                child: Text('error'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
