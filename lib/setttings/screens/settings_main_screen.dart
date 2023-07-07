import 'package:charlie/resources/app_icons.dart';
import 'package:charlie/setttings/widgets/change_language_pop.dart';
import 'package:charlie/setttings/widgets/one_setting_button.dart';
import 'package:charlie/setttings/widgets/social_media_icon.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/utils/constants.dart';
import 'package:charlie/widgets/dialogs/custom_pop_up2.dart';
import 'package:charlie/widgets/elements/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;

class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  State<SettingsMainScreen> createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends State<SettingsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.47, color: Color(0xFFBBBBBB)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    tran.settings.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.black25,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomDivider(),
                  OneSettingButton(
                    icon: AppIcons.contactUsSetting,
                    title: tran.contactUs.tr,
                  ),
                  const CustomDivider(),
                  OneSettingButton(
                    icon: AppIcons.whoWeAreUsSetting,
                    title: tran.howWeAre.tr,
                  ),
                  const CustomDivider(),
                  OneSettingButton(
                    icon: AppIcons.languages,
                    title: tran.chooseLanguage.tr,
                    onTap: () {
                      customPopUp(
                        context,
                        height: 350,
                        child: const ChangeLanguagePop(),
                      );
                    },
                  ),
                ]),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaIcon(
                    icon: AppIcons.youtube,
                    onTap: () {
                      // implement_code
                    },
                  ),
                  SocialMediaIcon(
                    icon: AppIcons.twitter,
                    onTap: () {
                      // implement_code
                    },
                  ),
                  SocialMediaIcon(
                    icon: AppIcons.instagram,
                    onTap: () {
                      // implement_code
                    },
                  ),
                  SocialMediaIcon(
                    icon: AppIcons.whatsapp,
                    onTap: () {
                      // implement_code
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
