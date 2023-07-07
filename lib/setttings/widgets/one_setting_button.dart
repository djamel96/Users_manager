import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneSettingButton extends StatelessWidget {
  final String icon;
  final String title;
  final Function? onTap;

  const OneSettingButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppInKWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            const SizedBox(width: 13),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.black25,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
