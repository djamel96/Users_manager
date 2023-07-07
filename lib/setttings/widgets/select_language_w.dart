import 'package:charlie/translations/change_language.dart';
import 'package:charlie/widgets/buttons/custom_inkwell.dart';
import 'package:flutter/material.dart';

class SelectLanguageW extends StatelessWidget {
  final String title;
  final String countryCode;
  final String languageCode;
  final bool isSelected;
  const SelectLanguageW({
    super.key,
    required this.title,
    required this.isSelected,
    required this.countryCode,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    return AppInKWell(
      onTap: () => changeLanguage(languageCode),
      child: Row(
        children: [
          isSelected
              ? const Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              : const Icon(Icons.check_box_outline_blank),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
