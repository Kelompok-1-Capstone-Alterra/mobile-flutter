import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_flutter/view_model/service_provider/get_weather_article_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/state/finite_state.dart';
import '../../../utils/themes/custom_color.dart';

class ArtikelCuacaScreen extends StatefulWidget {
  const ArtikelCuacaScreen({super.key, required this.labelId});

  final int labelId;

  @override
  State<ArtikelCuacaScreen> createState() => _ArtikelCuacaScreenState();
}

class _ArtikelCuacaScreenState extends State<ArtikelCuacaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<GetWeatherArticleProvider>()
          .getWeatherArticleData(labelId: widget.labelId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FloatingActionButton.small(
          heroTag: "fabArtikelCuaca",
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
      body:
          Consumer<GetWeatherArticleProvider>(builder: (context, provider, _) {
        if (provider.state == MyState.loading) {
          return SingleChildScrollView(
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
          );
        } else if (provider.state == MyState.loaded) {
          return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.network(
                  "${AppConstant.imgUrl}${provider.articleWeather!.picture}",
                  // "asdad",
                  // image,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Shimmer.fromColors(
                      baseColor: neutral[30]!,
                      highlightColor: neutral[20]!,
                      child: Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height * 0.30,
                        color: neutral[20]!,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.3,
                      color: neutral[20],
                      child: const Icon(Icons.image_not_supported_outlined)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 0),
                    child: Text(
                      provider.articleWeather!.title!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Html(
                      data: provider.articleWeather!.desc!,
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
                            margin:
                                Margins.symmetric(horizontal: 0, vertical: 0),
                            padding: const EdgeInsets.only(
                                left: 18, top: 0, right: 0, bottom: 0)
                            // padding: EdgeInsets.all(0),
                            ),
                        'ul': Style(
                            margin: Margins.symmetric(horizontal: 0),
                            padding: const EdgeInsets.symmetric(horizontal: 18)
                            // padding: EdgeInsets.all(0),
                            ),
                        'li': Style(textAlign: TextAlign.justify
                            // padding: EdgeInsets.all(0),
                            ),
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Center(
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
                      // provider.getTemperatureArticleData(
                      //     plantId: widget.plantId);
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
      }),
    );
  }
}
