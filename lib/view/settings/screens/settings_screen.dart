import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/screens/about_screen.dart';
import 'package:mobile_flutter/view/settings/screens/masukan_saran_screen.dart';
import 'package:mobile_flutter/view/settings/screens/profile_screen.dart';
import 'package:mobile_flutter/view/settings/screens/pusat_bantuan_screen.dart';
import 'package:mobile_flutter/view/settings/screens/statistik_penanaman_screen.dart';
import 'package:mobile_flutter/view/settings/widgets/logout_alert_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

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
          'Settings',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 18),
                ListTile(
                  //  navigate to ubah profile
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  ),
                  title: Text(
                    'Profile',
                    style: ThemeData().textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                  trailing:
                      const Icon(FluentIcons.ios_chevron_right_20_regular),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StatistikPenanamanScreen(),
                    ),
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  ),
                  title: Text(
                    'About',
                    style: ThemeData().textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                  trailing:
                      const Icon(FluentIcons.ios_chevron_right_20_regular),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PusatBantuanScreen(),
                    ),
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MasukanSaranScreen(),
                    ),
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
              padding: const EdgeInsets.only(bottom: 36),
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(error),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => const LogoutAlertWidget(),
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
    );
  }
}
