import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double padding;
  final double marginVertical;

  const CustomDivider(
      {Key? key,
      this.height = 1,
      this.width = double.infinity,
      this.color = const Color(0x11000000),
      this.padding = 0,
      this.marginVertical = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: padding, vertical: marginVertical),
      height: height,
      color: color,
      width: width,
    );
  }
}

Widget space(double height, double width) {
  return SizedBox(width: width, height: height);
}
