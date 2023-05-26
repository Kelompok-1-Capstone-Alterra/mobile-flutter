import 'package:mobile_flutter/models/toko_model.dart';

List<Crousel> crousel = [
  Crousel(
    id: 1,
    imageUrl: "assets/images/toko_image/baner.png",
  ),
  Crousel(
    id: 2,
    imageUrl: "assets/images/toko_image/baner.png",
  ),
];

List<Category> category = [
  Category(
    id: 1,
    imageUrl: "assets/images/toko_image/icon/icon-tractor.png",
    name: "Alat Tani",
  ),
  Category(
    id: 2,
    imageUrl: "assets/images/toko_image/icon/icon-park-solid_hold-seeds.png",
    name: "Pupuk",
  ),
  Category(
    id: 3,
    imageUrl: "assets/images/toko_image/icon/icon-park-outline_pesticide.png",
    name: "Pestisida",
  ),
  Category(
    id: 4,
    imageUrl: "assets/images/toko_image/icon/icon-leaf.png",
    name: "Bibit",
  ),
];
List<BaseModel> getAllProducts() {
  List<BaseModel> allProducts = [];

  allProducts.addAll(getAlatTaniProducts());
  allProducts.addAll(getPupukProducts());
  allProducts.addAll(getPestisidaProducts());
  allProducts.addAll(getBibitProducts());

  return allProducts;
}

List<BaseModel> getProductsByCategory(String category) {
  switch (category) {
    case 'Alat Tani':
      return getAlatTaniProducts();
    case 'Pupuk':
      return getPupukProducts();
    case 'Pestisida':
      return getPestisidaProducts();
    case 'Bibit':
      return getBibitProducts();
    default:
      return [];
  }
}

List<BaseModel> getAlatTaniProducts() {
  // Implementasi untuk mendapatkan daftar produk Alat Tani
  return [
    BaseModel(
      imageUrl: "assets/images/toko_image/alat_tani/alat1.png",
      name: "Harvester",
      price: 100000,
      review: 6.6,
      star: 4.8,
      id: 1,
      simpleDeskripsi: "Deskripsi Alat Tani Harvester",
      deskripsi: "Detail Alat Tani Harvester",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/alat_tani/alat2.png",
      name: "Rotavator",
      price: 100000,
      review: 8.6,
      star: 4.8,
      id: 2,
      simpleDeskripsi: "Deskripsi Alat Tani Rotavator",
      deskripsi: "Detail Alat Tani Rotavator",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/alat_tani/alat3.png",
      name: "Traktor",
      price: 100000,
      review: 4.6,
      star: 4.8,
      id: 3,
      simpleDeskripsi: "Deskripsi Alat Tani Traktor",
      deskripsi: "Detail Alat Tani Traktor",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/alat_tani/alat4.png",
      name: "DIY Alat Berkebun",
      price: 100000,
      review: 1.6,
      star: 4.8,
      id: 4,
      simpleDeskripsi: "Deskripsi Alat Tani DIY Alat Berkebun",
      deskripsi: "Detail Alat Tani DIY Alat Berkebun",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/alat_tani/alat5.png",
      name: "Sprayer",
      price: 100000,
      review: 2.6,
      star: 4.8,
      id: 5,
      simpleDeskripsi: "Deskripsi Alat Tani Sprayer",
      deskripsi: "Detail Alat Tani Sprayer",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/alat_tani/alat6.png",
      name: "Kultivator",
      price: 100000,
      review: 4.6,
      star: 4.8,
      id: 6,
      simpleDeskripsi:
          "<p>Kultivator merupakan traktor kecil atau traktor mini dengan gerak motor bensin rata-rata 5,5 HP - 6,5 HP tergantung tipe tanah tempat penanaman.</p>",
      deskripsi: """
    <p>Kultivator merupakan traktor kecil atau traktor mini dengan gerak motor bensin rata-rata 5,5 HP - 6,5 HP tergantung tipe tanah tempat penanaman.</p>
    <p>Kondisi: Baru</p>
    <p>Berat: 100 kg</p>
    <p>Merek: Tasco</p>
    <p>Memiliki:</p>
    <ul>
      <li>pisau/blade/rotary atau cakar yang terletak pada poros as utama. Pisau ini digunakan untuk mencacah tanah sekaligus untuk berjalan kedepan.</li>
      <li>ridger yang dipasang pada bagian belakang dari pisau yang berguna untuk membuat guludan atau bedengan atau pembumbunan. Ridger hanya bermanfaat membuat parit di tanah yang telah dicacah sebelumnya oleh pisau rotary.</li>
    </ul>
    <p>Manfaat:</p>
    <ul>
      <li>untuk penyiangan dan memberantas tanaman pengganggu seperti gulma atau rumput</li>
      <li>untuk membuat guludan/bedengan;</li>
      <li>untuk memperbaiki aerasi tanah dan mempertahankan kadar lengas tanah;</li>
      <li>untuk memacu kerja mikroorganisme lebih aktif;</li>
      <li>untuk mengembangkan penyediaan unsur hara dalam tanah;</li>
      <li>untuk menggemburkan tanah agar penetrasi akar tanaman pokok lebih mudah.</li>
    </ul>
  """,
    ),
  ];
}

