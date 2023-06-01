import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../utils/themes/custom_color.dart';

class InformasiTempIdealScreen extends StatefulWidget {
  const InformasiTempIdealScreen({super.key});

  @override
  State<InformasiTempIdealScreen> createState() =>
      _InformasiTempIdealScreenState();
}

const String htmlData = """
<p>Tanaman tomat bisa tumbuh baik di dataran tinggi (lebih dari 700 m dpi), dataran medium (200 m - 700 m dpi), dan dataran rendah (kurang dari 200 m dpl).</p>

<p>Faktor temperatur dapat mempengaruhi warna buah. Pada temperatur tinggi (di atas 32&deg;C) warna buah tomat cenderung kuning, sedangkan pada temperatur tidak tetap warna buah cenderung tidak merata.</p>

<p>Temperatur ideal dan berpengaruh baik terhadap warna buah tomat adalah antara 24&deg;C - 28&deg;C yang umumnya merah merata.</p>
""";

class _InformasiTempIdealScreenState extends State<InformasiTempIdealScreen> {
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
                  "Temperatur Ideal",
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
                  data: htmlData,
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
