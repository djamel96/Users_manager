import 'package:charlie/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

changeLanguage(
  String locale,
) {
  Get.updateLocale(Locale(locale));

  SharedPreferences.getInstance().then((prefs) async {
    prefs.setString(localKey, locale);
  });
}
