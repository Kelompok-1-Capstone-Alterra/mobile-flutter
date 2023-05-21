import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:flutter/material.dart';

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
        TextButton(
          onPressed: () {},
          child: Text(
            'Ya',
            style: ThemeData().textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: primary,
                ),
          ),
        ),
      ],
    );
  }
}
