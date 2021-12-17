import 'package:flutter/widgets.dart';

enum ScreenSize { xs, sm, md, lg, xlg, xxlg }

enum FontType {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  bodytext1,
  bodytext2,
  subtitle1,
  subtitle2,
  button,
  caption,
  overline
}

// Icons sizes
class SizeConfig {
  static const double rem2px = 16;
  static ScreenSize screenSize() {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
    return width < 576
        ? ScreenSize.xs
        : width >= 576 && width < 768
            ? ScreenSize.sm
            : width >= 768 && width < 992
                ? ScreenSize.md
                : width >= 992 && width < 1200
                    ? ScreenSize.lg
                    : width >= 1200 && width < 1400
                        ? ScreenSize.xlg
                        : ScreenSize.xxlg;
  }

  static const Map<ScreenSize, List<double>> _responsiveFontSize = {
    ScreenSize.xs: [
      3.5,
      2.375,
      2,
      1.5625,
      1.25,
      1.125,
      1,
      0.875,
      1,
      0.875,
      0.875,
      0.75,
      0.625
    ],
    ScreenSize.sm: [
      4.7129,
      2.9167,
      2.5707,
      1.8219,
      1.3118,
      1.25,
      1,
      0.875,
      1,
      0.875,
      0.875,
      0.75,
      0.625
    ],
    ScreenSize.md: [
      5.3556,
      3.3333,
      2.7849,
      2.0243,
      1.4993,
      1.25,
      1,
      0.875,
      1,
      0.875,
      0.875,
      0.75,
      0.625
    ],
    ScreenSize.lg: [
      5.9983,
      3.75,
      2.9991,
      2.0243,
      1.4993,
      1.25,
      1,
      0.875,
      1,
      0.875,
      0.875,
      0.75,
      0.625
    ],
    ScreenSize.xlg: [
      5.9983,
      3.75,
      2.9991,
      2.0243,
      1.4993,
      1.25,
      1,
      0.875,
      1,
      0.875,
      0.875,
      0.75,
      0.625
    ],
    ScreenSize.xxlg: [
      5.9983,
      3.75,
      2.9991,
      2.0243,
      1.4993,
      1.25,
      1,
      0.875,
      1,
      0.875,
      0.875,
      0.75,
      0.625
    ],
  };

  static double? fontSize(FontType type) {
    double? fontSize = _responsiveFontSize[screenSize()]?.elementAt(type.index);
    return rem2px * fontSize!;
  }

  static const double verticalSpace = 8;
  static const double horizontalSpace = 8;
  static const double buttonPadding = 12;
  static const double borderRadius = 10;
}

class ICONSIZE {
  static const double xsm = 14;
  static const double sm = 18;
  static const double md = 24;
  static const double lg = 36;
  static const double xlg = 48;
}
