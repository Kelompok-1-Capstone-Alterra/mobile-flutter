import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_mati_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_panen_screen.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_progress_screen.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/no_progress_card.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/cards/progress_card/progress_card.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/overview_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OverviewProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            provider.sudahMenanam
                ? Column(
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
                  )
                : const NoProgressCard(),
            const SizedBox(
              height: 13,
            ),
          ],
        );
      },
    );
  }
}
