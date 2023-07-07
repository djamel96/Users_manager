import 'package:charlie/them/colors.dart';
import 'package:charlie/translations/translation_keys.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'device_info.dart';

class CustomCountryPicker {
  static pickCountry(BuildContext context, void Function(Country) onSelect) {
    showCountryPicker(
      context: context,
      favorite: ['fr', 'us'],
      countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 16,
              color: AppColors.defaultTextColor,
              fontWeight: FontWeight.w600),
          bottomSheetHeight: getScreeHeight(context, .7),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            hintText: searchCountryByName.tr,
            contentPadding: const EdgeInsets.fromLTRB(16, 10.0, 25.0, 10.0),
            border: InputBorder.none,
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: AppColors.appMain100),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: AppColors.grey172),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Colors.red[400]!),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(8),
            ),
          )),
      onSelect: onSelect,
    );
  }
}
