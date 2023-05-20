import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/description_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/informasi_tanaman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/pemupukan_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progres_penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/sudah_menanam_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/warning_cuaca.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/weekly_progres_card.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WarningCuaca(),
        const SizedBox(
          height: 10,
        ),
        const SudahMenanamCard(),
        const SizedBox(
          height: 10,
        ),
        const ProgresPenyiraman(),
        const SizedBox(
          height: 10,
        ),
        const PenyiramanCard(),
        const SizedBox(
          height: 10,
        ),
        const PemupukanCard(),
        const SizedBox(
          height: 10,
        ),
        const WeeklyProgressCard(),
        const SizedBox(
          height: 20,
        ),
        const DescriptionCard(),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Informasi Tanaman',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const InformasiTanamanCard(),
      ],
    );
  }
}
