import 'package:charlie/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;

import 'select_language_w.dart';

class ChangeLanguagePop extends StatelessWidget {
  const ChangeLanguagePop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            tran.chooseLanguage.tr,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          SelectLanguageW(
            title: "Français",
            languageCode: 'fr',
            countryCode: 'Fr',
            isSelected: Get.locale?.languageCode == 'fr',
          ),
          const SizedBox(height: 10),
          SelectLanguageW(
            title: "English",
            languageCode: 'en',
            countryCode: 'US',
            isSelected: Get.locale?.languageCode == 'en',
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                textToShow: tran.close.tr,
                width: 120,
                height: 42,
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onTap: () => Get.back(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
