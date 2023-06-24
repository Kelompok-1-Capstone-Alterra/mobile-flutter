import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

Future<dynamic> customShowDialogText({
  required BuildContext context,
  required String title,
  required String desc,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: Text(
          desc,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: neutral[10],
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(primary.withOpacity(0.1)),
            ),
            child: Text(
              'Tutup',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: primary),
            ),
          ),
        ],
      );
    },
  );
}
