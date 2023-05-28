import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/utils/converter/remove_html_tags.dart';

const String _htmlData = r"""
<p>Tomat atau rangam (Solanum lycopersicum) adalah tumbuhan dari keluarga Solanaceae, tumbuhan asli Amerika Tengah dan Selatan, dari Meksiko sampai Peru. Tomat merupakan tumbuhan siklus hidup singkat, dapat tumbuh setinggi 1 sampai 3 meter.</p><br><p>Tumbuhan ini memiliki buah berwarna hijau, kuning, dan merah yang biasa dipakai sebagai sayur dalam masakan atau dimakan secara langsung tanpa diproses.</p><br><p>Tomat memiliki batang dan daun yang tidak dapat dikonsumsi karena masih sekeluarga dengan kentang dan terung yang mengadung alkaloid.</p><br><p>Cara menanam tanaman tomat adalah disemai lebih dahulu, setelah tumbuh 4 daun sejati kemudian ditanam (dijadikan bibit terlebih dahulu). Panen dimulai usia 9 minggu setelah tanam selanjutnya setiap 5 hari.</p>
""";

ValueNotifier<bool> readMore = ValueNotifier(false);

class DescriptionCard extends StatefulWidget {
  const DescriptionCard({super.key});

  @override
  State<DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  @override
  void initState() {
    readMore.value = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: readMore,
        builder: (context, bool readMoreValue, _) {
          if (readMoreValue == false) {
            return Wrap(
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
            );
          } else {
            return Html(
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
            );
          }
        });
  }
}
