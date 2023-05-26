import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/informasi/informasi_cara_menanam_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../utils/themes/custom_color.dart';

class LokasiTanamanScreen extends StatefulWidget {
  const LokasiTanamanScreen({super.key});

  @override
  State<LokasiTanamanScreen> createState() => _LokasiTanamanScreenState();
}

class _LokasiTanamanScreenState extends State<LokasiTanamanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Lokasi Penanaman",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                FluentIcons.chevron_left_16_regular,
                size: 30,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 110,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      shadowColor: Colors.black26,
                      // shadowColor: const Color.fromARGB(40, 0, 0, 0),
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                "assets/images/sample_tomat.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: SizedBox(
                                  height: double.maxFinite,
                                  // color: Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "Menanam",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        minFontSize: 14,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        "tanpa pot",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: neutral[50],
                                            ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                      ),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: ,
              // ),
              Stack(
                children: [
                  SizedBox(
                    height: 110,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      shadowColor: Colors.black26,
                      // shadowColor: const Color.fromARGB(40, 0, 0, 0),
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                "assets/images/sample_tomat.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: SizedBox(
                                  height: double.maxFinite,
                                  // color: Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "Menanam",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        minFontSize: 14,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        "dengan pot / polybag",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: neutral[50],
                                            ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: const InformasiCaraMenanamScreen(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const InformasiCaraMenanamScreen(),
                          //     ));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )

        // ListView.separated(
        //   physics: const NeverScrollableScrollPhysics(),
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 20,
        //   ),
        //   shrinkWrap: true,
        //   itemCount: 2,
        //   itemBuilder: (context, index) => Stack(
        //     children: [
        //       SizedBox(
        //         height: 110,
        //         child: Card(
        //           margin: const EdgeInsets.all(0),
        //           elevation: 15,
        //           shadowColor: Colors.black26,
        //           // shadowColor: const Color.fromARGB(40, 0, 0, 0),
        //           color: Colors.white,
        //           surfaceTintColor: Colors.transparent,
        //           child: Padding(
        //             padding:
        //                 const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        //             child: Row(
        //               children: [
        //                 Container(
        //                   width: 80,
        //                   height: 80,
        //                   clipBehavior: Clip.antiAliasWithSaveLayer,
        //                   decoration: BoxDecoration(
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.circular(10)),
        //                   child: Image.asset(
        //                     "assets/images/sample_tomat.png",
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //                 const SizedBox(width: 13),
        //                 Expanded(
        //                   child: SizedBox(
        //                       height: double.maxFinite,
        //                       // color: Colors.red,
        //                       child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           AutoSizeText(
        //                             "Menanam",
        //                             maxLines: 3,
        //                             overflow: TextOverflow.ellipsis,
        //                             minFontSize: 14,
        //                             style: Theme.of(context).textTheme.titleSmall,
        //                           ),
        //                           Text(
        //                             "tanpa pot",
        //                             style: Theme.of(context)
        //                                 .textTheme
        //                                 .labelSmall!
        //                                 .copyWith(
        //                                   color: neutral[50],
        //                                 ),
        //                           ),
        //                         ],
        //                       )),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //       Positioned.fill(
        //         child: Material(
        //           color: Colors.transparent,
        //           child: InkWell(
        //             borderRadius: BorderRadius.circular(10),
        //             onTap: () {},
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        //   separatorBuilder: (context, index) => const SizedBox(
        //     height: 10,
        //   ),
        // ),
        );
  }
}
