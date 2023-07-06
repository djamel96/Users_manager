import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/splash_screen.dart';
import 'package:charlie/them/app_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'translations/translations.dart';
import 'utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    SharedPreferences.getInstance().then((prefs) async {
      String savedLocaleCode = prefs.getString(localKey) ?? 'fr';
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => HomeViewModel(),
            ),
          ],
          child: MyApp(savedLocale: savedLocaleCode),
        ),
      );
    });
  });
}

class MyApp extends StatelessWidget {
  final String savedLocale;
  const MyApp({super.key, required this.savedLocale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationMaps(),
      title: 'Charlie',
      locale: Locale(savedLocale, ''),
      fallbackLocale: frenchLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}
