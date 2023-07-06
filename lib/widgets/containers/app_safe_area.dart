import 'package:flutter/material.dart';

class AppSafeArea extends StatelessWidget {
  final Widget child;
  final bool top;
  final bool left;
  final bool right;
  final bool bottom;
  final Color color;

  const AppSafeArea(
      {Key? key,
      required this.child,
      this.top = false,
      this.left = false,
      this.right = false,
      this.bottom = true,
      this.color = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: SafeArea(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: child,
        ));
  }
}
