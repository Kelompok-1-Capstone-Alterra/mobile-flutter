import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
          'Tentang Agriplan',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 8,
        ),
        child: ListView(
          children: [
            Text(
              "Agriplan adalah solusi yang tepat untuk kegiatan menanammu. Agriplan memberikan rekomendasi-rekomendasi mengenai tanaman yang cocok untuk sekitarmu. Selain itu kami menyediakan berbagai artikel yang bisa kamu baca sebagai bahan referensi memulai aktivitas berkebun kamu. Dan juga kamu akan mendapatkan informasi yang bisa kamu lihat mulai dari: \n \n  \u2022   Cara menanam    \n  \u2022   Pemupukan  \n  \u2022   Penyiraman \n  \u2022   Sampai Temperatur Tanaman Ideal \n \nUntuk menunjang nutrisi dari tanamanmu, Agriplan bekerja sama dengan para penjual bahan-bahan serta alat pertanaian terpercaya. Jadi tidak perlu khawatir untuk memulai menanam. Anda juga bisa memiliki pengingat untuk penyiraman setiap harinya dan akan ada progress harian untuk memantau perkembangan tanaman Anda.",
              style: ThemeData().textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    wordSpacing: 0.15,
                  ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
