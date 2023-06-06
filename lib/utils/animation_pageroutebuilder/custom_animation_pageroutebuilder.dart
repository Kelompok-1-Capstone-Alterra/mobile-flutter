import 'package:flutter/material.dart';

class CustomAnimatedPageRoute extends PageRouteBuilder {
  final Widget page;
  final Offset begins;

  CustomAnimatedPageRoute({required this.page, required this.begins})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = begins;
            const end = Offset(0, 0);
            const curve = Curves.ease;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final animatedOffset = animation.drive(tween);

            return SlideTransition(
              position: animatedOffset,
              child: child,
            );
          },
        );
}
