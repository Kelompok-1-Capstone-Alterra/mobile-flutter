import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_icon_widget.dart';
import 'package:mobile_flutter/view/aunt/screen/forgot_password_screen.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/services_restapi_impl.dart';
import '../../../utils/animation_pageroutebuilder/custom_animation_pageroutebuilder.dart';
import '../../../utils/widget/snack_bar/snack_bar_widget.dart';
import '../../../view_model/aunt_viewmodel/forgot_password_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _submit() async {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    final String changePassword = provider.changePasswordController.text.trim();
    final String confirmPassword =
        provider.confirmPasswordController.text.trim();
    if (changePassword.isEmpty && confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(text: 'Field tidak boleh kosong.'),
      );
    }
    if (formKey.currentState!.validate()) {
      provider.setIsError(false);
      try {
        await ServicesRestApiImpl()
            .resetPasswordEndpoint(provider.userId, confirmPassword);
        if (context.mounted) {
          await customShowDialogIcon(
            context: context,
            iconDialog: FluentIcons.checkmark_circle_16_regular,
            title: 'Kata sandi diubah',
            desc: 'Selamat! kata sandimu akunmu telah berhasil diubah',
          );
          _toLogin();
          provider.controllerClear();
        }
      } catch (e) {
        provider.setIsError(true);
        // print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(text: 'Terjadi kesalahan.'),
        );
      }
    }
  }

  void _toLogin() {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    Navigator.pushReplacement(
      context,
      CustomAnimatedPageRoute(
        page: const HomeScreen(),
        begins: const Offset(-1, 0),
      ),
    );
    provider.controllerClear();
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          CustomAnimatedPageRoute(
            page: const ForgotPasswordScreen(),
            begins: const Offset(-1, 0),
          ),
        );
        provider.controllerClear();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Consumer<ForgotPasswordProvider>(
                builder: (context, ubahKataSandi, _) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Ubah Kata Sandi',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Silahkan masukan kata sandi baru untuk melanjutkan',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    isError: ubahKataSandi.isError,
                    controller: ubahKataSandi.changePasswordController,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    maxLength: 20,
                    label: 'Kata Sandi Baru',
                    hint: 'Masukan kata sandi baru',
                    validator: (value) =>
                        validatorProvider.validatePassword(value),
                    obscureText: ubahKataSandi.passwordObscureText,
                    suffixIcon: IconButton(
                      icon: Icon(ubahKataSandi.passwordObscureText
                          ? FluentIcons.eye_off_16_regular
                          : FluentIcons.eye_16_regular),
                      onPressed: () => ubahKataSandi.sandiObscureTextStatus(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    isError: ubahKataSandi.isError,
                    controller: ubahKataSandi.confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    maxLength: 20,
                    label: 'Konfirmasi Kata Sandi Baru',
                    hint: 'Masukan konfirmasi kata sandi baru',
                    validator: (value) =>
                        validatorProvider.validateComfrimPassword(
                      value,
                      provider.confirmPasswordController.text,
                      provider.changePasswordController.text,
                    ),
                    obscureText: ubahKataSandi.confirmObscureText,
                    suffixIcon: IconButton(
                      icon: Icon(ubahKataSandi.confirmObscureText
                          ? FluentIcons.eye_off_16_regular
                          : FluentIcons.eye_16_regular),
                      onPressed: () =>
                          ubahKataSandi.konfirmasiObscureTextStatus(),
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  CustomMaterialButton(
                    onPressed: () => _submit(),
                    minWidth:
                        BouncingScrollSimulation.maxSpringTransferVelocity,
                    text: 'Ubah Kata Sandi',
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
