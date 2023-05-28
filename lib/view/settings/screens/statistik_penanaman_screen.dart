import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/widgets/statistik_penanaman_empty_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/statistik_penanaman_provider.dart';
import 'package:provider/provider.dart';

class StatistikPenanamanScreen extends StatelessWidget {
  const StatistikPenanamanScreen({super.key});

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
                    value: 'Semua',
                    child: Text('Semua'),
                  ),
                  DropdownMenuItem(
                    value: 'Panen',
                    child: Text('Panen'),
                  ),
                  DropdownMenuItem(
                    value: 'Mati',
                    child: Text('Mati'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    statPenanamanProvider.setFilter(value);
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
            if (statistikaPenanaman.semuaItems.isEmpty) {
              return const StatistikPenanamanEmptyWidget(
                kondisiTanaman: 'tanaman',
              );
            } else if (statistikaPenanaman.selectedFilter == 'Panen') {
              if (statistikaPenanaman.panenItems.isEmpty) {
                return const StatistikPenanamanEmptyWidget(
                  kondisiTanaman: 'tanaman panen',
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 6 / 7,
                  mainAxisSpacing: 20,
                ),
                itemCount: statistikaPenanaman.panenItems.length,
                itemBuilder: (context, index) =>
                    statistikaPenanaman.panenItems[index],
              );
            } else if (statistikaPenanaman.selectedFilter == 'Mati') {
              if (statistikaPenanaman.matiItems.isEmpty) {
                return const StatistikPenanamanEmptyWidget(
                  kondisiTanaman: 'tanaman mati',
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 6 / 7,
                  mainAxisSpacing: 20,
                ),
                itemCount: statistikaPenanaman.matiItems.length,
                itemBuilder: (context, index) =>
                    statistikaPenanaman.matiItems[index],
              );
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 6 / 7,
                mainAxisSpacing: 20,
              ),
              itemCount: statistikaPenanaman.semuaItems.length,
              itemBuilder: (context, index) =>
                  statistikaPenanaman.semuaItems[index],
            );
          },
        ),
      ),
    );
  }
}
