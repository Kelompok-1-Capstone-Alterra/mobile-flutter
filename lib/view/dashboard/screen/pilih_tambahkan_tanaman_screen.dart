import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import '../../../utils/widget/myplant_card_item/myplant_card_widget.dart';
import '../../../view_model/dashboard_viewmodel/tambahkan_tanaman_provider.dart';
import '../../informasi/informasi_tanaman_screen.dart';

class PilihTambahTanamanScreen extends StatefulWidget {
  const PilihTambahTanamanScreen({super.key});

  @override
  State<PilihTambahTanamanScreen> createState() =>
      _PilihTambahTanamanScreenState();
}

const double _horizontalPadding = 20;

class _PilihTambahTanamanScreenState extends State<PilihTambahTanamanScreen> {
  @override
  void initState() {
    context.read<TambahkanTanamanProvider>().showData =
        List.from(context.read<TambahkanTanamanProvider>().data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          // leadingWidth: screenWidth * 0.1,
          title: AutoSizeText(
            "Tambahkan Tanaman",
            maxFontSize: 22,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: IconButton(
            padding: const EdgeInsets.all(5),
            onPressed: () {
              //
              // ini untuk back dan clear lagi search nya
              //
              Navigator.pop(context);
              context.read<TambahkanTanamanProvider>().clearSearch();
            },
            icon: const Icon(
              FluentIcons.chevron_left_16_regular,
              size: 30,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 80,
              child: TextField(
                // textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.center,

                onSubmitted: (value) {
                  context.read<TambahkanTanamanProvider>().search();
                },

                textInputAction: TextInputAction.search,
                maxLength: 30,
                controller:
                    context.read<TambahkanTanamanProvider>().searchField,

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    splashRadius: 5,
                    splashColor: Colors.black.withOpacity(0.01),
                    highlightColor: Colors.black.withOpacity(0.05),
                    onPressed: () {
                      //
                      // clear text field kalau pencet icon X

                      context.read<TambahkanTanamanProvider>().clearSearch();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  hintText: 'Cari Tanaman',
                  prefixIcon: const Icon(
                    FluentIcons.search_16_regular,
                  ),
                  focusColor: Theme.of(context).inputDecorationTheme.focusColor,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  border: Theme.of(context).inputDecorationTheme.border,
                  disabledBorder:
                      Theme.of(context).inputDecorationTheme.disabledBorder,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Consumer<TambahkanTanamanProvider>(
              builder: (context, provider, _) {
                //
                // kalau data query di text field nya kosong tapi data list ga kosong

                if ((provider.searchQuery == "" ||
                        provider.searchField.text.toLowerCase().isEmpty) &&
                    provider.data.isNotEmpty) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 6 / 7,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: provider.showData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          const CardMyPlantWidgetLoading(),
                          // CardMyPlantWidget(
                          //   data: provider.data[index],
                          // ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  pushNewScreen(context,
                                      screen: const InformasiTanamanScreen(),
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                      withNavBar: true);

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           InformasiTanamanScreen(),
                                  //     ));
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );

                  //
                  // kalau data di bagian show data tidak kosong
                } else if (provider.showData.isNotEmpty) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 6 / 7,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: provider.showData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          const CardMyPlantWidgetLoading(),
                          // CardMyPlantWidget(
                          //   data: provider.showData[index],
                          // ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {},
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );

                  //
                  // kalau data di showData kosong
                } else if (provider.showData.isEmpty &&
                    provider.data.isNotEmpty) {
                  return SizedBox(
                    height: screenHeight * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.3,
                              child: SvgPicture.asset(
                                  "assets/svg/tambah_tanaman_empty.svg",
                                  fit: BoxFit.cover),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: screenWidth * 0.8,
                              child: AutoSizeText(
                                "Sepertinya tanaman '${provider.searchField.text}' belum terdaftar",
                                minFontSize: 14,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: screenWidth * 0.8,
                              child: RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      text: "Ingin tanamanmu ditambahkan?",
                                    ),
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      text: " klik disini",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 110,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 15,
                      shadowColor: Colors.black26,
                      // shadowColor: const Color.fromARGB(40, 0, 0, 0),
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Center(
                          child: Text(
                            "Data tanaman belum tersedia",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
