import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/view/informasi/youtube_player_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/themes/custom_color.dart';

class InformasiCaraMenanamScreen extends StatefulWidget {
  const InformasiCaraMenanamScreen({super.key});

  @override
  State<InformasiCaraMenanamScreen> createState() =>
      _InformasiCaraMenanamScreenState();
}

String _htmlData = ('''
<p><strong>1. Memilih Bibit Tomat</strong></p>
<p>
    Memilih bibit buah tomat adalah langkah yang paling penting dalam menanam
    tomat. Pilihlah bibit tomat yang baik yang terbebas dari hama. Kamu bisa
    memilih buah tomat yang benar-benar matang ditandai dengan warna yang merah
    dan kulit yang tipis. Selain itu biji tomat juga tampak besar dan jika
    direndam tidak terapung.
</p>
<p>
    Tetapi jika kamu masih ragu, alangkah lebih baiknya kamu membeli bibit
    unggulan pada petani atau datang saja kios pertanian. Tentu bibit dari petani
    atau kios pertanian memiliki kemungkinan bibitnya lebih berkualitas.
</p>
<p><br /></p>
<p><strong>2. Penyemaian</strong></p>
<p>
    Langkah awal setelah memilih biji tomat adalah penyemaian. Biji tomat disemai
    terlebih dahulu di dalam kotak pesemaian. Media persemaian berupa campuran
    tanah dan pupuk kandang dengan perbandingan 1:1.
</p>
<p>
    Benih ditanamkan kedalam kotak pesemaian dan diletakkan di tempat yang teduh
    sehingga curahan hujan tidak merusak benih yang masih lemah.
</p>
<p>
    Bibit lalu dipindahkan ke dalam polybag kecil setelah bibit mempunyai 5 helai
    daun. Bibit yang telah berumur ± 1 bulan dapat dipindah ke dalam pot/polybag.
</p>
<p><br /></p>
<p><strong>3. Tanam Tomat</strong></p>
<p>
    Setelah berumur 20 hari , pindahkan benih tomat pada lahan yang telah
    disiapkan. Jangan lupa untuk menggemburkan tanah lahan dan memberikan pupuk.
    Berhati-hatilah saat melepaskan benih dari polybag agar akar tidak rusak.
</p>
<p>
    Kamu bisa juga menggunakan ember bekas yang sudah dibersihkan. Campuran dari
    tanah, pasir dan kompos dengan perbandingan 1:1:1. Selama masa penanaman,
    rajinlah memberi pupuk. Gunakan pupuk kompos sehingga tomat menjadi lebih
    organik.
</p>
<p><br /></p>
<p><strong>4. Perawatan Tomat</strong></p>
<p>
    Jangan lupa untuk menyirami tanaman tomat setiap hari. Seringlah melihat
    apakah ada tanaman lain yang tumbuh yang akan mengganggu pertumbuhan tomat.
    Jika ada cabut secara rutin agar tomat bisa tumbuh dengan baik.
</p>
<p>
    Selain itu, jangan lupa untuk menancapkan bambu di samping tanaman sebagai
    media tomat untuk merambat.
</p>
<p><br /></p>
<p><strong>5. Panen</strong></p>
<p>
    <span class="ql-cursor">﻿</span>Setelah 60 hari hingga 90 hari sejak masa
    tanam, tanaman tomnat biasanya sudah bisa dapat dipanen. Kamu pun bisa
    melakukan panen, memetik tomat dari halaman rumah kamu. Setelah itu, kamu pun
    bisa mengonsumsi tomat yang kaya akan vitamin.
</p>
''');

class _InformasiCaraMenanamScreenState
    extends State<InformasiCaraMenanamScreen> {
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
          Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.amber,
                  child: Image.network(
                    YoutubePlayer.getThumbnail(videoId: "WOpnA9pyno4"),
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.vertical,
                        children: [
                          const Icon(Icons.wifi_off),
                          Text(
                            "connection eror",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  pushNewScreen(
                    context,
                    screen: const YoutubePlayerScreen(ytKey: "WOpnA9pyno4"),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: const CircleBorder(),
                  // backgroundColor: nicepurple.withOpacity(0.5),
                  backgroundColor: Colors.black12,
                ),
                child: const Icon(
                  FluentIcons.video_clip_20_regular,
                  size: 45,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  'Cara menanam',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'dengan pot',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alat dan Bahan",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "1. Tanah Subur",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "2. Bibit Tomat",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "3. Pupuk",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Cara Menanam",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 3,
                ),
                Html(
                  data: _htmlData,
                  style: {
                    'p': Style(
                      textAlign: TextAlign.justify,
                    ),
                    '#': Style(margin: Margins.symmetric(horizontal: 0))
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
