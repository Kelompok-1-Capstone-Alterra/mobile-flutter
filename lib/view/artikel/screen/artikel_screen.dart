import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtikelScreen extends StatelessWidget {
  const ArtikelScreen({super.key});
  void setLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }

  logout(BuildContext context) async {
    setLoginStatus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Text('Artikel Screen'),
      ),
    );
  }
}
