import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_mati_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_panen_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_progress_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/progress_card.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class DetailItemStatistikPenanaman extends StatelessWidget {
  const DetailItemStatistikPenanaman({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FloatingActionButton.small(
            heroTag: "backDetailScreen",
            elevation: 0,
            backgroundColor: Colors.black12,
            highlightElevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: const CircleBorder(),
            disabledElevation: 0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              FluentIcons.chevron_left_16_regular,
              size: 30,
              color: neutral[10],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/sample_tomat.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tomat',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Solanum lycopersicum',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: neutral[40]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Riwayat Tanamanmu',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Column(
                      children: [
                        ProgressCard(
                          title: 'Sudah Panen',
                          date: '24 Mei 2023',
                          type: TipeProgress.panen,
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: const DetailPanenScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        ProgressCard(
                          title: 'Tanaman Mati',
                          date: '24 May 2023',
                          type: TipeProgress.mati,
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: const DetailMatiScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        ProgressCard(
                          title: 'Minggu ke 2',
                          date: '11 - 20 May 2023',
                          type: TipeProgress.mingguan,
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: const DetailProgresScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        ProgressCard(
                          title: 'Minggu ke 1',
                          date: '01 - 07 May 2023',
                          type: TipeProgress.mingguan,
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: const DetailProgresScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
