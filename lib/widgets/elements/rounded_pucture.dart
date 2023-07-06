import 'package:cached_network_image/cached_network_image.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/utils/constants.dart';
import 'package:charlie/widgets/elements/asset_circular_image.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class CircularImage extends StatelessWidget {
  final String? asset;
  final double width;
  final double borderWidth;
  final double borderRadius;
  final double height;
  final Color borderColor;
  final List<BoxShadow>? shadow;
  final EdgeInsets? margin;
  final String defaultAsset;

  const CircularImage({
    Key? key,
    this.asset,
    this.width = 75,
    this.height = 75,
    this.borderRadius = 100,
    this.borderWidth = 4,
    this.borderColor = AppColors.appMain100,
    this.shadow,
    this.margin,
    this.defaultAsset = defaultUserPicturePlaceHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (asset != null && Uri.parse(asset!).isAbsolute)
        ? SizedBox(
            width: width,
            height: height,
            child: CachedNetworkImage(
              imageUrl: asset!,
              imageBuilder: (context, imageProvider) => Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => AssetCircularImage(
                borderColor: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(borderColor),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => AssetCircularImage(
                asset: defaultAsset,
                borderColor: borderColor,
                borderWidth: borderWidth,
              ),
            ),
          )
        : AssetCircularImage(
            asset: defaultAsset,
            borderColor: borderColor,
            borderWidth: borderWidth,
          );
  }
}
