import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/models/toko_model.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_button_chat.dart';
import 'package:mobile_flutter/view/toko/screen/detail_produk.dart';
import 'package:mobile_flutter/view/toko/widget/toko_widget/reusable_price.dart';
import 'package:mobile_flutter/view_model/toko_viewmodel/toko_data.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Deskripsi extends StatefulWidget {
  const Deskripsi({
    required this.data,
    super.key,
    required this.isCameFromProduk,
  });

  final BaseModel data;
  final bool isCameFromProduk;

  @override
  State<Deskripsi> createState() => _DeskripsiState();
}

class _DeskripsiState extends State<Deskripsi> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    BaseModel current = widget.data;
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutral[10],
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
                "Deskripsi",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Image.asset(
                'assets/images/toko_image/share.png',
                color: neutral[100],
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Html(
                                      data: current.deskripsi,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Produk Terkait",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.66,
                      width: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(mainList.length, (index) {
                          BaseModel current = mainList[index];
                          return GestureDetector(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: Details(
                                  data: current,
                                  isCameFromProduk: true,
                                ),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.black26,
                                surfaceTintColor: Colors.transparent,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.width * 0.35,
                                      width: size.width * 0.5,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(current.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.45,
                                            child: AutoSizeText(
                                              current.name,
                                              overflow: TextOverflow.ellipsis,
                                              minFontSize: 14,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.45,
                                            child: ReuseablePrice(
                                              price: current.price,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.45,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: AutoSizeText(
                                                "${current.review.toString()}RB dilihat",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 65),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ReuseableButtonChat(
                  text: "Chat Penjual",
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
