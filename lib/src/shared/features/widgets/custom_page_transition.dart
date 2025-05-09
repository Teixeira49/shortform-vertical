import 'package:flutter/material.dart';

class CustomPageTransition extends StatelessWidget {
  const CustomPageTransition(
      {required this.animation, required this.child, super.key});

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
      child: child,
    );
  }
}
