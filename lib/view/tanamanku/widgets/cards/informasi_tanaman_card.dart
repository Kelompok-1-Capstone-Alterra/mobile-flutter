import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

enum InformasiType { caraMenanam, pemupukan, penyiraman, temperaturIdeal }

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
          gridItem(context, FluentIcons.tree_deciduous_20_regular,
              'Cara Menanam', InformasiType.caraMenanam),
          // Container 2
          gridItem(context, FluentIcons.food_grains_20_regular, 'Pemupukan',
              InformasiType.pemupukan),
          // Container 3
          gridItem(context, FluentIcons.drop_16_regular, 'Penyiraman',
              InformasiType.penyiraman),
          // Container 4
          gridItem(context, FluentIcons.temperature_16_regular,
              'Temperatur Ideal', InformasiType.temperaturIdeal),
        ],
      ),
    );
  }

  Widget gridItem(
      BuildContext context, IconData icon, String title, InformasiType type) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primary[400]),
          ),
          padding: const EdgeInsets.all(40),
          icon: Icon(
            icon,
            color: neutral[10],
            size: 30,
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
