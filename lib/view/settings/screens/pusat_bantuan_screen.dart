import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/screens/q1_detail_tambah_tanaman_screen.dart';
import 'package:mobile_flutter/view/settings/screens/email_kami_screen.dart';
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
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: 313,
              height: 158,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primary[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Ada yang bisa kami bantu?',
                    style: ThemeData().textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // ? Pake textfield
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Cari Pertanyaan',
                      hintStyle: ThemeData().textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                      prefixIcon: const Icon(Icons.search),
                      // suffixIcon: const Icon(Icons.highlight_remove_outlined),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Pertanyaan Lainnya',
              style: ThemeData().textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            const ItemPertanyaanPusatBantuanWidget(
              title: 'Bagaimana cara menanambahkan tanaman?',
              navigateTo: Q1DetailTambahTanamanScreen(),
            ),
            const SizedBox(
              height: 15,
            ),
            const ItemPertanyaanPusatBantuanWidget(
              title: 'Bagaimana cara menambah progres mingguan?',
            ),
            const SizedBox(
              height: 15,
            ),
            const ItemPertanyaanPusatBantuanWidget(
              title:
                  'Apakah ada informasi cara menanam suatu tanaman tertentu?',
            ),
            const SizedBox(
              height: 15,
            ),
            const ItemPertanyaanPusatBantuanWidget(
              title: 'Cara melihat tanaman yang sudah berhasil panen',
            ),
            const SizedBox(
              height: 15,
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
                    'Email Kami',
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
