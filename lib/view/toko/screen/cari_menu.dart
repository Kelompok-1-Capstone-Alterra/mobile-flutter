import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko_model.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/toko/screen/detail_produk.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:provider/provider.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/search_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ListAllProduk extends StatefulWidget {
  final List<BaseModel> allProducts;

  const ListAllProduk({required this.allProducts, Key? key}) : super(key: key);

  @override
  ListAllProdukState createState() => ListAllProdukState();
}

class ListAllProdukState extends State<ListAllProduk> {
  late List<BaseModel> allProducts;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(products: widget.allProducts),
      child: Consumer<SearchProvider>(builder: (context, searchProvider, _) {
        allProducts = searchProvider.filteredProducts;

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
                  "Semua Produk",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (search) {
                    searchProvider.onSearch(search);
                    if (search.isEmpty) {
                      searchProvider.resetFilter();
                    }
                  },
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    filled: true,
                    fillColor: neutral[10],
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        searchProvider.onSearch('');
                        searchProvider.resetFilter();
                      },
                      icon: const Icon(
                        Icons.highlight_remove_outlined,
                      ),
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
                child: allProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/toko_image/empty.png',
                              width: 200,
                              height: 200,
                            ),
                            Text(
                              'Sepertinya produk yang kamu cari belum tersedia dietalase',
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: size.width,
                        height: size.height * 0.47,
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: allProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 7 / size.height * 90,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (context, index) {
                            BaseModel current = allProducts[index];
                            return GestureDetector(
                              onTap: () {
                                pushNewScreen(context,
                                    screen: Details(
                                      data: current,
                                      isCameFromProduk: true,
                                    ),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Card(
                                  margin: const EdgeInsets.all(0),
                                  elevation: 10,
                                  shadowColor: Colors.black26,
                                  surfaceTintColor: Colors.transparent,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  AssetImage(current.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.38,
                                                  child: AutoSizeText(
                                                    current.name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    minFontSize: 14,
                                                    maxLines: 2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.38,
                                                    child: ReuseablePrice(
                                                      price: current.price,
                                                    )),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.38,
                                                  child: AutoSizeText(
                                                    "${current.review.toString()}RB dilihat",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                    maxLines: 1,
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
          ),
        );
      }),
    );
  }
}
