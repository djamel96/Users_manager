import 'package:charlie/helpers/device_info.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {
  final bool selected;
  final Function? onTap;
  final String text;

  const SelectableButton({
    super.key,
    required this.selected,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppInKWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: getScreenWidth(context, .25),
          decoration: BoxDecoration(
            color: selected ? AppColors.appMain100 : AppColors.grey205,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 12),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
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
