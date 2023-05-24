import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class StatistikPenanamanEmptyWidget extends StatelessWidget {
  const StatistikPenanamanEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/penanaman_empty.png',
              width: 176,
              height: 178,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Sepertinya kamu belum memiliki progres tanaman',
              style: ThemeData().textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: neutral[50],
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
