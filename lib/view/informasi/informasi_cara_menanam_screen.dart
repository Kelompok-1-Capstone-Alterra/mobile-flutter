import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view_model/service_provider/get_planting_article_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:mobile_flutter/view/informasi/youtube_player_screen.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/themes/custom_color.dart';

class InformasiCaraMenanamScreen extends StatefulWidget {
  const InformasiCaraMenanamScreen(
      {super.key, required this.plantId, required this.location});

  final int plantId;
  final String location;
  @override
  State<InformasiCaraMenanamScreen> createState() =>
      _InformasiCaraMenanamScreenState();
}

class _InformasiCaraMenanamScreenState
    extends State<InformasiCaraMenanamScreen> {
  bool _isPlayerReady = false;

  @override
  void initState() {
    // print("${widget.plantId} ${widget.location}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetPlantingArticleProvider>().getPlantingArticleData(
          plantId: widget.plantId, location: widget.location);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetPlantingArticleProvider>(
        builder: (context, provider, _) {
      if (provider.state == MyState.loading) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FloatingActionButton.small(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: neutral[30]!,
                  highlightColor: neutral[20]!,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.width,
                    color: neutral[20]!,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                UnconstrainedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        decoration: BoxDecoration(
                            color: neutral[20]!,
                            borderRadius: BorderRadius.circular(10)),
                        height: 15,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UnconstrainedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        decoration: BoxDecoration(
                            color: neutral[20]!,
                            borderRadius: BorderRadius.circular(10)),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                UnconstrainedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        decoration: BoxDecoration(
                            color: neutral[20]!,
                            borderRadius: BorderRadius.circular(10)),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UnconstrainedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        decoration: BoxDecoration(
                            color: neutral[20]!,
                            borderRadius: BorderRadius.circular(10)),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UnconstrainedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        decoration: BoxDecoration(
                            color: neutral[20]!,
                            borderRadius: BorderRadius.circular(10)),
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (provider.state == MyState.loaded) {
        return YoutubePlayerBuilder(
          // onExitFullScreen: () {
          //   // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          //   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          // },

          onEnterFullScreen: () {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
          },
          onExitFullScreen: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [
                SystemUiOverlay.bottom,
                SystemUiOverlay.top,
              ],
            );

            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
          },
          player: YoutubePlayer(
            controller: provider.ytPlayerController!
              ..addListener(() {
                if (_isPlayerReady &&
                    mounted &&
                    !provider.ytPlayerController!.value.isFullScreen) {
                  setState(() {});
                }
              }),
            onReady: () {
              _isPlayerReady = true;
            },
          ),
          builder: (context, player) {
            return Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startTop,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: FloatingActionButton.small(
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
                body: ListView(
                  shrinkWrap: true,
                  children: [
                    player,
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Cara menanam',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.location == "ground"
                                ? 'tanpa pot'
                                : 'dengan pot',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: neutral[40]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: Text(
                            "Alat dan Bahan",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Html(
                              data: provider
                                      .plantingArticle!.description!.material ??
                                  "-",
                              style: {
                                'br': Style(
                                  fontSize: FontSize(0),
                                  margin: Margins.symmetric(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                ),
                                'p': Style(textAlign: TextAlign.justify),
                                'ol': Style(
                                    margin: Margins.symmetric(
                                        horizontal: 0, vertical: 0),
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 0, right: 0, bottom: 0)
                                    // padding: EdgeInsets.all(0),
                                    ),
                                'ul': Style(
                                    margin: Margins.symmetric(horizontal: 0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18)
                                    // padding: EdgeInsets.all(0),
                                    ),
                                'li': Style(textAlign: TextAlign.justify
                                    // padding: EdgeInsets.all(0),
                                    ),
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: Text(
                            "Cara Menanam",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Html(
                            data: provider.plantingArticle!.description!
                                    .instruction ??
                                "-",
                            style: {
                              'br': Style(
                                fontSize: FontSize(0),
                                margin: Margins.symmetric(
                                  horizontal: 0,
                                  vertical: 0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                              ),
                              'p': Style(textAlign: TextAlign.justify),
                              'ol': Style(
                                  margin: Margins.symmetric(
                                      horizontal: 0, vertical: 0),
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 0, right: 0, bottom: 0)
                                  // padding: EdgeInsets.all(0),
                                  ),
                              'ul': Style(
                                  margin: Margins.symmetric(horizontal: 0),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 18)
                                  // padding: EdgeInsets.all(0),
                                  ),
                              'li': Style(textAlign: TextAlign.justify
                                  // padding: EdgeInsets.all(0),
                                  ),
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                )

                //
                );
          },
        );
      } else {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FloatingActionButton.small(
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
          body: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 40,
                  color: neutral[40]!,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Something went wrong",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: neutral[50]!,
                      ),
                ),
                TextButton(
                    onPressed: () {
                      provider.getPlantingArticleData(
                          plantId: widget.plantId, location: widget.location);
                    },
                    child: Text(
                      "Try Again?",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: neutral[70]!,
                          ),
                    ))
              ],
            ),
          ),
        );
      }
    });
  }
}
