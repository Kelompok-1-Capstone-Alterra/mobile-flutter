import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/utils/converter/remove_html_tags.dart';
import 'package:mobile_flutter/view/informasi/lokasi_tanaman_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/overview_card/informasi_tanaman_card.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../utils/themes/custom_color.dart';

enum TabPreview { overview, progress }

class InformasiTanamanScreen extends StatefulWidget {
  const InformasiTanamanScreen({super.key});

  @override
  State<InformasiTanamanScreen> createState() => _InformasiTanamanScreenState();
}

const String _htmlData = r"""
<p>Tomat atau rangam (Solanum lycopersicum) adalah tumbuhan dari keluarga Solanaceae, tumbuhan asli Amerika Tengah dan Selatan, dari Meksiko sampai Peru. Tomat merupakan tumbuhan siklus hidup singkat, dapat tumbuh setinggi 1 sampai 3 meter.</p><br><p>Tumbuhan ini memiliki buah berwarna hijau, kuning, dan merah yang biasa dipakai sebagai sayur dalam masakan atau dimakan secara langsung tanpa diproses.</p><br><p>Tomat memiliki batang dan daun yang tidak dapat dikonsumsi karena masih sekeluarga dengan kentang dan terung yang mengadung alkaloid.</p><br><p>Cara menanam tanaman tomat adalah disemai lebih dahulu, setelah tumbuh 4 daun sejati kemudian ditanam (dijadikan bibit terlebih dahulu). Panen dimulai usia 9 minggu setelah tanam selanjutnya setiap 5 hari.</p>
""";

ValueNotifier<TabPreview> tabActive = ValueNotifier(TabPreview.overview);

ValueNotifier<bool> readMore = ValueNotifier(false);

class _InformasiTanamanScreenState extends State<InformasiTanamanScreen> {
  @override
  void initState() {
    readMore.value = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FloatingActionButton.small(
          heroTag: "asd",
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
          // --------------------------image header--------------------------
          Container(
            color: Colors.amber,
            height: screenHeight * 0.31,
            child: Image.asset(
              "assets/images/sample_tomat.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          // -------------------------- judul dan nama latin --------------------------
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  'Tomat',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Solanum lycopersicum',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: neutral[40]),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          // -------------------------- deskripsi --------------------------
          ValueListenableBuilder(
              valueListenable: readMore,
              builder: (context, bool readMoreValue, _) {
                if (readMoreValue == false) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: Text(
                            parseHtmlString(_htmlData),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(5),
                          onTap: () {
                            readMore.value = !readMore.value;
                          },
                          child: Text("Baca Selengkapnya",
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Html(
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
                  );
                }
              }),

          const SizedBox(
            height: 10,
          ),
          // -------------------------- 4 grid button --------------------------
          const InformasiTanamanCard(),

          //---------------- button tambkan tanaman -----------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                pushNewScreen(context,
                    screen: const LokasiTanamanScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    withNavBar: true);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const LokasiTanamanScreen(),
                //     ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: primary,
                minimumSize: const Size(double.infinity, 0),
                // Mengatur minimumSize dengan double.infinity
              ),
              child: Text(
                'Tambahkan Tanaman',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: neutral[10],
                    ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
