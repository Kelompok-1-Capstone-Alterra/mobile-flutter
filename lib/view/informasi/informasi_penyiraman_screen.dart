import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../utils/themes/custom_color.dart';

class InformasiPenyiramanScreen extends StatefulWidget {
  const InformasiPenyiramanScreen({super.key});

  @override
  State<InformasiPenyiramanScreen> createState() =>
      _InformasiPenyiramanScreenState();
}

const String _htmlData = r"""
<p>Untuk menyirami tanaman tomat, perlu dilakukan 2 kali dalam sehari ketika pagi dan sore. Namun harus memperhatikan kelemahan tanaman tomat, yaitu tidak tahan dengan genangan dan rentan terhadap kekurangan oksigen.</p>

<p>Oleh karena itu, siramlah tanaman secukupnya saja tidak perlu terlalu basah kuyup yang dapat menimbulkan genangan disekitar akar.</p>

<p>Penyiraman saat pagi, harus dengan air yang lebih sedikit dari sore hari, karena ketika sore hari lebih diperlukan untuk menggantikan air yang hilang karena penguapan dan mengembalikan kekuatan tanaman ketika malam hari tiba.</p>
""";

class _InformasiPenyiramanScreenState extends State<InformasiPenyiramanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FloatingActionButton.small(
          elevation: 0,
          backgroundColor: Colors.black12,
          highlightElevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(),
          disabledElevation: 0,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            FluentIcons.chevron_left_16_regular,
            size: 30,
            color: neutral[10],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.32,
            child: Image.asset(
              "assets/images/sample_tomat.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informasi Penyiraman",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Tomat",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: neutral[40]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Html(
                  data: _htmlData,
                  style: {
                    'p': Style(
                      textAlign: TextAlign.justify,
                    ),
                    '#': Style(
                      margin: Margins.symmetric(horizontal: 0),
                      padding: const EdgeInsets.only(bottom: 20),
                    )
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
