import 'package:charlie/resources/animations.dart';
import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;

class EmptyResultSearch extends StatelessWidget {
  const EmptyResultSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Lottie.asset(
              AppAnimations.emptySearch,
              repeat: true,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            tran.noResultsFound.tr,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.grey187),
          )
        ],
      ),
    );
  }
}
