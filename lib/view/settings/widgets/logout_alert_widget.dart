// ignore_for_file: use_build_context_synchronously

import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/shared_preferences_provider.dart';
import 'package:provider/provider.dart';

class LogoutAlertWidget extends StatelessWidget {
  const LogoutAlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Konfirmasi',
          style: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
        ),
      ),
      content: Text(
        'Apakah anda yakin ingin keluar dari\naplikasi ini?',
        style: ThemeData().textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Batal',
            style: ThemeData().textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: neutral[40],
                ),
          ),
        ),
        Consumer<SharedPreferencesProvider>(
          builder: (context, sharedPreferencesProvider, _) => TextButton(
            onPressed: () async {
              await sharedPreferencesProvider.logout();
              if (context.mounted) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: Text(
              'Ya',
              style: ThemeData().textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: primary,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
