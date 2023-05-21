import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/settings/screens/settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          ),
          child: const Text('Dashboard Screen'),
        ),
      ),
    );
  }
}
