import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class ReuseableButtonChat extends StatelessWidget {
  const ReuseableButtonChat({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.9,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: primary[300],
        ),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.zero,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: neutral[10],
                ),
          ),
        ),
      ),
    );
  }
}
