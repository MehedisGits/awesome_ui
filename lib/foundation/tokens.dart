/// Design tokens for the awesome_ui component library
/// 
/// This file contains all the design tokens including colors, typography,
/// spacing, radius, elevation, and motion tokens that form the foundation
/// of the design system.

import 'package:flutter/material.dart';

/// Color tokens for the design system
class AuiColors {
  const AuiColors._();

  // Primary colors
  static const Color primary50 = Color(0xFFE3F2FD);
  static const Color primary100 = Color(0xFFBBDEFB);
  static const Color primary200 = Color(0xFF90CAF9);
  static const Color primary300 = Color(0xFF64B5F6);
  static const Color primary400 = Color(0xFF42A5F5);
  static const Color primary500 = Color(0xFF2196F3);
  static const Color primary600 = Color(0xFF1E88E5);
  static const Color primary700 = Color(0xFF1976D2);
  static const Color primary800 = Color(0xFF1565C0);
  static const Color primary900 = Color(0xFF0D47A1);

  // Secondary colors
  static const Color secondary50 = Color(0xFFF3E5F5);
  static const Color secondary100 = Color(0xFFE1BEE7);
  static const Color secondary200 = Color(0xFFCE93D8);
  static const Color secondary300 = Color(0xFFBA68C8);
  static const Color secondary400 = Color(0xFFAB47BC);
  static const Color secondary500 = Color(0xFF9C27B0);
  static const Color secondary600 = Color(0xFF8E24AA);
  static const Color secondary700 = Color(0xFF7B1FA2);
  static const Color secondary800 = Color(0xFF6A1B9A);
  static const Color secondary900 = Color(0xFF4A148C);

  // Neutral colors
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral900 = Color(0xFF212121);

  // Semantic colors
  static const Color success50 = Color(0xFFE8F5E8);
  static const Color success100 = Color(0xFFC8E6C9);
  static const Color success200 = Color(0xFFA5D6A7);
  static const Color success300 = Color(0xFF81C784);
  static const Color success400 = Color(0xFF66BB6A);
  static const Color success500 = Color(0xFF4CAF50);
  static const Color success600 = Color(0xFF43A047);
  static const Color success700 = Color(0xFF388E3C);
  static const Color success800 = Color(0xFF2E7D32);
  static const Color success900 = Color(0xFF1B5E20);

  static const Color warning50 = Color(0xFFFFF8E1);
  static const Color warning100 = Color(0xFFFFECB3);
  static const Color warning200 = Color(0xFFFFE082);
  static const Color warning300 = Color(0xFFFFD54F);
  static const Color warning400 = Color(0xFFFFCA28);
  static const Color warning500 = Color(0xFFFFC107);
  static const Color warning600 = Color(0xFFFFB300);
  static const Color warning700 = Color(0xFFFFA000);
  static const Color warning800 = Color(0xFFFF8F00);
  static const Color warning900 = Color(0xFFFF6F00);

  static const Color error50 = Color(0xFFFFEBEE);
  static const Color error100 = Color(0xFFFFCDD2);
  static const Color error200 = Color(0xFFEF9A9A);
  static const Color error300 = Color(0xFFE57373);
  static const Color error400 = Color(0xFFEF5350);
  static const Color error500 = Color(0xFFF44336);
  static const Color error600 = Color(0xFFE53935);
  static const Color error700 = Color(0xFFD32F2F);
  static const Color error800 = Color(0xFFC62828);
  static const Color error900 = Color(0xFFB71C1C);

  static const Color info50 = Color(0xFFE3F2FD);
  static const Color info100 = Color(0xFFBBDEFB);
  static const Color info200 = Color(0xFF90CAF9);
  static const Color info300 = Color(0xFF64B5F6);
  static const Color info400 = Color(0xFF42A5F5);
  static const Color info500 = Color(0xFF2196F3);
  static const Color info600 = Color(0xFF1E88E5);
  static const Color info700 = Color(0xFF1976D2);
  static const Color info800 = Color(0xFF1565C0);
  static const Color info900 = Color(0xFF0D47A1);

  // Dark mode colors
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkSurfaceVariant = Color(0xFF1E1E1E);
  static const Color darkOnSurface = Color(0xFFE1E1E1);
  static const Color darkOnSurfaceVariant = Color(0xFFB3B3B3);
}

/// Typography tokens for the design system
class AuiTypography {
  const AuiTypography._();

  // Font families
  static const String primaryFontFamily = 'Roboto';
  static const String secondaryFontFamily = 'Inter';
  static const String monoFontFamily = 'JetBrains Mono';

  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Font sizes
  static const double xs = 12.0;
  static const double sm = 14.0;
  static const double base = 16.0;
  static const double lg = 18.0;
  static const double xl = 20.0;
  static const double xl2 = 24.0;
  static const double xl3 = 30.0;
  static const double xl4 = 36.0;
  static const double xl5 = 48.0;
  static const double xl6 = 60.0;
  static const double xl7 = 72.0;
  static const double xl8 = 96.0;
  static const double xl9 = 128.0;

