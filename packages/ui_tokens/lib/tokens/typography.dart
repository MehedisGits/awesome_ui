import 'package:flutter/material.dart';

/// Design tokens for typography.
/// 
/// Provides responsive typography tokens that scale appropriately across
/// different screen sizes and accessibility settings.
class AppTypography {
  const AppTypography._();

  /// Create a standard typography instance
  factory AppTypography.standard() => const AppTypography._();

  /// Font families
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Inter';
  static const String monospaceFont = 'JetBrains Mono';

  /// Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  /// Font sizes (base sizes)
  static const double displayLargeSize = 57.0;
  static const double displayMediumSize = 45.0;
  static const double displaySmallSize = 36.0;
  static const double headlineLargeSize = 32.0;
  static const double headlineMediumSize = 28.0;
  static const double headlineSmallSize = 24.0;
  static const double titleLargeSize = 22.0;
  static const double titleMediumSize = 16.0;
  static const double titleSmallSize = 14.0;
  static const double bodyLargeSize = 16.0;
  static const double bodyMediumSize = 14.0;
  static const double bodySmallSize = 12.0;
  static const double labelLargeSize = 14.0;
  static const double labelMediumSize = 12.0;
  static const double labelSmallSize = 11.0;

  /// Line heights
  static const double displayLargeHeight = 64.0;
  static const double displayMediumHeight = 52.0;
  static const double displaySmallHeight = 44.0;
  static const double headlineLargeHeight = 40.0;
  static const double headlineMediumHeight = 36.0;
  static const double headlineSmallHeight = 32.0;
  static const double titleLargeHeight = 28.0;
  static const double titleMediumHeight = 24.0;
  static const double titleSmallHeight = 20.0;
  static const double bodyLargeHeight = 24.0;
  static const double bodyMediumHeight = 20.0;
  static const double bodySmallHeight = 16.0;
  static const double labelLargeHeight = 20.0;
  static const double labelMediumHeight = 16.0;
  static const double labelSmallHeight = 16.0;

  /// Letter spacing
  static const double displayLargeSpacing = -0.25;
  static const double displayMediumSpacing = 0.0;
  static const double displaySmallSpacing = 0.0;
  static const double headlineLargeSpacing = 0.0;
  static const double headlineMediumSpacing = 0.0;
  static const double headlineSmallSpacing = 0.0;
  static const double titleLargeSpacing = 0.0;
  static const double titleMediumSpacing = 0.15;
  static const double titleSmallSpacing = 0.1;
  static const double bodyLargeSpacing = 0.5;
  static const double bodyMediumSpacing = 0.25;
  static const double bodySmallSpacing = 0.4;
  static const double labelLargeSpacing = 0.1;
  static const double labelMediumSpacing = 0.5;
  static const double labelSmallSpacing = 0.5;