List<BaseModel> getPupukProducts() {
  // Implementasi untuk mendapatkan daftar produk Pupuk
  return [
    BaseModel(
      imageUrl: "assets/images/toko_image/pupuk/pupuk2.png",
      name: "Pupuk NPK Mutiara 16-16-16",
      price: 100000,
      review: 6.6,
      star: 4.8,
      id: 2,
      simpleDeskripsi: "Deskripsi Pupuk NPK Mutiara 16-16-16",
      deskripsi: "Detail Pupuk NPK Mutiara 16-16-16",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pupuk/pupuk1.png",
      name: "Pupuk CPN KNO3 Merah",
      price: 100000,
      review: 4.6,
      star: 4.8,
      id: 1,
      simpleDeskripsi: "Deskripsi Pupuk  CPN KNO3 Merah",
      deskripsi: "Detail Pupuk CPN KNO3 Merah",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pupuk/pupuk6.png",
      name: "Pupuk Organik Cair",
      price: 100000,
      review: 5.6,
      star: 4.8,
      id: 3,
      simpleDeskripsi: "Deskripsi Pupuk Organik Cair",
      deskripsi: "Detail Pupuk Organik Cair",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pupuk/pupuk4.png",
      name: "Pupuk Maroke",
      price: 100000,
      review: 5.6,
      star: 4.8,
      id: 4,
      simpleDeskripsi: "Deskripsi Pupuk Maroke",
      deskripsi: "Detail Pupuk Maroke",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pupuk/pupuk5.png",
      name: "Pupuk Kompos",
      price: 100000,
      review: 9.6,
      star: 4.8,
      id: 5,
      simpleDeskripsi: "Deskripsi Pupuk Kompos",
      deskripsi: "Detail Pupuk Kompos",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pupuk/pupuk3.png",
      name: "Pupuk Gandalis",
      price: 100000,
      review: 7.6,
      star: 4.8,
      id: 6,
      simpleDeskripsi: "Deskripsi Pupuk Gandalis",
      deskripsi: "Detail Pupuk Gandalis",
    ),
  ];
}

