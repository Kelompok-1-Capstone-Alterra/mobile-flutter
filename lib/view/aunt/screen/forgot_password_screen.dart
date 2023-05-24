import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/aunt/screen/change_password_screen.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/forgot_password_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  void _submit(BuildContext context) {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    if (provider.formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: provider.formKey,
                child: Consumer<ForgotPasswordProvider>(
                    builder: (context, forgotPassword, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      CustomTextFormField(
                        controller: provider.emailController,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) =>
                            provider.emailController.text = value!,
                        label: 'Email',
                        hint: 'Masukan emailmu',
                        validator: (value) =>
                            validatorProvider.validateEmail(value),
                      ),
                      const SizedBox(
                        height: 48.0,
                      ),
                      CustomMaterialButton(
                        onPressed: () => _submit(context),
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
        ),
      ),
    );
  }
}
