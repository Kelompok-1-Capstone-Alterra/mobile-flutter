import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/widgets/label_pusat_bantuan_widget.dart';

class Q3JawabanScreen extends StatelessWidget {
  const Q3JawabanScreen({super.key});

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
              'Bagaimana cara menambahkan progres mingguan?',
              style: ThemeData().textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Kamu bisa melakukan penambahan ketika sudah berhasil menyelesaikan progres penyiraman harian selama seminggu.',
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
              'Cara menambahkan tanaman progres mingguan',
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
                          children: [
                            const TextSpan(
                              text: 'Klik ',
                            ),
                            const WidgetSpan(
                              child: Icon(
                                FluentIcons.clipboard_text_ltr_16_regular,
                                size: 16,
                              ),
                            ),
                            TextSpan(
                              text: ' Weekly Progress',
                              style: TextStyle(
                                color: neutral[50],
                              ),
                            ),
                            const TextSpan(
                              text: ' atau ',
                            ),
                            WidgetSpan(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(right: 4, bottom: 2),
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    FluentIcons.ios_chevron_right_20_regular,
                                    size: 12,
                                    color: neutral[10],
                                  ),
                                ),
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
                              child: LabelPusatBantuanWidget(
                                title: 'Tambahkan tanaman',
                              ),
                            ),
                            TextSpan(
                              text: ' Tambah progres mingguan.',
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
                              text: 'Klik ',
                            ),
                            WidgetSpan(
                              child: Icon(FluentIcons.plant_grass_20_regular),
                            ),
                            TextSpan(
                              text:
                                  ' kesehatan tanamanmu, lalu isi deskripsi dari progres tanamanmu.',
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
                          children: [
                            const TextSpan(
                              text: 'Klik ',
                            ),
                            WidgetSpan(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 4,
                                  right: 4,
                                ),
                                height: 18,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: primary[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      FluentIcons.camera_16_filled,
                                      size: 16,
                                    ),
                                    Text(
                                      'Tambahkan foto tanamanmu',
                                      style: ThemeData()
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 5,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextSpan(
                              text: ' Tambahkan foto tanamanmu,',
                              style: TextStyle(
                                color: neutral[50],
                              ),
                            ),
                            const TextSpan(
                              text: ' dan klik ',
                            ),
                            const WidgetSpan(
                              child: LabelPusatBantuanWidget(
                                title: 'Simpan progres',
                              ),
                            ),
                            TextSpan(
                              text: ' Simpan progres.',
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
                          children: const [
                            TextSpan(
                              text:
                                  'Selesai, kamu berhasil menambahkan progres mingguan tanamanmu.',
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
