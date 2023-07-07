import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcon extends StatelessWidget {
  final String icon;
  final Function? onTap;

  const SocialMediaIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppInKWell(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: const [
            BoxShadow(
              color: AppColors.shadowColor2,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