List<BaseModel> getPestisidaProducts() {
  // Implementasi untuk mendapatkan daftar produk Pestisida
  return [
    BaseModel(
      imageUrl: "assets/images/toko_image/pestisida/pestisida1.png",
      name: "Pestisida Go Go Pest",
      price: 100000,
      review: 3.6,
      star: 4.8,
      id: 1,
      simpleDeskripsi: "Deskripsi Pestisida Go Go Pest",
      deskripsi: "Detail Pestisida Go Go Pest",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pestisida/pestisida2.png",
      name: "Pestisida Nabati Organik",
      price: 100000,
      review: 7.6,
      star: 4.8,
      id: 2,
      simpleDeskripsi: "Deskripsi Pestisida Nabati Organik",
      deskripsi: "Detail Pestisida Nabati Organik",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pestisida/pestisida3.png",
      name: "Fungisida Antracol",
      price: 100000,
      review: 5.6,
      star: 4.8,
      id: 3,
      simpleDeskripsi: "Deskripsi Fungisida Antracol",
      deskripsi: "Detail Fungisida Antracol",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pestisida/pestisida4.png",
      name: "Fungisida Bio3co",
      price: 100000,
      review: 2.6,
      star: 4.8,
      id: 4,
      simpleDeskripsi: "Deskripsi Fungisida Bio3co",
      deskripsi: "Detail Fungisida Bio3co",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pestisida/pestisida5.png",
      name: "Insektisida Curacon",
      price: 100000,
      review: 8.6,
      star: 4.8,
      id: 5,
      simpleDeskripsi: "Deskripsi Insektisida Curacon",
      deskripsi: "Detail Insektisida Curacon",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/pestisida/pestisida6.png",
      name: "Pestisida Neem Oil",
      price: 100000,
      review: 1.6,
      star: 4.8,
      id: 6,
      simpleDeskripsi: "Deskripsi Pestisida Neem Oil",
      deskripsi: "Detail Pestisida Neem Oil",
    ),
  ];
}

List<BaseModel> getBibitProducts() {
  // Implementasi untuk mendapatkan daftar produk Bibit
  return [
    BaseModel(
      imageUrl: "assets/images/toko_image/bibit/bibit1.png",
      name: "Bibit Bawang Merah",
      price: 100000,
      review: 7.6,
      star: 4.8,
      id: 1,
      simpleDeskripsi: "Deskripsi Bibit Bawang Merah",
      deskripsi: "Detail Bibit Bawang Merah",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/bibit/bibit2.png",
      name: "Benih Melon",
      price: 100000,
      review: 3.6,
      star: 4.8,
      id: 2,
      simpleDeskripsi: "Deskripsi Benih Melon",
      deskripsi: "Detail Benih Melon",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/bibit/bibit3.png",
      name: "Bibit Pakcoy",
      price: 100000,
      review: 1.6,
      star: 4.8,
      id: 3,
      simpleDeskripsi: "Deskripsi Bibit Pakcoy",
      deskripsi: "Detail Bibit Pakcoy",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/bibit/bibit4.png",
      name: "Bibit Tomat",
      price: 100000,
      review: 9.6,
      star: 4.8,
      id: 4,
      simpleDeskripsi: "Deskripsi Bibit Tomat",
      deskripsi: "Detail Bibit Tomat",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/bibit/bibit5.png",
      name: "Benih Blueberry",
      price: 100000,
      review: 7.5,
      star: 4.8,
      id: 5,
      simpleDeskripsi: "Deskripsi Benih Blueberry",
      deskripsi: "Detail Benih Blueberry",
    ),
    BaseModel(
      imageUrl: "assets/images/toko_image/bibit/bibit6.png",
      name: "Benih Bunga Sakura",
      price: 100000,
      review: 4.9,
      star: 4.8,
      id: 6,
      simpleDeskripsi: "Deskripsi Benih Bunga Sakura",
      deskripsi: "Detail Benih Bunga Sakura",
    ),
  ];
}

