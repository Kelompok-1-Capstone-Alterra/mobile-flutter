import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:provider/provider.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TanamankuProvider>(
      builder: (context, provider, _) {
        return buildDescriptionText(context, provider);
      },
    );
  }

  Widget buildDescriptionText(
      BuildContext context, TanamankuProvider provider) {
    const htmlData = r"""
<p>Tomat atau rangam (Solanum lycopersicum) adalah tumbuhan dari keluarga Solanaceae, tumbuhan asli Amerika Tengah dan Selatan, dari Meksiko sampai Peru. Tomat merupakan tumbuhan siklus hidup singkat, dapat tumbuh setinggi 1 sampai 3 meter.</p><br><p>Tumbuhan ini memiliki buah berwarna hijau, kuning, dan merah yang biasa dipakai sebagai sayur dalam masakan atau dimakan secara langsung tanpa diproses.</p><br><p>Tomat memiliki batang dan daun yang tidak dapat dikonsumsi karena masih sekeluarga dengan kentang dan terung yang mengadung alkaloid.</p><br><p>Cara menanam tanaman tomat adalah disemai lebih dahulu, setelah tumbuh 4 daun sejati kemudian ditanam (dijadikan bibit terlebih dahulu). Panen dimulai usia 9 minggu setelah tanam selanjutnya setiap 5 hari.</p>
""";
//     const htmlData1 = r"""
// <p><strong>Cara Menanam Tomat</strong></p><br><p><strong>1. Memilih Bibit Tomat</strong></p><p>Memilih bibit buah tomat adalah langkah yang paling penting dalam menanam tomat. Pilihlah bibit tomat yang baik yang terbebas dari hama. Kamu bisa memilih buah tomat yang benar-benar matang ditandai dengan warna yang merah dan kulit yang tipis. Selain itu biji tomat juga tampak besar dan jika direndam tidak terapung.</p><p>Tetapi jika kamu masih ragu, alangkah lebih baiknya kamu membeli bibit unggulan pada petani atau datang saja kios pertanian. Tentu bibit dari petani atau kios pertanian memiliki kemungkinan bibitnya lebih berkualitas.</p><br><br><p><strong>2. Penyemaian</strong></p><p>Langkah awal setelah memilih biji tomat adalah penyemaian. Biji tomat disemai terlebih dahulu di dalam kotak pesemaian. Media persemaian berupa campuran tanah dan pupuk kandang dengan perbandingan 1:1. </p><p>Benih ditanamkan kedalam kotak pesemaian dan diletakkan di tempat yang teduh sehingga curahan hujan tidak merusak benih yang masih lemah.</p><p>Bibit lalu dipindahkan ke dalam polybag kecil setelah bibit mempunyai 5 helai daun. Bibit yang telah berumur ± 1 bulan dapat dipindah ke dalam pot/polybag.</p><br><br><p><strong>3. Tanam Tomat</strong></p><p>Setelah berumur 20 hari , pindahkan benih tomat pada lahan yang telah disiapkan. Jangan lupa untuk menggemburkan tanah lahan dan memberikan pupuk. Berhati-hatilah saat melepaskan benih dari polybag agar akar tidak rusak.</p><p>Kamu bisa juga menggunakan ember bekas yang sudah dibersihkan. Campuran dari tanah, pasir dan kompos dengan perbandingan 1:1:1. Selama masa penanaman, rajinlah memberi pupuk. Gunakan pupuk kompos sehingga tomat menjadi lebih organik.</p><br><br><p><strong>4. Perawatan Tomat</strong></p><p>Jangan lupa untuk menyirami tanaman tomat setiap hari. Seringlah melihat apakah ada tanaman lain yang tumbuh yang akan mengganggu pertumbuhan tomat. Jika ada cabut secara rutin agar tomat bisa tumbuh dengan baik.</p><p>Selain itu, jangan lupa untuk menancapkan bambu di samping tanaman sebagai media tomat untuk merambat.</p><br><br><p><strong>5. Panen</strong></p><p><span class="ql-cursor">﻿</span>Setelah 60 hari hingga 90 hari sejak masa tanam, tanaman tomnat biasanya sudah bisa dapat dipanen. Kamu pun bisa melakukan panen, memetik tomat dari halaman rumah kamu. Setelah itu, kamu pun bisa mengonsumsi tomat yang kaya akan vitamin.</p>
// """;

    String plainText = provider.removeHtmlTags(htmlData);

    if (provider.fullDescription) {
      return Html(
        data: htmlData,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        child: Wrap(
          children: [
            Text(
              plainText,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 5, // Maksimal 6 baris
              overflow: TextOverflow.ellipsis, // Menampilkan elipsis
            ),
            buildReadMoreButton(context, provider),
          ],
        ),
      );
    }
    // if (provider.fullDescription) {
    //   return Text(
    //     description,
    //     style: Theme.of(context).textTheme.bodyMedium,
    //   );
    // } else {
    //   return Wrap(
    //     children: [
    //       Text(
    //         description,
    //         style: Theme.of(context).textTheme.bodyMedium,
    //         maxLines: 5, // Maksimal 6 baris
    //         overflow: TextOverflow.ellipsis, // Menampilkan elipsis
    //       ),
    //       buildReadMoreButton(context, provider),
    //     ],
    //   );
    // }
  }

  Widget buildReadMoreButton(BuildContext context, TanamankuProvider provider) {
    if (provider.fullDescription) {
      return Container(); // Tidak menampilkan tombol jika deskripsi sudah ditampilkan penuh
    } else {
      return InkWell(
        onTap: () {
          provider.showFullDescription();
        },
        child: Text('Baca Selengkapnya',
            style: Theme.of(context).textTheme.labelLarge),
      );
    }
  }
}
