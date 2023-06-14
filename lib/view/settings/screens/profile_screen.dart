import 'package:mobile_flutter/utils/app_constant.dart';
import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/settings/widgets/item_info_pribadi_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/get_profile_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/profile_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProfileProvider>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    final getProfileProvider =
        Provider.of<GetProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: Text(
          'Profil',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Center(
                child: Consumer<GetProfileProvider>(
                  builder: (context, getProfileProvider, _) {
                    final state = getProfileProvider.state;
                    final profile = getProfileProvider.profile;
                    if (state == MyState.initial) {
                      return Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          height: 121,
                          width: 120,
                          color: neutral[20]!,
                        ),
                      );
                    } else if (state == MyState.loading) {
                      return Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          height: 121,
                          width: 120,
                          color: neutral[20]!,
                        ),
                      );
                    } else if (state == MyState.loaded) {
                      if (profile.picture == '') {
                        return SizedBox(
                          width: 121,
                          height: 120,
                          child: Image.asset(
                            'assets/images/ubah_profile.png',
                            width: 121,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: 121,
                          height: 120,
                          child: Image.network(
                              '${AppConstant.imgUrl}${profile.picture!}'),
                        );
                      }
                    } else {
                      return Shimmer.fromColors(
                        baseColor: neutral[30]!,
                        highlightColor: neutral[20]!,
                        child: Container(
                          height: 121,
                          width: 120,
                          color: neutral[20]!,
                        ),
                      );
                      // return SizedBox(
                      //   width: 121,
                      //   height: 120,
                      //   child: Image.asset(
                      //     'assets/images/ubah_profile.png',
                      //     width: 121,
                      //     height: 120,
                      //     fit: BoxFit.cover,
                      //   ),
                      // );
                    }
                  },
                ),
              ),

              const SizedBox(height: 8),

              // ? button ubah foto profile
              Center(
                child: TextButton(
                  onPressed: () async {
                    await provider.selectImage();
                    await provider.upImage();
                    await getProfileProvider.getUserProfile();
                  },
                  child: Text(
                    'Ubah Foto Profil',
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
              Consumer<GetProfileProvider>(
                builder: (context, getProfileProvider, _) {
                  final state = getProfileProvider.state;
                  final profile = getProfileProvider.profile;
                  if (state == MyState.initial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == MyState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == MyState.loaded) {
                    return Column(
                      children: [
                        // ? Item nama lengkap
                        ItemInfoPribadiWidget(
                          title: 'Nama Lengkap',
                          desc: profile.name ?? 'Juna Darendra',
                          navigateScreen: NavigateType.ubahNama,
                          defaultValue: profile.name!,
                        ),

                        const SizedBox(height: 15),

                        // ? Item Email
                        ItemInfoPribadiWidget(
                          title: 'Email',
                          desc: profile.email ?? 'Juna.darendra@example.com',
                          isTapable: false,
                          navigateScreen: NavigateType.none,
                          defaultValue: profile.email!,
                        ),
                        const SizedBox(height: 15),

                        // ? Item kata sandi
                        const ItemInfoPribadiWidget(
                          title: 'Kata Sandi',
                          desc: '*********',
                          navigateScreen: NavigateType.ubahKataSandi,
                          defaultValue: '',
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
