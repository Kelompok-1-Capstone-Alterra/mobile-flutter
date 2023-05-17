import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.pages[provider.selectedIndex],
          bottomNavigationBar: SizedBox(
            height: 90,
            child: AnimatedBottomNavigationBar.builder(
              splashColor: success,
              // splashRadius: 10,
              itemCount: provider.iconList.length,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? success[500] : neutral[50];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      provider.iconList[index],
                      size: 24,
                      color: color,
                    ),
                    const SizedBox(height: 11),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AutoSizeText(
                        provider.iconText[index],
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: color),
                        group: AutoSizeGroup(),
                      ),
                    )
                  ],
                );
              },
              activeIndex: provider.selectedIndex,
              // splashSpeedInMilliseconds: 300,
              gapLocation: GapLocation.none,
              onTap: (index) => provider.setSelectedIndex(context, index),
            ),
          ),
        );
      },
    );
  }
}
