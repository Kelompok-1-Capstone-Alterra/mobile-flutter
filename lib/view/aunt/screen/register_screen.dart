import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_icon_widget.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/register_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _register(BuildContext context) async {
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    if (provider.formKey.currentState!.validate()) {
      await customShowDialogIcon(
        context: context,
        iconDialog: FluentIcons.checkmark_circle_16_regular,
        title: 'Akun berhasil dibuat',
        desc:
            'Selamat! Akunmu berhasil dibuat silahkan login untuk melanjutkan',
      );
      if (context.mounted) {
        _toLogin(context);
        provider.controllerClear();
      }
    }
  }

  void _toLogin(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset(0, 0);
          const curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final animatedOffset = animation.drive(tween);

          return SlideTransition(
            position: animatedOffset,
            child: child,
          );
        },
      ),
    );
    provider.controllerClear();
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: provider.formKey,
            child: Consumer<RegisterProvider>(builder: (context, register, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Selamat datang',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      'Daftar untuk menikmati fitur Agriplan untuk kesuksesan tanamanmu!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14)),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    controller: register.namaController,
                    textInputAction: TextInputAction.next,
                    maxLength: 30,
                    label: 'Nama',
                    hint: 'Masukan namamu',
                    validator: (value) => validatorProvider.validateName(value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: register.emailController,
                    textInputAction: TextInputAction.next,
                    label: 'Email',
                    hint: 'Masukan emailmu',
                    validator: (value) =>
                        validatorProvider.validateEmail(value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: register.passwordController,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    maxLength: 20,
                    label: 'Kata Sandi',
                    hint: 'Masukan kata sandimu',
                    validator: (value) =>
                        validatorProvider.validatePassword(value),
                    obscureText: register.passwordObscureText,
                    suffixIcon: IconButton(
                      icon: Icon(register.passwordObscureText
                          ? FluentIcons.eye_off_16_regular
                          : FluentIcons.eye_16_regular),
                      onPressed: () => register.sandiObscureTextStatus(),
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  CustomMaterialButton(
                    onPressed: () => _register(context),
                    minWidth:
                        BouncingScrollSimulation.maxSpringTransferVelocity,
                    text: 'Buat Akun',
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      InkWell(
                        onTap: () => _toLogin(context),
                        child: Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
