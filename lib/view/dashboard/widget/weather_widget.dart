import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/models/weather_response_model.dart';
import 'package:mobile_flutter/utils/converter/convert_temperature.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view_model/service_provider/get_notification_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_weather_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/themes/custom_color.dart';
import '../../settings/screens/settings_screen.dart';
import '../screen/artikel_cuaca_screen.dart';
import '../screen/notification_screen.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.screenWidth,
    required double horizontal,
    required this.weatherData,
    required this.userName,
  }) : _horizontal = horizontal;

  final WeatherResponseModel weatherData;
  final double screenWidth;
  final double _horizontal;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: 210,
          child: SvgPicture.asset(
              context
                  .read<GetWeatherProvider>()
                  .weatherSvg[weatherData.labelId! - 1],
              fit: BoxFit.cover),
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
                    screen: ArtikelCuacaScreen(labelId: weatherData.labelId!),
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
                          child: AutoSizeText("Hi, $userName",
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
                                  "${weatherData.city!}, ${weatherData.country!} ",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // --------- icon lonceng dan setting---------
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                pushNewScreen(context,
                                    screen: const NotificationScreen(),
                                    withNavBar: false);
                              },
                              icon: const Icon(
                                FluentIcons.alert_16_regular,
                                size: 30,
                              ),
                            ),
                            Consumer<GetNotificationProvider>(
                                builder: (context, prov, _) {
                              if (prov.unreadNotifId.isNotEmpty &&
                                  prov.state == MyState.loaded) {
                                return Positioned(
                                    child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 14, bottom: 15),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: warning[300],
                                  ),
                                  alignment: Alignment.center,
                                ));
                              }
                              return const SizedBox.shrink();
                            })
                          ],
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
                      tempOneDecimal(weatherData.temperature!),
                      // " ${weatherData.temperature}°C ",
                      // "${weatherData.temperature!.round()}°C",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          context
                              .read<GetWeatherProvider>()
                              .weatherIcon[weatherData.labelId! - 1],
                          size: 25,
                          color: neutral[10],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        AutoSizeText(
                          weatherData.label!,
                          minFontSize: 15,
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

class WeatherWidgetLoading extends StatelessWidget {
  const WeatherWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: neutral[30]!,
      highlightColor: neutral[20]!,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        color: neutral[20]!,
      ),
    );
  }
}

class WeatherWidgetFailed extends StatelessWidget {
  const WeatherWidgetFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 210,
      color: neutral[20]!,
      alignment: AlignmentDirectional.center,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          Icon(
            Icons.sentiment_dissatisfied_outlined,
            size: 30,
            color: neutral[40]!,
          ),
          Text(
            "Something went wrong",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: neutral[50]!,
                ),
          ),
          TextButton(
              onPressed: () {
                context
                    .read<GetWeatherProvider>()
                    .getWeatherData(context: context);
              },
              child: Text(
                "Try Again?",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: neutral[70]!,
                    ),
              ))
        ],
      ),
    );
  }
}
