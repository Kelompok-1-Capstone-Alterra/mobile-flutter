import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class InformasiTanamanCard extends StatelessWidget {
  const InformasiTanamanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.49,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2, // Jumlah kolom
        children: <Widget>[
          // Container 1
          gridItem(
              context, FluentIcons.tree_deciduous_20_regular, 'Cara Menanam'),
          // Container 2
          gridItem(context, FluentIcons.food_grains_20_regular, 'Pemupukan'),
          // Container 3
          gridItem(context, FluentIcons.drop_16_regular, 'Penyiraman'),
          // Container 4
          gridItem(
              context, FluentIcons.temperature_16_regular, 'Temperatur Ideal'),
        ],
      ),
    );
  }

  Widget gridItem(BuildContext context, IconData icon, String title) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: primary[400],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: neutral[10],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
