import 'package:cached_network_image/cached_network_image.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/utils/constants.dart';
import 'package:charlie/widgets/elements/asset_circular_image.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class CircularImage extends StatelessWidget {
  final String? url;
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
    this.url,
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
    return (url != null && Uri.parse(url!).isAbsolute)
        ? SizedBox(
            width: width,
            height: height,
            child: CachedNetworkImage(
              imageUrl: url!,
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
                      border:
                          Border.all(color: borderColor, width: borderWidth),
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
