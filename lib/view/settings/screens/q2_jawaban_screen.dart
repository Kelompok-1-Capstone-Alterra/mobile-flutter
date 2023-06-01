import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/widgets/label_pusat_bantuan_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Q2JawabanScreen extends StatelessWidget {
  const Q2JawabanScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bagaimana cara menambahkan tanaman?',
              style: ThemeData().textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Kamu bisa melakukannya ketika sudah berada di halaman home Agriplan',
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
              'Cara menambahkan tanaman',
              style: ThemeData().textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
            ),
            const SizedBox(
              height: 20,
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
                              text: 'Klik ',
                            ),
                            WidgetSpan(
                              child: Icon(
                                FluentIcons.add_12_filled,
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
                              text: ' tanaman tersebut atau',
                            ),
                            TextSpan(
                              text: ' Nama',
                              style: TextStyle(
                                color: neutral[50],
                              ),
                            ),
                            const TextSpan(
                              text: ' tanaman.',
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
                              child: LabelPusatBantuanWidget(
                                title: 'Tambahkan tanaman',
                              ),
                            ),
                            TextSpan(
                              text: ' Tambahkan tanaman',
                              style: TextStyle(
                                color: neutral[50],
                              ),
                            ),
                            const TextSpan(
                              text: ' bagian paling bawah.',
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
                              text: 'Pilih tempat untuk menanam.',
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
                // ? Q5
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '5.',
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
                              text: 'Sesuaikan nama tanamanmu atau klik',
                            ),
                            TextSpan(
                              text: ' Gunakan Nama Bawaan',
                              style: TextStyle(
                                color: neutral[50],
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ' pada bagian paling bawah dari aplikasi Agriplan, lalu klik ',
                            ),
                            const WidgetSpan(
                              child: LabelPusatBantuanWidget(
                                title: 'Simpan',
                              ),
                            ),
                            TextSpan(
                              text: ' Simpan',
                              style: TextStyle(
                                color: neutral[50],
                              ),
                            ),
                            const TextSpan(
                              text: '.',
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
                // ? Q6
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '6.',
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
                                  'Selesai, dan tanamanmu berhasil terdaftar.',
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
    );
  }
}
