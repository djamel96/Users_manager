import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';

class AssetCircularImage extends StatelessWidget {
  final String? asset;
  final double borderWidth;
  final Color borderColor;
  final Widget? child;
  final double? size;

  const AssetCircularImage(
      {Key? key,
      this.asset,
      this.child,
      this.borderWidth = 4,
      this.borderColor = AppColors.appMain100,
      this.size = 75})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: borderColor,
        image: asset != null
            ? DecorationImage(
                image: AssetImage(asset!),
                fit: BoxFit.cover,
              )
            : null,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: child ?? Container(),
    );
  }
}