List<BaseModel> mainList = [
  BaseModel(
    imageUrl: "assets/images/toko_image/alat_tani/alat6.png",
    name: "Kultivator",
    price: 100000,
    review: 4.6,
    star: 4.8,
    id: 1,
    simpleDeskripsi:
        "<p>Kultivator merupakan traktor kecil atau traktor mini dengan gerak motor bensin rata-rata 5,5 HP - 6,5 HP tergantung tipe tanah tempat penanaman.</p>",
    deskripsi: """
    <p>Kultivator merupakan traktor kecil atau traktor mini dengan gerak motor bensin rata-rata 5,5 HP - 6,5 HP tergantung tipe tanah tempat penanaman.</p>
    <p>Kondisi: Baru</p>
    <p>Berat: 100 kg</p>
    <p>Merek: Tasco</p>
    <p>Memiliki:</p>
    <ul>
      <li>pisau/blade/rotary atau cakar yang terletak pada poros as utama. Pisau ini digunakan untuk mencacah tanah sekaligus untuk berjalan kedepan.</li>
      <li>ridger yang dipasang pada bagian belakang dari pisau yang berguna untuk membuat guludan atau bedengan atau pembumbunan. Ridger hanya bermanfaat membuat parit di tanah yang telah dicacah sebelumnya oleh pisau rotary.</li>
    </ul>
    <p>Manfaat:</p>
    <ul>
      <li>untuk penyiangan dan memberantas tanaman pengganggu seperti gulma atau rumput</li>
      <li>untuk membuat guludan/bedengan;</li>
      <li>untuk memperbaiki aerasi tanah dan mempertahankan kadar lengas tanah;</li>
      <li>untuk memacu kerja mikroorganisme lebih aktif;</li>
      <li>untuk mengembangkan penyediaan unsur hara dalam tanah;</li>
      <li>untuk menggemburkan tanah agar penetrasi akar tanaman pokok lebih mudah.</li>
    </ul>
  """,
  ),
  BaseModel(
    imageUrl: "assets/images/toko_image/pestisida/pestisida2.png",
    name: "Pestisida Nabati Organik",
    price: 100000,
    review: 7.6,
    star: 4.8,
    id: 2,
    simpleDeskripsi: "Deskripsi Pestisida Nabati Organik",
    deskripsi: """
    <p>Pestisida merupakan Pestisida kecil atau traktor mini dengan gerak motor bensin rata-rata 5,5 HP - 6,5 HP tergantung tipe tanah tempat penanaman.</p>
    <p>Kondisi: Baru</p>
    <p>Berat: 100 kg</p>
    <p>Merek: Tasco</p>
    <p>Memiliki:</p>
    <ul>
      <li>pisau/blade/rotary atau cakar yang terletak pada poros as utama. Pisau ini digunakan untuk mencacah tanah sekaligus untuk berjalan kedepan.</li>
      <li>ridger yang dipasang pada bagian belakang dari pisau yang berguna untuk membuat guludan atau bedengan atau pembumbunan. Ridger hanya bermanfaat membuat parit di tanah yang telah dicacah sebelumnya oleh pisau rotary.</li>
    </ul>
    <p>Manfaat:</p>
    <ul>
      <li>untuk penyiangan dan memberantas tanaman pengganggu seperti gulma atau rumput</li>
      <li>untuk membuat guludan/bedengan;</li>
      <li>untuk memperbaiki aerasi tanah dan mempertahankan kadar lengas tanah;</li>
      <li>untuk memacu kerja mikroorganisme lebih aktif;</li>
      <li>untuk mengembangkan penyediaan unsur hara dalam tanah;</li>
      <li>untuk menggemburkan tanah agar penetrasi akar tanaman pokok lebih mudah.</li>
    </ul>
  """,
  ),
  BaseModel(
    imageUrl: "assets/images/toko_image/pestisida/pestisida3.png",
    name: "Fungisida Antracol",
    price: 100000,
    review: 5.6,
    star: 4.8,
    id: 3,
    simpleDeskripsi: "Deskripsi Fungisida Antracol",
    deskripsi: "Detail Fungisida Antracol",
  ),
  BaseModel(
    imageUrl: "assets/images/toko_image/pupuk/pupuk4.png",
    name: "Pupuk Maroke",
    price: 100000,
    review: 5.6,
    star: 4.8,
    id: 4,
    simpleDeskripsi: "Deskripsi Pupuk Maroke",
    deskripsi: "Detail Pupuk Maroke",
  ),
  BaseModel(
    imageUrl: "assets/images/toko_image/bibit/bibit5.png",
    name: "Benih Blueberry",
    price: 100000,
    review: 7.5,
    star: 4.8,
    id: 5,
    simpleDeskripsi: "Deskripsi Benih Blueberry",
    deskripsi: "Detail Benih Blueberry",
  ),
  BaseModel(
    imageUrl: "assets/images/toko_image/bibit/bibit6.png",
    name: "Benih Bunga Sakura",
    price: 100000,
    review: 4.9,
    star: 4.8,
    id: 6,
    simpleDeskripsi: "Deskripsi Benih Bunga Sakura",
    deskripsi: "Detail Benih Bunga Sakura",
  ),
];

List<BaseModel> itemsOnSearch = [];