  /// Text styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: displayLargeSize,
    fontWeight: regular,
    height: displayLargeHeight / displayLargeSize,
    letterSpacing: displayLargeSpacing,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: displayMediumSize,
    fontWeight: regular,
    height: displayMediumHeight / displayMediumSize,
    letterSpacing: displayMediumSpacing,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: displaySmallSize,
    fontWeight: regular,
    height: displaySmallHeight / displaySmallSize,
    letterSpacing: displaySmallSpacing,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: headlineLargeSize,
    fontWeight: regular,
    height: headlineLargeHeight / headlineLargeSize,
    letterSpacing: headlineLargeSpacing,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: headlineMediumSize,
    fontWeight: regular,
    height: headlineMediumHeight / headlineMediumSize,
    letterSpacing: headlineMediumSpacing,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: headlineSmallSize,
    fontWeight: regular,
    height: headlineSmallHeight / headlineSmallSize,
    letterSpacing: headlineSmallSpacing,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: titleLargeSize,
    fontWeight: regular,
    height: titleLargeHeight / titleLargeSize,
    letterSpacing: titleLargeSpacing,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: titleMediumSize,
    fontWeight: medium,
    height: titleMediumHeight / titleMediumSize,
    letterSpacing: titleMediumSpacing,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: titleSmallSize,
    fontWeight: medium,
    height: titleSmallHeight / titleSmallSize,
    letterSpacing: titleSmallSpacing,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: bodyLargeSize,
    fontWeight: regular,
    height: bodyLargeHeight / bodyLargeSize,
    letterSpacing: bodyLargeSpacing,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: bodyMediumSize,
    fontWeight: regular,
    height: bodyMediumHeight / bodyMediumSize,
    letterSpacing: bodyMediumSpacing,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: bodySmallSize,
    fontWeight: regular,
    height: bodySmallHeight / bodySmallSize,
    letterSpacing: bodySmallSpacing,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: labelLargeSize,
    fontWeight: medium,
    height: labelLargeHeight / labelLargeSize,
    letterSpacing: labelLargeSpacing,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: labelMediumSize,
    fontWeight: medium,
    height: labelMediumHeight / labelMediumSize,
    letterSpacing: labelMediumSpacing,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: labelSmallSize,
    fontWeight: medium,
    height: labelSmallHeight / labelSmallSize,
    letterSpacing: labelSmallSpacing,
  );

  /// Button typography
  static const TextStyle buttonLarge = labelLarge;
  static const TextStyle buttonMedium = labelMedium;
  static const TextStyle buttonSmall = labelSmall;

  /// Additional typography styles
  static const TextStyle displayLargeAdditional = TextStyle(
    fontFamily: primaryFont,
    fontSize: displayLargeSize,
    fontWeight: regular,
    height: displayLargeHeight / displayLargeSize,
    letterSpacing: displayLargeSpacing,
  );


  /// Responsive typography scaling
  static double getResponsiveFontSize(double baseSize, double scaleFactor) {
    return baseSize * scaleFactor;
  }

  /// Get responsive text style
  static TextStyle getResponsiveTextStyle(TextStyle baseStyle, double scaleFactor) {
    return baseStyle.copyWith(
      fontSize: getResponsiveFontSize(baseStyle.fontSize ?? 14.0, scaleFactor),
    );
  }

  /// Accessibility scaling factors
  static const Map<String, double> accessibilityScales = {
    'small': 0.875,
    'normal': 1.0,
    'large': 1.125,
    'extraLarge': 1.25,
    'huge': 1.5,
  };

  /// Get accessibility-scaled text style
  static TextStyle getAccessibilityTextStyle(TextStyle baseStyle, String scale) {
    final scaleFactor = accessibilityScales[scale] ?? 1.0;
    return getResponsiveTextStyle(baseStyle, scaleFactor);
  }

  /// Breakpoint-specific scaling factors
  static const Map<String, double> breakpointScales = {
    'mobile': 1.0,
    'tablet': 1.125,
    'desktop': 1.25,
    'largeDesktop': 1.375,
  };

  /// Get breakpoint-scaled text style
  static TextStyle getBreakpointTextStyle(TextStyle baseStyle, String breakpoint) {
    final scaleFactor = breakpointScales[breakpoint] ?? 1.0;
    return getResponsiveTextStyle(baseStyle, scaleFactor);
  }

  /// Monospace text styles for code
  static const TextStyle codeLarge = TextStyle(
    fontFamily: monospaceFont,
    fontSize: bodyLargeSize,
    fontWeight: regular,
    height: bodyLargeHeight / bodyLargeSize,
    letterSpacing: 0.0,
  );

  static const TextStyle codeMedium = TextStyle(
    fontFamily: monospaceFont,
    fontSize: bodyMediumSize,
    fontWeight: regular,
    height: bodyMediumHeight / bodyMediumSize,
    letterSpacing: 0.0,
  );

  static const TextStyle codeSmall = TextStyle(
    fontFamily: monospaceFont,
    fontSize: bodySmallSize,
    fontWeight: regular,
    height: bodySmallHeight / bodySmallSize,
    letterSpacing: 0.0,
  );

  /// Button text styles (additional)
  static const TextStyle buttonLargeAdditional = TextStyle(
    fontFamily: primaryFont,
    fontSize: labelLargeSize,
    fontWeight: medium,
    height: labelLargeHeight / labelLargeSize,
    letterSpacing: labelLargeSpacing,
  );

  static const TextStyle buttonMediumAdditional = TextStyle(
    fontFamily: primaryFont,
    fontSize: labelMediumSize,
    fontWeight: medium,
    height: labelMediumHeight / labelMediumSize,
    letterSpacing: labelMediumSpacing,
  );

  static const TextStyle buttonSmallAdditional = TextStyle(
    fontFamily: primaryFont,
    fontSize: labelSmallSize,
    fontWeight: medium,
    height: labelSmallHeight / labelSmallSize,
    letterSpacing: labelSmallSpacing,
  );

  /// Caption text styles
  static const TextStyle caption = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10.0,
    fontWeight: regular,
    height: 14.0 / 10.0,
    letterSpacing: 0.4,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10.0,
    fontWeight: medium,
    height: 16.0 / 10.0,
    letterSpacing: 1.5,
  );
}
