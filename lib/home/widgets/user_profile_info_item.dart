import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';

class UserProfileInfoItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isMale;
  final CrossAxisAlignment? crossAxisAlignment;
  const UserProfileInfoItem({
    super.key,
    required this.text,
    this.icon,
    required this.isMale,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isMale ? AppColors.appMain100 : AppColors.pink,
            size: 30,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
