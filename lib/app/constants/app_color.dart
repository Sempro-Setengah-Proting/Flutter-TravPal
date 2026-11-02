import 'package:flutter/widgets.dart';

abstract final class AppColor {
  // Primary
  static const Color primary900 = Color(0xFF165E6C);
  static const Color primary800 = Color(0xFF1B7485);
  static const Color primary700 = Color(0xFF208CA1);
  static const Color primary600 = Color(0xFF26A5BD);
  static const Color primary500 = Color(0xFF2BBBD7);
  static const Color primary400 = Color(0xFF60CCE1);
  static const Color primary300 = Color(0xFF8ADAE9);
  static const Color primary200 = Color(0xFFB5E7F1);
  static const Color primary100 = Color(0xFFD5F1F7);
  static const Color primary50 = Color(0xFFEAF8FB);

  // Secondary
  static const Color secondary950 = Color(0xFF000000);
  static const Color secondary900 = Color(0xFF677778);
  static const Color secondary800 = Color(0xFF809494);
  static const Color secondary700 = Color(0xFF9AB2B3);
  static const Color secondary600 = Color(0xFFB5D1D2);
  static const Color secondary500 = Color(0xFFCEEEEF);
  static const Color secondary400 = Color(0xFFDAF2F3);
  static const Color secondary300 = Color(0xFFE4F6F6);
  static const Color secondary200 = Color(0xFFEEF9F9);
  static const Color secondary100 = Color(0xFFF5FCFC);
  static const Color secondary50 = Color(0xFFFAFDFD);

  // Neutral
  static const Color neutral950 = Color(0xFF091413);
  static const Color neutral900 = Color(0xFF2C2C2C);
  static const Color neutral800 = Color(0xFF3F3F3F);
  static const Color neutral700 = Color(0xFF666666);
  static const Color neutral600 = Color(0xFFAAAAAA);
  static const Color neutral500 = Color(0xFFCCCCCC);
  static const Color neutral400 = Color(0xFFD9D9D9);
  static const Color neutral300 = Color(0xFFEEEEEE);
  static const Color neutral200 = Color(0xFFF4F4F4);
  static const Color neutral100 = Color(0xFFFBFBFB);

  // Alert
  static const Color success = Color(0xFF16A34A);
  static const Color info = Color(0xFF2563EB);
  static const Color danger = Color(0xFFDC2626);
  static const Color warning = Color(0xFFFFCC00);

  // Semantic colors
  static const Color appSuccess = success;
  static const Color appInfo = info;
  static const Color appDanger = danger;
  static const Color appWarning = warning;
  static const Color appBackground = neutral200;
  static const Color appTextPrimary = neutral950;
  static const Color appTextSecondary = neutral700;
  static const Color appBorder = neutral400;
  static const Color appGrey = neutral500;
  static const Color appSecondary = secondary500;
  static const Color appSecondary100 = secondary100;
  static const Color appPrimary = primary500;
}
