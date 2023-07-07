import 'package:charlie/helpers/device_info.dart';
import 'package:charlie/resources/animations.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EmptyStateFavorite extends StatelessWidget {
  const EmptyStateFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: getScreeHeight(context, .4),
            child: Lottie.asset(
              AppAnimations.empty,
              repeat: true,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            tran.youDontHaveFavorite.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.grey172,
            ),
          )
        ],
      ),
    );
  }
}
