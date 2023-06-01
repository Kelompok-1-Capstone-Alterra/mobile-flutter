import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../utils/themes/custom_color.dart';

class ArtikelCuacaScreen extends StatefulWidget {
  const ArtikelCuacaScreen({super.key});

  @override
  State<ArtikelCuacaScreen> createState() => _ArtikelCuacaScreenState();
}

const String _htmlData = r"""
<p>Air hujan merupakan irigasi alami yang baik bagi tanaman. Airnya mengandung lebih banyak oksigen dan tidak menyimpan bahan kimia seperti klorin yang banyak ditemukan di air ledeng biasa. Akan tetapi, dialiri air hujan secara berlebihan tanpa dibarengi dengan perawatan yang baik, juga dapat merusak tanaman lantaran mempercepat pembusukan pada bagian akar dan tanah.</p>

<p>Berikut 8 cara merawat tanaman yang benar di musim hujan.</p>

<p><b>1. Kurangi frekuensi Penyiraman saat musim hujan</b></p>
<p>Curah hujan yang tinggi membuat debit air yang diberikan pada tanaman outdoor menjadi lebih banyak dari biasanya. Air hujan juga dapat menyebabkan menghilangkan nutrisi tanah karena terhanyut dari tanah.Sebelum memutuskan menyiram tanaman luar ruangan, pastikan untuk memeriksa kondisi tanahnya. Lakukan penyiraman hanya ketika daun dan tanah mulai mengering. Sebab penyiraman yang berlebihan juga dapat menyebabkan tanaman cepat mati.</p>

<p><b>2. Cek Drainase Pot </b></p>
<p>Memilih pot atau media tanam dengan lubang-lubang di bawahnya berfungsi agar ketika terkena hujan, air akan dengan cepat merembes keluar lewat lubang, mengutip FNP.Sebaliknya, jika menggunakan pot tanpa lubang, air akan terperangkap dan membuat akar tanaman cepat busuk.Apabila sudah menggunakan pot berlubang untuk menempatkan tanaman, lepas alas atau piringan potnya dan pastikan pula drainase atau lubang airnya tidak tersumbat batuan atau tanah yang mengeras.</p>

<p><b>3. Pangkas Tanaman Secara Teratur </b></p>
<p>Cara merawat tanaman yang benar di musim hujan selanjutnya adalah memangkas daun yang menguning atau layu dan cabang yang kering dan mati secara rutin. Pemangkasan ini bertujuan untuk menjaga kesehatan tanaman. Apabila membiarkan tanaman tanpa rutin dipangkas bisa membuat daun maupun cabangnya tidak bisa tumbuh lagi kemudian mati. Selain itu, memangkas daun dan cabang tanaman secara teratur dapat merangsang pertumbuhan baru.</p>

<p><b>4. Cabuti Rumput Liar</b></p>
<p>Gulma dan rumput liar dapat tumbuh dengan cepat selama musim penghujan. Jika tidak segera dibersihkan, gulma ini dapat merusak tanaman lantaran keberadaannya menyerap nutrisi yang ditujukan untuk tanaman serta dapat menjadi sarang hama penyakit.Oleh karena itu, lakukan penyiangan atau mencabuti rumput liar yang dapat mengganggu pertumbuhan tanaman jadi kurang maksima</p>

<p><b>5. Singkirkan Tanaman dari hama penyakit</b></p>
<p>Musim hujan cenderung membuat tanaman rentan terhadap serangan hama. Periksa kondisi tanaman secara berkala dari gangguan hama yang kerap muncul seperti jangkrik, ulat, siput, bekicot, dan sebagainya.Selain itu, cuaca yang terlalu basah juga mempermudah munculnya jamur yang menjadi penyakit tanaman. Jamur yang dibiarkan dapat menyebar dan menyerang bagian pohon.Bila perlu berikan insektisida ataupun fungisida untuk menghindari hama dan penyakit pada tanaman Anda.</p>

<p><b>6. Manfaatkan Cacing Tanah </b></p>
<p>Cacing tanah besar manfaatnya untuk tanaman selama musim hujan. Melansir laman Rootbridgers, keberadaan hewan melata ini berguna untuk menyimpan nutrisi dan memastikan tanah tidak kehilangan kesuburannya.Tak hanya itu, cacing tanah juga membantu mengurai lapisan tanah dan membuat lubang-lubang agar tanah tetap teraerasi dan memastikan bahwa air merembes ke bawah permukaan.</p>

<p><b>7. Letakkan Tanaman di pencahayaan yang baik </b></p>
<p>Pemilik tanaman harus memastikan bahwa tanamannya mendapat ventilasi yang baik dan pencahayaan yang cukup dari sinar matahari.Mengingat, tingkat kelembapan cenderung tinggi selama musim hujan, dapat mengurangi kemampuan fisiologis tanaman, mulai dari respirasi hingga fotosintesis</p>


<p><b>8. Berikan Penyangga Tanaman Banyak tanaman </b></p>
<p>rentan terhadap hujan deras dan angin kencang. Agar hujan deras disertai angin tidak merusak tanaman, Anda bisa menambahkan batang penyangga kayu untuk mencegahnya miring bahkan patah.</p>
""";

class _ArtikelCuacaScreenState extends State<ArtikelCuacaScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FloatingActionButton.small(
            heroTag: "fabArtikelCuaca",
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
                    "Peringatan Hujan",
                    style: Theme.of(context).textTheme.headlineSmall,
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
      ),
    );
  }
}
