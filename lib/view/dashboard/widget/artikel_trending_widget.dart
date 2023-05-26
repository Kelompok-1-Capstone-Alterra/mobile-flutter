import 'package:flutter/material.dart';

import '../../../utils/widget/artikel_card/artikel_card_widget.dart';

class ArtikelWidget extends StatelessWidget {
  const ArtikelWidget({
    super.key,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: _horizontal,
      ),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => Stack(
        children: [
          const ArtikelCardWidget(),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
