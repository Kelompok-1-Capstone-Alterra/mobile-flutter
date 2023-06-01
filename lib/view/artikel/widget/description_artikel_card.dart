import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/artikel_provider.dart';
import 'package:provider/provider.dart';

class DescriptionArtikelCard extends StatelessWidget {
  const DescriptionArtikelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtikelProvider>(
      builder: (context, provider, _) {
        return buildDescriptionText(context, provider);
      },
    );
  }

  Widget buildDescriptionText(BuildContext context, ArtikelProvider provider) {
    const htmlData = r"""
<p>Tomat dikategorikan sebagai sayuran, meskipun memiliki struktur buah. Tanaman yang memiliki nama latin Lycopersium esculentum L, dapat tumbuh baik di dataran rendah maupun tinggi mulai dari 0-1.500 m dpl, tergantung dari varietasnya. Untuk dapat tumbuh dengan baik, memerlukan media tanah yang subur dan gembur, keasaman ph 5,5-7. Tanaman tomat bisa tumbuh dengan baik di media seperti lahan terbuka, hidroponik, taman vertikultur dan media pot/polybag. Cara menanam tomat dalam pot/polybag dapat menjadi solusi dalam memanfaatkan lahan yang sempit. Hal yang perlu dipersiapkan adalah:</p>

<b>Pemilihan Benih</b>
<p>Pemilihan benih sangat menentukan produksi, oleh karena itu perlu seleksi varietas yang akan ditanam, dan sesuaikan lokasi budidaya dengan varietas yang akan ditanam terutama kondisi iklim dan ketinggian tempat.</p>

<b>Persemaian Benih</b>
<p>Benih tomat yang sudah diseleksi selanjutnya harus disemai terlebih dahulu. Penyemaiaan dapat dilakukan di dalam polybag atau nampan dengan media persemaian berupa campuran tanah dan pupuk kandang dengan perbandingan 1:1. Tempat persemaian harus terlindungi dari hujan agar tidak merusak benih yang masih lemah dan sinar matahari secara langsung. Penyiraman media dilakukan sebelum benih disemai agar media semai tidak menjadi padat dan benih tidak tenggelam dalam media persemaian. Setelah benih ditanam, benih ditutup tipis dengan media dan dilakukan penyiraman ulang. Persemaian disarankan ditutup selama 3-5 hari saat perkecambahan awal. Penyiraman benih yang disemai dilakukan 2 kali sehari, jangan sampai merusak permukaan persemaian.Pemupukan tambahan dapat diberikan setelah 2 minggu dengan pupuk cair organik/kompos/ NPK. Penyiangan dilakukan agar gulma tidak sampai tumbuh di area persemaian. Bibit tomat dapat dipindahkan dari persemaian ke dalam pot setelah 21-30 hari atau sudah memiliki minimal 5 helai daun.</p>

<b>Pemindahan benih</b>
<p>Sebelumnya dipersiapkan media tanam dalam pot yang berisi tanah, arang sekam, kompos dengan perbandingan 2:1:1 atau 1:1:1. Bibit dicabut, dengan cara menyiram persemaian dengan air supaya media tanah menjadi lunak. Lalu cabut tanaman tomat, jangan sampai akar tanaman putus atau rusak. Selanjutnya tanaman dimasukkan kedalam pot yang telah berisi media tanam. Posisi akar tegak lurus jangan sampai bengkok. Untuk bibit dalam polybag semai, sobek polybag semai kemudian dipindahkan bersama tanah ke dalam pot.</p>

<b>Perawatan dan Pemeliharaan Tomat</b>
<p>Pemeliharaan tanaman tomat relatif lebih mudah, jangan sampai media tanam menjadi kering, siram 2 kali sehari namun jangan terlalu basah agar akar tidak busuk. Penyiangan gulma yang terdapat dalam pot dilakukan secara teratur. Bila ada tanaman layu atau mati, dicabut segera dan buang agar tidak menular ke tanaman lain. Pemangkasan tunas dan pemberian ajir sebagai penopang buah. Pemberian pupuk tanaman dilakukan setelah 1 minggu dengan kompos sebanyak satu genggam/pot. Penambahan pupuk kompos dilakukan setiap bulan atau bila terlihat tanaman kurang subur. Bila tanaman akan berbuah ditambahkan pupuk buah atau pupuk organik cair.</p>

<b>Panen</b>
<p>Tanaman tomat dalam pot dapat dipanen setelah 3 bulan tanam, tergantung dari varietasnya. Ciri-ciri tanaman tomat yang akan panen perubahan warna pada buah tomat dari warna hijau ke kuning-kuningan. Pemetikan dilakukan pada buah yang telah matang saja. Waktu pemetikan yang paling baik pagi dan sore hari saat matahari tidak terlalu terik.</p>
""";

    return Html(
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
    );
  }
}
