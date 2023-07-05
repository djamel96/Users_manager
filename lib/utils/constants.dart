import 'package:flutter/material.dart';

const String localKey = "localKey";

const Locale frenchLocale = Locale('fr', "");
const Locale englishLocale = Locale('en', "");

Iterable<Locale> supportedLocales = const [
  frenchLocale,
  englishLocale,
];

const int homePageIndex = 0;
const int newsScreenIndex = 1;
const int requestTranslatorScreenIndex = 2;
const int settingsScreenIndex = 3;
