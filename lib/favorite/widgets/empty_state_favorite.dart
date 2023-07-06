import 'package:charlie/them/colors.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyStateFavorite extends StatelessWidget {
  const EmptyStateFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite_outline,
            size: 50,
            color: AppColors.grey172,
          ),
          const SizedBox(height: 20),
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
