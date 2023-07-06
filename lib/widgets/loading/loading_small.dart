import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  final EdgeInsets? margin;
  final bool center;

  const Loading(
      {Key? key,
      this.height = 40,
      this.width = 40,
      this.color = AppColors.appMain100,
      this.margin,
      this.center = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        margin: margin,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ));
  }
}
