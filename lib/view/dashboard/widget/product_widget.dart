import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/dashboard/widget/product_card_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 2),
      height: 210,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: _horizontal, vertical: 10),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => Stack(
                children: [
                  const ProductCardWidgetloading(),
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
                width: 10,
              ),
          itemCount: 5),
    );
  }
}
