import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../utils/themes/custom_color.dart';
import '../../settings/screens/settings_screen.dart';
import '../screen/artikel_cuaca_screen.dart';
import '../screen/notification_screen.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.screenWidth,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double screenWidth;
  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: 210,
          child: SvgPicture.asset("assets/svg/Type=31.svg", fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Colors.red,
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.black12.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                pushNewScreen(context,
                    screen: const ArtikelCuacaScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.fade);
              },
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _horizontal, vertical: screenWidth * 0.045),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // --------- nama dan kota---------
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: AutoSizeText("Hi, Juna darendra",
                              maxLines: 2,
                              minFontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              FluentIcons.location_16_regular,
                              size: 23,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            SizedBox(
                              width: screenWidth * 0.5,
                              child: AutoSizeText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 13,
                                  "Jakarta, Indonesia",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // --------- icon lonceng dan setting---------
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            // context.read<DashboardProvider>().tanamankuEmpty();
                            pushNewScreen(context,
                                screen: const NotificationScreen(),
                                withNavBar: false);
                          },
                          icon: const Icon(
                            FluentIcons.alert_16_regular,
                            size: 30,
                          ),
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        IconButton(
                          onPressed: () {
                            pushNewScreen(context,
                                screen: const SettingsScreen(),
                                withNavBar: false);
                          },
                          icon: const Icon(
                            FluentIcons.settings_16_regular,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                // ------ suhu dan cuaca -----------
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    AutoSizeText(
                      "32°C",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          FluentIcons.weather_sunny_16_regular,
                          size: 25,
                          color: neutral[10],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        AutoSizeText(
                          "Cerah",
                          minFontSize: 16,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: neutral[10]),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
