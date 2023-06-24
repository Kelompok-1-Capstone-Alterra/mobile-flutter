// ignore_for_file: use_build_context_synchronously

import 'package:mobile_flutter/utils/state/finite_state.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_text_widget.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/get_profile_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/setting_validator_provider.dart';
import 'package:mobile_flutter/view_model/setting_viewmodel/ubah_nama_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UbahNamaScreen extends StatefulWidget {
  const UbahNamaScreen({
    super.key,
    required this.defaultValue,
  });
  final String defaultValue;

  @override
  State<UbahNamaScreen> createState() => _UbahNamaScreenState();
}

class _UbahNamaScreenState extends State<UbahNamaScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UbahNamaProvider>().ubahNamaC.text = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UbahNamaProvider>(context, listen: false);
    final validatorProvider =
        Provider.of<SettingValidatorProvider>(context, listen: false);
    final getProfileProvider =
        Provider.of<GetProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            provider.ubahNamaC.clear();
            Navigator.pop(context);
          },
          child: const Icon(
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: Text(
          'Ubah Nama',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 16,
          right: 16,
        ),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gunakan nama asli Anda untuk\nmemudahkan verifikasi ",
                  style: ThemeData().textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  controller: provider.ubahNamaC,
                  textInputAction: TextInputAction.done,
                  maxLength: 30,
                  label: 'Nama',
                  hint: 'Masukkan namamu',
                  suffixIcon: IconButton(
                    onPressed: () {
                      provider.ubahNamaC.clear();
                    },
                    icon: const Icon(
                      Icons.highlight_remove_outlined,
                      weight: 2,
                    ),
                  ),
                  validator: (value) => validatorProvider.validateName(value),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        await provider.changeName(provider.ubahNamaC.text);
                        await getProfileProvider.getUserProfile();
                        await customShowDialogText(
                          context: context,
                          title: 'Ubah Nama',
                          desc: 'Kamu berhasil mengubah namamu',
                        );

                        if (context.mounted) {
                          provider.ubahNamaC.clear();
                          Navigator.pop(context);
                        }
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primary),
                    ),
                    child: Consumer<UbahNamaProvider>(
                      builder: (context, ubahNamaProvider, _) {
                        final state = ubahNamaProvider.state;
                        if (state == MyState.initial) {
                          return Text(
                            'Ubah Nama',
                            style: ThemeData().textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: neutral[10]),
                          );
                        } else if (state == MyState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Text(
                            'Ubah Nama',
                            style: ThemeData().textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: neutral[10]),
                          );
                        }
                      },
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
