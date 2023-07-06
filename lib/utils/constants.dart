import 'package:flutter/material.dart';

const String localKey = "localKey";

const Locale frenchLocale = Locale('fr', "");
const Locale englishLocale = Locale('en', "");

Iterable<Locale> supportedLocales = const [
  frenchLocale,
  englishLocale,
];

const int homePageIndex = 0;
const int favoriteIndex = 1;
const int settingsScreenIndex = 2;

const String defaultUserPicturePlaceHolder = "";

const double userCardHeight = 120;
const double userPictureCardSize = 75.0;
