import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/aunt/screen/login_screen.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/register_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _register(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    if (provider.formKey.currentState!.validate()) {
      // ..
    }
  }

  void _toLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (router) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: provider.formKey,
              child:
                  Consumer<RegisterProvider>(builder: (context, register, _) {
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
                      onChanged: (value) =>
                          register.namaController.text = value!,
                      maxLength: 30,
                      label: 'Nama',
                      hint: 'Masukan namamu',
                      validator: (value) =>
                          validatorProvider.validateName(value),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: register.emailController,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) =>
                          register.emailController.text = value!,
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
                      onChanged: (value) =>
                          register.passwordController.text = value!,
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
      ),
    );
  }
}
