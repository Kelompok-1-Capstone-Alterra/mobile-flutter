import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/widgets/statistik_penanaman_empty_widget.dart';
import 'package:mobile_flutter/view_model/statistik_penanaman_provider.dart';
import 'package:provider/provider.dart';

class StatistikPenanamanScreen extends StatelessWidget {
  const StatistikPenanamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: Text(
          'Statistika Penanaman',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
        actions: [
          DropdownButton(
            padding: const EdgeInsets.only(right: 19),
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
            onChanged: (_) {},
            underline: const SizedBox(),
            style: ThemeData().textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
            iconDisabledColor: neutral,
            iconEnabledColor: neutral,
            icon: const Icon(FluentIcons.filter_16_filled),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        child: Consumer<StatistikaPenanamanProvider>(
          builder: (context, statistikaPenanaman, _) => statistikaPenanaman
                  .items.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    childAspectRatio: 6 / 7,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: statistikaPenanaman.items.length,
                  itemBuilder: (context, index) =>
                      statistikaPenanaman.items[index],
                )
              : const StatistikPenanamanEmptyWidget(),
        ),
      ),
    );
  }
}
