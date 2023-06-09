import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/view/dashboard/screen/pilih_tambahkan_tanaman_screen.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/service_provider/get_all_products_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_article_trending_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_my_plants_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_weather_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

import '../widget/artikel_trending_widget.dart';
import '../widget/product_widget.dart';
import '../widget/tanamanku_dashboard_widget.dart';
import '../widget/weather_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final double _horizontal = 20;

  Future<void> _refreshPage() async {
    context.read<GetWeatherProvider>().getWeatherData();
    context.read<GetMyPlantsProvider>().getMyPlantsData();
    context.read<GetTrendingArticleProvider>().getTrendingArticleData();
    context.read<GetAllProductsProvider>().getAllProductsData();
  }

  @override
  void initState() {
    context.read<GetWeatherProvider>().getWeatherData();
    context.read<GetMyPlantsProvider>().getMyPlantsData();
    context.read<GetTrendingArticleProvider>().getTrendingArticleData();
    context.read<GetAllProductsProvider>().getAllProductsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: FloatingActionButton(
            heroTag: "fabDashboard",
            elevation: 10,
            backgroundColor: primary[300],
            onPressed: () {
              pushNewScreen(context,
                  screen: const PilihTambahTanamanScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino);

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PilihTambahTanamanScreen(),
              //   ),
              // );
            },
            child: Icon(
              Icons.add,
              size: 30,
              // weight: 3,
              color: neutral[10],
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshPage,
          child: ListView(
            // physics: BouncingScrollPhysics(),
            children: [
              // -----------header weather --------
              // WeatherWidget(screenWidth: screenWidth, horizontal: _horizontal),
              Consumer<GetWeatherProvider>(
                builder: (context, providerWeather, _) {
                  if (providerWeather.state == MyState.initial) {
                    return const SizedBox.shrink();
                  } else if (providerWeather.state == MyState.loading) {
                    return const WeatherWidgetLoading();
                  } else if (providerWeather.state == MyState.loaded) {
                    return WeatherWidget(
                      screenWidth: screenWidth,
                      horizontal: _horizontal,
                      weatherData: providerWeather.currentWeather!,
                      userName: "Junan LMAO",
                    );
                  } else {
                    return const WeatherWidgetFailed();
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),

              Consumer<GetMyPlantsProvider>(builder: (_, provider, __) {
                // if (provider.state == MyState.loading) {
                //   return Padding(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: _horizontal, vertical: 10),
                //     child: UnconstrainedBox(
                //       alignment: AlignmentDirectional.centerStart,
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Shimmer.fromColors(
                //           baseColor: neutral[30]!,
                //           highlightColor: neutral[20]!,
                //           child: Container(
                //             color: neutral[20]!,
                //             height: 10,
                //             width: screenWidth * 0.2,
                //           ),
                //         ),
                //       ),
                //     ),
                //   );
                // }

                if (provider.state == MyState.loaded) {
                  if (provider.myPlants.isNotEmpty) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: _horizontal),
                      child: Row(
                        children: [
                          Text(
                            "Tanamanku",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  return const SizedBox.shrink();
                }
              }),

              TanamankuDasboardWidget(
                  horizontal: _horizontal, screenWidth: screenWidth),

              // Consumer<DashboardProvider>(builder: (context, provider, child) {
              //   if (provider.isTanamankuEmpty) {
              //     // ----------------- card punya tanaman --------------------------
              //     return TanamankuDasboardWidget(
              //         horizontal: _horizontal, screenWidth: screenWidth);
              //   } else {
              //     // ----------------- card kamu belum punya tanaman --------------------------
              //     return NoPlantCardWidget(horizontal: _horizontal);
              //   }
              // }),

              // ------------- artikel trending ------------------
              TitleSections(horizontal: _horizontal, title: "Artikel Trending"),

              // ------------- artikel trending ------------------
              ArtikelWidget(horizontal: _horizontal),

              const SizedBox(
                height: 15,
              ),
              // ------------- artikel trending ------------------
              TitleSections(horizontal: _horizontal, title: "Produk"),

              ProductWidget(horizontal: _horizontal),

              SizedBox(
                height: screenHeight * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSections extends StatelessWidget {
  const TitleSections({
    super.key,
    required double horizontal,
    required this.title,
  }) : _horizontal = horizontal;
  final String title;
  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(primary.withOpacity(0.1)),
            ),
            onPressed: () {},
            child: Text(
              "Lihat Semua",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: primary[300]),
            ),
          ),
        ],
      ),
    );
  }
}
