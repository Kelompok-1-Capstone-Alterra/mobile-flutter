import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/aunt/screen/forgot_password_screen.dart';
import 'package:mobile_flutter/view/aunt/screen/register_screen.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late bool _isObscure = true;

  void setLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  void _login(BuildContext context) {
    setLoginStatus();
    if (_formKey.currentState!.validate()) {
      // Proses login jika validasi sukses
      _toHome();
    }
  }

  void _toHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  void _toRegister(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  void _toForgotPassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    controller: _emailController,
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
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    maxLength: 20,
                    label: 'Kata Sandi',
                    hint: 'Masukan kata sandimu',
                    validator: (value) =>
                        validatorProvider.validatePassword(value),
                    obscureText: _isObscure,
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure
                          ? FluentIcons.eye_off_16_regular
                          : FluentIcons.eye_16_regular),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _toForgotPassword(context),
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
                  CustomMaterialButton(
                    onPressed: () => _login(context),
                    minWidth:
                        BouncingScrollSimulation.maxSpringTransferVelocity,
                    text: 'Login',
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
                        onTap: () => _toRegister(context),
                        child: Text(
                          'Buat Akun',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
