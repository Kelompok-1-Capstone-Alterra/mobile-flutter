import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../utils/themes/custom_color.dart';

class InformasiPemupukanScreen extends StatefulWidget {
  const InformasiPemupukanScreen({super.key});

  @override
  State<InformasiPemupukanScreen> createState() =>
      _InformasiPemupukanScreenState();
}

const String _htmlData = r"""
<p>Pemupukan susulan tanaman tomat dianjurkan menggunakan pupuk NPK daun, kompos atau bisa juga dengan Pupuk Langsung Pakai (PLP), ketika usia tanam menginjak satu minggu, dan seterusnya setelah satu bulan, dan setiap 30 hari sekali.</p>
<p>Jika menggunakan kompos, berikan satu kepalan tangan pada setiap tanaman baik dalam pot, polibag atau bedengan. Dan NPK sebanyak 2 gram per tanaman.</p>
""";

class _InformasiPemupukanScreenState extends State<InformasiPemupukanScreen> {
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
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cara pemupukan",
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
                      padding: const EdgeInsets.only(bottom: 10),
                    )
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Rekomendasi Pupuk",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            // margin: const EdgeInsets.symmetric(vertical: 2),
            height: 230,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => Stack(
                      children: [
                        Card(
                          // margin: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.all(0),
                          color: Colors.white,
                          surfaceTintColor: Colors.transparent,
                          elevation: 15,

                          shadowColor: Colors.black26,
                          // shadowColor: const Color.fromARGB(40, 0, 0, 0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Image.asset(
                                  "assets/images/sample_tomat.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: AutoSizeText(
                                        "Pupuk NPK Mutiara 16-16-16",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        minFontSize: 13,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: AutoSizeText(
                                        "Rp 100.000.000",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: neutral[40]),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: 5),
          ),
          const SizedBox(height: 5)
        ],
      ),
    );
  }
}
