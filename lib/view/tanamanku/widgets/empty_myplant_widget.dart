import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/themes/custom_color.dart';

class EmptyMyPlantWidget extends StatelessWidget {
  const EmptyMyPlantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/empty_tanaman.svg',
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sepertinya kamu belum memiliki',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: neutral[50],
                  ),
            ),
            Text(
              'tanaman',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: neutral[50],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
