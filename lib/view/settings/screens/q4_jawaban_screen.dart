import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class Q4JawabanScreen extends StatelessWidget {
  const Q4JawabanScreen({super.key});

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
              'Dimana kita bisa melihat history penanaman di aplikasi agriplan?',
              style: ThemeData().textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Kamu bisa melihatnya ketika sudah berada di halaman Home Agriplan.',
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
              'Cara melihat history penanaman',
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
                                FluentIcons.settings_16_regular,
                                size: 16,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' atau roda gerigi bagian atas sebelah kanan.',
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
                            TextSpan(
                              text: ' Statistik Penanaman',
                              style: TextStyle(
                                color: neutral[50],
                              ),
                            ),
                            const TextSpan(
                              text: ' atau',
                            ),
                            const WidgetSpan(
                              child: Icon(
                                FluentIcons.chevron_right_16_regular,
                                size: 16,
                              ),
                            ),
                            const TextSpan(
                              text: ' anak panah.',
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
                          children: const [
                            TextSpan(
                              text:
                                  'Selesai, kamu berhasil melihat history dari tanamanmu.',
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
