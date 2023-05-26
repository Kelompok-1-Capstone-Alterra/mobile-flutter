import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/screens/q1_jawaban_screen.dart';
import 'package:mobile_flutter/view/settings/screens/q2_jawaban_screen.dart';
import 'package:mobile_flutter/view/settings/screens/email_kami_screen.dart';
import 'package:mobile_flutter/view/settings/screens/q3_jawaban_screen.dart';
import 'package:mobile_flutter/view/settings/screens/q4_jawaban_screen.dart';
import 'package:mobile_flutter/view/settings/widgets/item_pertanyaan_pusat_bantuan_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PusatBantuanScreen extends StatelessWidget {
  PusatBantuanScreen({super.key});

  final TextEditingController faqSearchC = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ada yang bisa kami bantu?',
              style: ThemeData().textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ItemPertanyaanPusatBantuanWidget(
              title:
                  'Apakah ada informasi cara menanam suatu tanaman tertentu?',
              navigateTo: Q1JawabanScreen(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const ItemPertanyaanPusatBantuanWidget(
              title: 'Bagaimana cara menanambahkan tanaman?',
              navigateTo: Q2JawabanScreen(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const ItemPertanyaanPusatBantuanWidget(
              title: 'Bagaimana cara menambah progres mingguan?',
              navigateTo: Q3JawabanScreen(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const ItemPertanyaanPusatBantuanWidget(
              title:
                  'Dimana kita bisa melihat history penanaman di aplikasi agriplan?',
              navigateTo: Q4JawabanScreen(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Hubungi Kami',
              style: ThemeData().textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmailKamiScreen(),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primary[200],
                    foregroundColor: neutral[80],
                    child: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Text(
                    'Masukkan Pertanyaan Anda',
                    style: ThemeData().textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
