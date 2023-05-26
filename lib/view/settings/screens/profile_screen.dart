import 'dart:io';

import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/widgets/item_info_pribadi_widget.dart';
import 'package:mobile_flutter/view_model/profile_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: Text(
          'Profile',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, _) => Center(
                child: provider.selectedImage == null
                    ? SizedBox(
                        width: 121,
                        height: 120,
                        child: Image.asset(
                          'assets/images/ubah_profile.png',
                          width: 121,
                          height: 120,
                        ),
                      )
                    : SizedBox(
                        width: 121,
                        height: 120,
                        child: Image.file(
                          File(provider.selectedImage!.path),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 8),

            // ? button ubah foto profile
            Center(
              child: TextButton(
                onPressed: () => provider.selectImage(),
                child: Text(
                  'Ubah Foto Profile',
                  style: ThemeData().textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: success,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Informasi Pribadi',
              style: ThemeData().textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
            ),
            const SizedBox(height: 10),

            // ? Item nama lengkap
            const ItemInfoPribadiWidget(
              title: 'Nama Lengkap',
              desc: 'Juna Darendra',
              navigateScreen: NavigateType.ubahNama,
            ),

            const SizedBox(height: 15),

            // ? Item Email
            const ItemInfoPribadiWidget(
              title: 'Email',
              desc: 'Juna.darendra@example.com',
              isTapable: false,
              navigateScreen: NavigateType.none,
            ),
            const SizedBox(height: 15),

            // ? Item kata sandi
            const ItemInfoPribadiWidget(
              title: 'Kata Sandi',
              desc: '*********',
              navigateScreen: NavigateType.ubahKataSandi,
            ),
          ],
        ),
      ),
    );
  }
}
