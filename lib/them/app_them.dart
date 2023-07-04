import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: 'WorkSans',
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  // dividerColor: Colors.white54,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    background: Colors.white,
    primary: Colors.white,
    secondary: AppColors.appMain100,
  ),
);
