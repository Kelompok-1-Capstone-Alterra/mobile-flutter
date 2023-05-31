import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/screens/about_screen.dart';
import 'package:mobile_flutter/view/settings/screens/masukan_saran_screen.dart';
import 'package:mobile_flutter/view/settings/screens/profile_screen.dart';
import 'package:mobile_flutter/view/settings/screens/pusat_bantuan_screen.dart';
import 'package:mobile_flutter/view/settings/screens/statistik_penanaman_screen.dart';
import 'package:mobile_flutter/view/settings/widgets/logout_alert_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.5),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              FluentIcons.ios_arrow_ltr_24_filled,
            ),
          ),
        ),
        title: Text(
          'Pengaturan',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      onTap: () => pushNewScreen(
                        context,
                        screen: const ProfileScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      title: Text(
                        'Profil',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                      trailing:
                          const Icon(FluentIcons.ios_chevron_right_20_regular),
                    ),
                    ListTile(
                      onTap: () => pushNewScreen(
                        context,
                        screen: const StatistikPenanamanScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      title: Text(
                        'Statistik Penanaman',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                      trailing:
                          const Icon(FluentIcons.ios_chevron_right_20_regular),
                    ),
                    ListTile(
                      onTap: () => pushNewScreen(
                        context,
                        screen: const AboutScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      title: Text(
                        'Tentang Agriplan',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                      trailing:
                          const Icon(FluentIcons.ios_chevron_right_20_regular),
                    ),
                    ListTile(
                      onTap: () => pushNewScreen(
                        context,
                        screen: const PusatBantuanScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      title: Text(
                        'Pusat Bantuan',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                      trailing:
                          const Icon(FluentIcons.ios_chevron_right_20_regular),
                    ),
                    ListTile(
                      onTap: () => pushNewScreen(
                        context,
                        screen: const MasukanSaranScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      title: Text(
                        'Masukan & Saran',
                        style: ThemeData().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                      trailing:
                          const Icon(FluentIcons.ios_chevron_right_20_regular),
                    ),
                  ],
                ),

                // ? button logout
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.15),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(error),
                    ),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const LogoutAlertWidget(),
                    ),
                    child: Text(
                      'Logout',
                      style: ThemeData().textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: neutral[10],
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