  // Line heights
  static const double tight = 1.25;
  static const double snug = 1.375;
  static const double normal = 1.5;
  static const double relaxed = 1.625;
  static const double loose = 2.0;

  // Letter spacing
  static const double tighter = -0.05;
  static const double tight = -0.025;
  static const double normal = 0.0;
  static const double wide = 0.025;
  static const double wider = 0.05;
  static const double widest = 0.1;
}

/// Spacing tokens for the design system
class AuiSpacing {
  const AuiSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xl2 = 48.0;
  static const double xl3 = 64.0;
  static const double xl4 = 80.0;
  static const double xl5 = 96.0;
  static const double xl6 = 128.0;
  static const double xl7 = 160.0;
  static const double xl8 = 192.0;
  static const double xl9 = 224.0;
  static const double xl10 = 256.0;
}

/// Border radius tokens for the design system
class AuiRadius {
  const AuiRadius._();

  static const double none = 0.0;
  static const double xs = 2.0;
  static const double sm = 4.0;
  static const double md = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double xl2 = 20.0;
  static const double xl3 = 24.0;
  static const double xl4 = 32.0;
  static const double full = 9999.0;
}

/// Elevation tokens for the design system
class AuiElevation {
  const AuiElevation._();

  static const double none = 0.0;
  static const double xs = 1.0;
  static const double sm = 2.0;
  static const double md = 4.0;
  static const double lg = 8.0;
  static const double xl = 12.0;
  static const double xl2 = 16.0;
  static const double xl3 = 20.0;
  static const double xl4 = 24.0;
  static const double xl5 = 28.0;
  static const double xl6 = 32.0;
}

/// Motion tokens for the design system
class AuiMotion {
  const AuiMotion._();

  // Durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration slower = Duration(milliseconds: 750);
  static const Duration slowest = Duration(milliseconds: 1000);

  // Curves
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOutCubic = Curves.easeInOutCubic;
  static const Curve easeInCubic = Curves.easeInCubic;
  static const Curve easeOutCubic = Curves.easeOutCubic;
  static const Curve easeInOutQuart = Curves.easeInOutQuart;
  static const Curve easeInQuart = Curves.easeInQuart;
  static const Curve easeOutQuart = Curves.easeOutQuart;
  static const Curve easeInOutQuint = Curves.easeInOutQuint;
  static const Curve easeInQuint = Curves.easeInQuint;
  static const Curve easeOutQuint = Curves.easeOutQuint;
  static const Curve easeInOutSine = Curves.easeInOutSine;
  static const Curve easeInSine = Curves.easeInSine;
  static const Curve easeOutSine = Curves.easeOutSine;
  static const Curve easeInOutExpo = Curves.easeInOutExpo;
  static const Curve easeInExpo = Curves.easeInExpo;
  static const Curve easeOutExpo = Curves.easeOutExpo;
  static const Curve easeInOutCirc = Curves.easeInOutCirc;
  static const Curve easeInCirc = Curves.easeInCirc;
  static const Curve easeOutCirc = Curves.easeOutCirc;
  static const Curve easeInOutBack = Curves.easeInOutBack;
  static const Curve easeInBack = Curves.easeInBack;
  static const Curve easeOutBack = Curves.easeOutBack;
  static const Curve easeInOutElastic = Curves.easeInOutElastic;
  static const Curve easeInElastic = Curves.easeInElastic;
  static const Curve easeOutElastic = Curves.easeOutElastic;
  static const Curve easeInOutBounce = Curves.easeInOutBounce;
  static const Curve easeInBounce = Curves.easeInBounce;
  static const Curve easeOutBounce = Curves.easeOutBounce;
}

/// Size tokens for the design system
class AuiSize {
  const AuiSize._();

  // Component sizes
  static const double xs = 24.0;
  static const double sm = 32.0;
  static const double md = 40.0;
  static const double lg = 48.0;
  static const double xl = 56.0;
  static const double xl2 = 64.0;
  static const double xl3 = 72.0;
  static const double xl4 = 80.0;
  static const double xl5 = 88.0;
  static const double xl6 = 96.0;
  static const double xl7 = 104.0;
  static const double xl8 = 112.0;
  static const double xl9 = 120.0;
  static const double xl10 = 128.0;
}

/// Z-index tokens for the design system
class AuiZIndex {
  const AuiZIndex._();

  static const int hide = -1;
  static const int auto = 0;
  static const int base = 1;
  static const int docked = 10;
  static const int dropdown = 1000;
  static const int sticky = 1020;
  static const int fixed = 1030;
  static const int modalBackdrop = 1040;
  static const int modal = 1050;
  static const int popover = 1060;
  static const int skipLink = 1070;
  static const int toast = 1080;
  static const int tooltip = 1090;
}
