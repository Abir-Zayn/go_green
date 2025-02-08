import 'package:flutter/material.dart';

class AppColors {
  //for button color
  static const Color primaryColor = Color(0xFF0D8E5F);
  static const Color secondaryColor = Color(0xFF19B076);

  //Primary Scale colors
  static const Color primaryScaleColor1 = Color(0xFFEDFCF4);
  static const Color primaryScaleColor2 = Color(0xFFD2F9EA);
  static const Color primaryScaleColor3 = Color(0xFF0A4A36);

  //Splash Screen color
  static const Color splash_outerBg = Color(0xFFd3f8e3);
  static const Color splash_innerBg = Color(0xFFabefcd);
  static const Color splash_inner_color = Color(0xFF3ccb90);

  //Text color
  static const Color primaryTextcolor = Color(0xFF050505);
  static const Color secondaryTextcolor = Color(0xFF8E8E8E);

  // Additional Colors
  static const Color accent1 = Color(0xFFFFD636); // Yellow
  static const Color accent2 = Color(0xFF5AAAFA); // Blue
  static const Color accent3 = Color(0xFFF2575B); // Red

  // Primary Black & White variants
  static const Color primary = Color(0xFF0D8E5F);
  static const Color secondary = Color(0xFF19B076);

  // Create Material Color Swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF0D8E5F,
    <int, Color>{
      50: Color(0xFFEDFCF4),
      100: Color(0xFFD2F9EA),
      200: Color(0xFF19B076),
      300: Color(0xFF0D8E5F),
      400: Color(0xFF0A4A36),
      500: Color(0xFF0D8E5F), // primary
      600: Color(0xFF0B7B52),
      700: Color(0xFF096845),
      800: Color(0xFF075538),
      900: Color(0xFF04422B),
    },
  );
}
