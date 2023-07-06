import 'package:flutter/material.dart';

class AppInKWell extends StatelessWidget {
  final Function? onTap;
  final Widget? child;

  const AppInKWell({Key? key, this.onTap, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: child,
    );
  }
}
