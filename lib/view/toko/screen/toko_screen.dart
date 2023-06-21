import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko/toko_model.dart';
import 'package:mobile_flutter/utils/converter/convert_seen_counter.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/toko_data.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_flutter/view/toko/screen/cari_menu.dart';
import 'package:mobile_flutter/view/toko/screen/detail_produk.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:mobile_flutter/view/toko/screen/kategori_produk.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/carousel_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';
import 'package:mobile_flutter/services/toko/service_get_product.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/dashboard_toko_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/url_image.dart';

class TokoScreen extends StatefulWidget {
  const TokoScreen({super.key});

  @override
  State<TokoScreen> createState() => _TokoScreenState();
}

class _TokoScreenState extends State<TokoScreen> {
  List<Produk> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<TokoProvider>(context, listen: false).fetchProducts();
  }

  Future<List<Produk>> fetchProductsByCategory(
      BuildContext context, String category) async {
    try {
      ProductService productService = ProductService();
      List<Produk> fetchedProducts =
          await productService.fetchProductsByCategory(category);
      return fetchedProducts;
    } catch (e) {
      print('Error fetching products by category: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
          body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<TokoProvider>(context, listen: false).fetchProducts(),
        child: SizedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 20, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      pushNewScreen(
                        context,
                        screen: const ListAllProduk(),
                        withNavBar: false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      backgroundColor: neutral[10],
                      surfaceTintColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: neutral[40]!),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14), // Ubah ukuran padding tombol
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FluentIcons.search_16_regular,
                          color: neutral[70],
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Cari Kebutuhan disini...",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: neutral[40]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Body Slider
                Consumer<CarouselProvider>(
                  builder: (context, carouselProvider, _) => Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.4,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          enableInfiniteScroll: true,
                          onPageChanged: (index, reason) {
                            carouselProvider.setCurrentSlide(index);
                          },
                        ),
                        items: crousel.map((data) {
                          return GestureDetector(
                            child: card(data, textTheme, size),
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 25.0,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: crousel.asMap().entries.map((entry) {
                              int index = entry.key;
                              return Container(
                                width: 20.0,
                                height: 6.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: carouselProvider.currentSlide %
                                              crousel.length ==
                                          index
                                      ? primary[300]
                                      : neutral[30],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (final item in category)
                        GestureDetector(
                          onTap: () async {
                            List<Produk> fetchedProducts =
                                await fetchProductsByCategory(
                                    context, item.name);
                            if (context.mounted) {
                              pushNewScreen(
                                context,
                                screen: ListProduk(
                                  category: item.name,
                                  productList: fetchedProducts,
                                ),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 65.0,
                                height: 65.0,
                                decoration: BoxDecoration(
                                  color: primary[400],
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Transform.scale(
                                        scale: 0.5,
                                        child: SvgPicture.asset(
                                          item.imageUrl,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                item.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 14, color: neutral[90]),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                /// Spesial Untukmu
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spesial Untukmu",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 19,
                                ),
                      ),
                    ],
                  ),
                ),

                /// Spesial Untukmu
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: size.width,
                  child: Consumer<TokoProvider>(
                    builder: (context, tokoProvider, _) {
                      return tokoProvider.isLoading
                          ? Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    primary[300]!), // Ubah warna menjadi merah
                              ),
                            )
                          : tokoProvider.products.isNotEmpty
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: tokoProvider.products.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 7 / size.height * 80,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                  ),
                                  itemBuilder: (context, index) {
                                    Produk current =
                                        tokoProvider.products[index];
                                    return GestureDetector(
                                      onTap: () {
                                        pushNewScreen(
                                          context,
                                          screen: Details(
                                            productId: current.id!,
                                          ),
                                          withNavBar: false,
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Card(
                                          margin: const EdgeInsets.all(0),
                                          elevation: 10,
                                          shadowColor: Colors.black26,
                                          surfaceTintColor: Colors.transparent,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                // child: Container(
                                                //   decoration: BoxDecoration(
                                                //     image: DecorationImage(
                                                //       image: AssetImage(current
                                                //           .productPictures![0]),
                                                //       fit: BoxFit.cover,
                                                //     ),
                                                //   ),
                                                // ),

                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          '${UrlImage.imgurl}${current.productPictures![0]}'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned.fill(
                                                        child: Image.network(
                                                          '${UrlImage.imgurl}${current.productPictures![0]}',
                                                          fit: BoxFit.cover,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Container(
                                                                width: 130,
                                                                height: 105,
                                                                color:
                                                                    neutral[20],
                                                                child: const Icon(
                                                                    Icons
                                                                        .image_not_supported_outlined));
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          child: AutoSizeText(
                                                            current
                                                                .productName!,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            minFontSize: 14,
                                                            maxLines: 2,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.38,
                                                          child: ReuseablePrice(
                                                            price: current
                                                                .productPrice!
                                                                .toDouble(),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 3),
                                                          child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.38,
                                                            child: AutoSizeText(
                                                              seenCounter(current
                                                                  .productSeen!),
                                                              // seenCounter(2345),
                                                              // "${current.productSeen}RB dilihat",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Mohon maaf tidak ada produk yang tersedia",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  /// Page view Cards
  Widget card(Crousel data, TextTheme theme, Size size) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 5,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                image: AssetImage(data.imageUrl),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
