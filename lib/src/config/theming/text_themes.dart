import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../size.config.dart';

class AppTextTheme {
  static TextTheme getTextTheme(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
      case ThemeMode.system:
        return TextTheme(
          headline1: TextStyles.h1,
          headline2: TextStyles.h2,
          headline3: TextStyles.h3,
          headline4: TextStyles.h4,
          headline5: TextStyles.h5,
          headline6: TextStyles.h6,
          bodyText1: TextStyles.bodytext1,
          bodyText2: TextStyles.bodytext2,
          subtitle1: TextStyles.subtitle1,
          button: TextStyles.button,
          caption: TextStyles.caption,
          overline: TextStyles.overline,
        );
      case ThemeMode.dark:
        return TextTheme(
            headline1: TextStyles.h1,
            headline2: TextStyles.h2,
            headline3: TextStyles.h3,
            headline4: TextStyles.h4,
            headline5: TextStyles.h5,
            headline6: TextStyles.h6,
            bodyText1: TextStyles.bodytext1,
            bodyText2: TextStyles.bodytext2,
            subtitle1: TextStyles.subtitle1,
            button: TextStyles.button,
            caption: TextStyles.caption,
            overline: TextStyles.overline);
    }
  }
}

class TextStyles {
  static TextStyle? get h1 => getTextStyle(FontType.h1);

  static TextStyle get h2 => getTextStyle(FontType.h2);

  static TextStyle? get h3 => getTextStyle(FontType.h3);

  static TextStyle get h4 => getTextStyle(FontType.h4);

  static TextStyle get h5 => getTextStyle(FontType.h5);

  static TextStyle get h6 => getTextStyle(FontType.h6);

  static TextStyle get bodytext1 => getTextStyle(FontType.bodytext1);

  static TextStyle get bodytext2 => getTextStyle(FontType.bodytext2);

  static TextStyle get subtitle1 => getTextStyle(FontType.subtitle1);

  static TextStyle get subtitle2 => getTextStyle(FontType.subtitle2);

  static TextStyle get button => getTextStyle(FontType.button);

  static TextStyle get caption => getTextStyle(FontType.caption);

  static TextStyle get overline => getTextStyle(FontType.overline);

  static TextStyle getTextStyle(FontType type) => TextStyle(
      fontSize: SizeConfig.fontSize(type), fontWeight: fontWeight(type));

  static const Map<FontType, FontWeight> _fontWeights = {
    FontType.h1: FontWeight.w300,
    FontType.h2: FontWeight.w300,
    FontType.h4: FontWeight.w400,
    FontType.h5: FontWeight.w400,
    FontType.h6: FontWeight.w500,
    FontType.subtitle1: FontWeight.w400,
    FontType.subtitle2: FontWeight.w500,
    FontType.bodytext1: FontWeight.w400,
    FontType.button: FontWeight.w500,
    FontType.caption: FontWeight.w400,
    FontType.overline: FontWeight.w400,
  };
  static FontWeight? fontWeight(FontType type) => _fontWeights[type];
}
