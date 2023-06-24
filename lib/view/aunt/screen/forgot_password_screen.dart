import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/aunt/screen/change_password_screen.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/forgot_password_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/services_restapi_impl.dart';
import '../../../utils/animation_pageroutebuilder/custom_animation_pageroutebuilder.dart';
import '../../../utils/widget/snack_bar/snack_bar_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _submit(BuildContext context) async {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    final String email = provider.emailController.text.trim();
    if (formKey.currentState!.validate()) {
      provider.setIsError(false);
      try {
        final int userId =
            await ServicesRestApiImpl().checkEmailValidEndpoint(email);
        provider.userId = userId;
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            CustomAnimatedPageRoute(
              page: const ChangePasswordScreen(),
              begins: const Offset(1, 0),
            ),
          );
          provider.controllerEmailClear();
        }
      } catch (e) {
        provider.setIsError(true);
        if (e.toString() == 'Exception: Email tidak terdaftar.') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: 'Email tidak terdaftar.'),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: 'Terjadi kesalahan.'),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          CustomAnimatedPageRoute(
            page: const HomeScreen(),
            begins: const Offset(-1, 0),
          ),
        );
        Provider.of<ForgotPasswordProvider>(context, listen: false)
            .controllerEmailClear();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Jangan Khawatir!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Silahkan masukan email yang terdaftar untuk mengubah kata sandi',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 40,
                ),
                Consumer<ForgotPasswordProvider>(
                  builder: (context, email, _) {
                    return CustomTextFormField(
                      isError: email.isError,
                      controller: email.emailController,
                      textInputAction: TextInputAction.done,
                      label: 'Email',
                      hint: 'Masukan emailmu',
                      validator: (value) =>
                          validatorProvider.validateEmail(value),
                    );
                  },
                ),
                const SizedBox(
                  height: 48.0,
                ),
                CustomMaterialButton(
                  onPressed: () => _submit(context),
                  minWidth: BouncingScrollSimulation.maxSpringTransferVelocity,
                  text: 'Ubah Kata Sandi',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
