import 'package:get/get.dart';
import 'dictionaries/fr.dart';
import 'dictionaries/en.dart';

class TranslationMaps extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': En().messages,
        'fr_FR': Ar().messages,
      };
}
