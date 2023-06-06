import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:mobile_flutter/view/aunt/screen/forgot_password_screen.dart';
import 'package:mobile_flutter/view/aunt/screen/register_screen.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/login_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/shared_preferences_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/animation_pageroutebuilder/custom_animation_pageroutebuilder.dart';
import '../../../utils/widget/snack_bar/snack_bar_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = false;
  void _login(BuildContext context) async {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    final String email = provider.emailController.text.trim();
    final String password = provider.passwordController.text.trim();

    if (provider.formKey.currentState!.validate()) {
      provider.setIsError(false);
      // Proses login jika validasi sukses
      try {
        provider.setIsVisible(true);
        await Future.delayed(const Duration(seconds: 1));
        if (context.mounted) {
          await Provider.of<SharedPreferencesProvider>(context, listen: false)
              .login(email: email, password: password);
          provider.controllerClear();
          provider.setIsError(false);
        }
      } catch (e) {
        provider.setIsVisible(false);
        provider.setIsError(true);
        if (e.toString() == 'Exception: Email atau kata sandi salah.') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: 'Email atau kata sandi salah.'),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: 'Terjadi kesalahan saat login.'),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<LoginProvider>(builder: (context, login, _) {
          return Form(
            key: login.formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Selamat datang kembali!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Silahkan masukan data informasi kamu yang sudah terdaftar',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  isError: login.isError,
                  controller: login.emailController,
                  textInputAction: TextInputAction.next,
                  label: 'Email',
                  hint: 'Masukan emailmu',
                  validator: (value) => validatorProvider.validateEmail(value),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  isError: login.isError,
                  controller: login.passwordController,
                  textInputAction: TextInputAction.done,
                  maxLength: 20,
                  maxLines: 1,
                  label: 'Kata Sandi',
                  hint: 'Masukan kata sandimu',
                  validator: (value) =>
                      validatorProvider.validatePassword(value),
                  obscureText: login.passwordObscureText,
                  suffixIcon: IconButton(
                    icon: Icon(login.passwordObscureText
                        ? FluentIcons.eye_off_16_regular
                        : FluentIcons.eye_16_regular),
                    onPressed: () => login.passwordObscureTextStatus(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          CustomAnimatedPageRoute(
                            page: const ForgotPasswordScreen(),
                            begins: const Offset(1, 0),
                          ),
                        );
                        login.controllerClear();
                      },
                      child: Text(
                        'Lupa kata sandi?',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48.0,
                ),
                login.visibled == false
                    ? CustomMaterialButton(
                        onPressed: () => _login(context),
                        minWidth:
                            BouncingScrollSimulation.maxSpringTransferVelocity,
                        text: 'Login',
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: primary,
                        ),
                      ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          CustomAnimatedPageRoute(
                            page: const RegisterScreen(),
                            begins: const Offset(1, 0),
                          ),
                        );
                        login.controllerClear();
                      },
                      child: Text(
                        'Buat Akun',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
