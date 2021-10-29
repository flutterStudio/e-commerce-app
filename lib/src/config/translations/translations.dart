import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
part 'ar.translations.dart';
part 'en.translations.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"en": _english, "ar": _arabic};

  List<Locale> get supportedLocales => [const Locale("en"), const Locale("ar")];
}
