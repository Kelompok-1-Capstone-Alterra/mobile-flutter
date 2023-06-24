import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko/get_product.dart';
import 'package:mobile_flutter/utils/converter/convert_seen_counter.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/toko/screen/detail_produk.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/carimenu_provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/url_image.dart';

class ListAllProduk extends StatefulWidget {
  const ListAllProduk({Key? key}) : super(key: key);

  @override
  ListAllProdukState createState() => ListAllProdukState();
}

class ListAllProdukState extends State<ListAllProduk> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
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
            Icons.arrow_back_ios,
            color: neutral[90],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Semua Produk",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          return productProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primary[300]!),
                  ),
                )
              : !productProvider.isProductAvailable
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
                              'Tidak ada produk yang tersedia',
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
                              productProvider.filterProducts(search);
                            },
                            style: Theme.of(context).textTheme.bodyLarge,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 18),
                              suffixIcon: IconButton(
                                splashRadius: 5,
                                splashColor: Colors.black.withOpacity(0.01),
                                highlightColor: Colors.black.withOpacity(0.05),
                                onPressed: () {
                                  productProvider.filterProducts("");
                                  textFieldController.clear();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: neutral[70],
                                  size: 20,
                                ),
                              ),
                              hintText: 'Cari Produk disini...',
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(left: 15, right: 10),
                                child: Icon(
                                  FluentIcons.search_16_regular,
                                  size: 30,
                                ),
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: neutral[40]),
                              focusColor: Theme.of(context)
                                  .inputDecorationTheme
                                  .focusColor,
                              focusedBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder,
                              border:
                                  Theme.of(context).inputDecorationTheme.border,
                              disabledBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .disabledBorder,
                            ),
                          ),
                        ),
                        Expanded(
                          child: productProvider.filteredProducts.isEmpty
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
                                    itemCount:
                                        productProvider.filteredProducts.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 5 / 8,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                    ),
                                    itemBuilder: (context, index) {
                                      Produk current = productProvider
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
                                                                seenCounter(current
                                                                    .productSeen!),
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
