import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class Q1JawabanScreen extends StatelessWidget {
  const Q1JawabanScreen({super.key});

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
          'Pusat Bantuan',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.5,
          vertical: 18,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apakah ada informasi cara menanam suatu tanaman tertentu?',
                style: ThemeData().textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Kamu bisa menemukan informasi terkait cara menanam pada bagian Artikel, selain itu kamu juga bisa menemukan informasi cara menanam tanaman pada saat sudah menentukan pilihan terkait tanaman tertentu yang ingin kamu tanam di halaman Informasi Tanaman.',
                style: ThemeData().textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Melihat informasi cara tanam',
                style: ThemeData().textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Cara pertama:',
                style: ThemeData().textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
              ),
              Text.rich(
                TextSpan(
                  style: ThemeData().textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                  children: [
                    const TextSpan(
                      text:
                          'Ketika berada di halaman home kamu bisa melihat Artikel Trending, klik',
                    ),
                    TextSpan(
                      text: ' Lihat Semua ',
                      style: ThemeData().textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: primary,
                          ),
                    ),
                    const TextSpan(
                      text: 'atau klik ',
                    ),
                    const WidgetSpan(
                      child: Icon(
                        FluentIcons.news_16_regular,
                        size: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' Artikel',
                      style: ThemeData().textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: neutral[40],
                          ),
                    ),
                    const TextSpan(
                      text:
                          'yang berada pada bagian paling bawah. Selesai, jadi kamu bisa melihat lebih banyak informasi cara menanam.',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Cara kedua:',
                style: ThemeData().textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
              ),
              Column(
                children: [
                  // ? Q1
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '1.',
                          style: ThemeData().textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                        ),
                      ),
                      Expanded(
                        flex: 24,
                        child: Text.rich(
                          TextSpan(
                            style: ThemeData().textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                            children: const [
                              TextSpan(
                                text: 'Masih di halaman Home, klik ',
                              ),
                              WidgetSpan(
                                child: Icon(
                                  FluentIcons.add_12_regular,
                                  size: 16,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' atau tanda plus yang mengambang di bagian kanan.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ? Q2
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '2.',
                          style: ThemeData().textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                        ),
                      ),
                      Expanded(
                        flex: 24,
                        child: Text.rich(
                          TextSpan(
                            style: ThemeData().textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                            children: [
                              const TextSpan(
                                text: 'Klik ',
                              ),
                              const WidgetSpan(
                                child: Icon(
                                  FluentIcons.search_16_filled,
                                  size: 16,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' dan ketik untuk mencari tanaman, lalu klik',
                              ),
                              TextSpan(
                                text: ' Gambar',
                                style: TextStyle(
                                  color: neutral[50],
                                ),
                              ),
                              const TextSpan(
                                text: ' tanaman tersebut atau Nama tanaman.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ? Q3
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '3.',
                          style: ThemeData().textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                        ),
                      ),
                      // ? Q3
                      Expanded(
                        flex: 24,
                        child: Text.rich(
                          TextSpan(
                            style: ThemeData().textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                            children: [
                              const TextSpan(
                                text: 'Klik ',
                              ),
                              WidgetSpan(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    bottom: 3,
                                  ),
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                      color: primary[400],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      FluentIcons.tree_deciduous_20_regular,
                                      size: 12,
                                      color: neutral[10],
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: ' Cara menanam.',
                                style: TextStyle(
                                  color: neutral[50],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  // ? Q4
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '4.',
                          style: ThemeData().textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                        ),
                      ),
                      Expanded(
                        flex: 24,
                        child: Text.rich(
                          TextSpan(
                            style: ThemeData().textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                            children: const [
                              TextSpan(
                                text:
                                    'Selesai, kamu bisa melihat lebih detail cara menanam untuk tanaman tertentu pada bagian menu ini.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
