import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/add_progress_mingguan_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/no_progress_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/progress_card.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NoProgressCard(),
        const SizedBox(
          height: 13,
        ),
        const ProgressCard(
            title: 'Sudah Panen',
            date: '24 Mei 2023',
            type: TipeProgress.panen),
        const SizedBox(
          height: 13,
        ),
        const ProgressCard(
            title: 'Tanaman Mati',
            date: '24 May 2023',
            type: TipeProgress.mati),
        const SizedBox(
          height: 13,
        ),
        const ProgressCard(
            title: 'Minggu ke 2',
            date: '11 - 20 May 2023',
            type: TipeProgress.mingguan),
        const SizedBox(
          height: 13,
        ),
        const ProgressCard(
            title: 'Minggu ke 1',
            date: '01 - 07 May 2023',
            type: TipeProgress.mingguan),
        const SizedBox(
          height: 13,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProgressMingguanScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10),
            backgroundColor: primary,
            minimumSize: const Size(double.infinity,
                0), // Mengatur minimumSize dengan double.infinity
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FluentIcons.add_16_filled,
                size: 17,
                color: neutral[10],
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Tambah progres mingguan',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: neutral[10],
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
