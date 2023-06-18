import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/toko/screen/detail_produk.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';
import 'package:mobile_flutter/services/toko/service_get_product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/kategori_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/url_image.dart';

class ListProduk extends StatefulWidget {
  final String category;
  final List<Produk> productList;

  const ListProduk(
      {required this.category, required this.productList, Key? key})
      : super(key: key);

  @override
  ListProdukState createState() => ListProdukState();
}

class ListProdukState extends State<ListProduk> {
  late KategoriProvider kategoriProvider;
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    kategoriProvider = Provider.of<KategoriProvider>(context, listen: false);
    fetchProducts();
  }

  void fetchProducts() async {
    ProductService productService = ProductService();
    kategoriProvider.setLoading(true);
    List<Produk> fetchedProducts =
        await productService.fetchProductsByCategory(widget.category);
    kategoriProvider.setProducts(fetchedProducts);
    kategoriProvider.setLoading(false);
  }

  void filterProductsByCategory(String category) {
    if (category.isNotEmpty) {
      List<Produk> filteredProducts = kategoriProvider.products
          .where((product) => product.productName!
              .toLowerCase()
              .contains(category.toLowerCase()))
          .toList();
      kategoriProvider.setFilteredProducts(filteredProducts);
    } else {
      kategoriProvider.setFilteredProducts(kategoriProvider.products);
    }
  }

  void resetSearch() {
    filterProductsByCategory("");
    textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
            color: neutral[90],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.category,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      body: Consumer<KategoriProvider>(
        builder: (context, kategoriProvider, _) {
          return kategoriProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primary[300]!),
                  ),
                )
              : !kategoriProvider.isProductAvailable
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/toko_image/empty_product.svg',
                            width: size.width * 0.5,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AutoSizeText(
                              ' Tidak ada produk ${widget.category} yang tersedia',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: textFieldController,
                            onChanged: (search) {
                              filterProductsByCategory(search);
                            },
                            style: Theme.of(context).textTheme.bodyLarge,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              filled: true,
                              fillColor: neutral[10],
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: IconButton(
                                onPressed: resetSearch,
                                icon:
                                    const Icon(Icons.highlight_remove_outlined),
                              ),
                              hintStyle: Theme.of(context).textTheme.bodyLarge,
                              hintText: "Cari Produk disini...",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: neutral[70]!),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: kategoriProvider.filteredProducts.isEmpty
                              ? Center(
                                  child: SingleChildScrollView(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/toko_image/empty.png',
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: AutoSizeText(
                                              'Sepertinya produk yang kamu cari belum tersedia di etalase',
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  width: size.width,
                                  height: size.height * 0.47,
                                  child: GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: kategoriProvider
                                        .filteredProducts.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 7 / size.height * 80,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                    ),
                                    itemBuilder: (context, index) {
                                      Produk current = kategoriProvider
                                          .filteredProducts[index];
                                      return GestureDetector(
                                        onTap: () {
                                          pushNewScreen(
                                            context,
                                            screen: Details(
                                              productId: current.id!,
                                            ),
                                            withNavBar: false,
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Card(
                                            margin: const EdgeInsets.all(0),
                                            elevation: 10,
                                            shadowColor: Colors.black26,
                                            surfaceTintColor:
                                                Colors.transparent,
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
                                                                      neutral[
                                                                          20],
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
                                                    alignment:
                                                        Alignment.topLeft,
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
                                                            child:
                                                                ReuseablePrice(
                                                              price: current
                                                                  .productPrice!
                                                                  .toDouble(),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        3),
                                                            child: SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.38,
                                                              child:
                                                                  AutoSizeText(
                                                                "${current.productSeen}RB dilihat",
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
                                  ),
                                ),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
