import 'dart:math';

import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    Key? key,
    required this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color = AppColors.appMain100,
  }) : super(key: key, listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int? itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int>? onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 12.0;

  // The distance between the center of each dot

  Widget _buildDot(int index) {
    double selectness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: _kDotSize,
      child: Material(
        color: selectness > 0 ? color : Colors.white,
        type: MaterialType.circle,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color:
                    selectness > 0 ? AppColors.appMain100 : AppColors.black25),
          ),
          width: _kDotSize,
          height: _kDotSize,
          child: InkWell(
            onTap: () => onPageSelected!(index),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount!, _buildDot),
    );
  }
}
