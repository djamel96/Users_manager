import 'package:flutter/material.dart';

class ShimmerLineItem extends StatelessWidget {
  final double height;
  final double width;
  const ShimmerLineItem({super.key, this.height = 12, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)));
  }
}
