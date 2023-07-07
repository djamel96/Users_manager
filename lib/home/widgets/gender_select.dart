import 'package:charlie/them/colors.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderSelect extends StatelessWidget {
  final bool selected;
  final Function? onTap;
  final bool isMale;

  const GenderSelect(
      {super.key, required this.selected, this.onTap, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppInKWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: selected
                ? (isMale ? AppColors.appMain100 : AppColors.pink)
                : AppColors.grey205,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isMale ? Icons.male : Icons.female,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              Text(
                isMale ? tran.male.tr : tran.female.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
