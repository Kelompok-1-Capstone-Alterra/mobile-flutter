import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/description_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/informasi_tanaman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/pemupukan_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/progres_penyiraman_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/sudah_menanam_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/warning_cuaca.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/weekly_progres_card.dart';

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
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: primary,
                  minimumSize: const Size(double.infinity,
                      0), // Mengatur minimumSize dengan double.infinity
                ),
                child: Text(
                  'Tanamanmu Berhasil Panen?',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: neutral[10],
                      ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Tanamanmu mati?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: error),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
