import 'package:flutter/material.dart';

/// Typography system for awesome_ui
/// 
/// Provides a comprehensive typography scale with semantic naming,
/// responsive sizing, and accessibility-compliant text styles.
class AuiTypography {
  const AuiTypography._();
  
  // Font families
  static const String primaryFontFamily = 'Roboto';
  static const String secondaryFontFamily = 'Inter';
  static const String monoFontFamily = 'JetBrains Mono';
  
  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
  
  // Display styles (largest text)
  static const TextStyle displayLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 57,
    fontWeight: regular,
    letterSpacing: -0.25,
    height: 1.12,
  );
  
  static const TextStyle displayMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 45,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.16,
  );
  
  static const TextStyle displaySmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 36,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.22,
  );
  
  // Headline styles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 32,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.25,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 28,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.29,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 24,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.33,
  );
  
  // Title styles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 22,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.27,
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: medium,
    letterSpacing: 0.15,
    height: 1.50,
  );
  
  static const TextStyle titleSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.43,
  );
  
  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: regular,
    letterSpacing: 0.5,
    height: 1.50,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: regular,
    letterSpacing: 0.25,
    height: 1.43,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0.4,
    height: 1.33,
  );
  
  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.43,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: medium,
    letterSpacing: 0.5,
    height: 1.33,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 11,
    fontWeight: medium,
    letterSpacing: 0.5,
    height: 1.45,
  );
  
  // Code styles
  static const TextStyle codeLarge = TextStyle(
    fontFamily: monoFontFamily,
    fontSize: 16,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.50,
  );
  
  static const TextStyle codeMedium = TextStyle(
    fontFamily: monoFontFamily,
    fontSize: 14,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.43,
  );
  
  static const TextStyle codeSmall = TextStyle(
    fontFamily: monoFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.33,
  );
  
  // Button styles
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.43,
  );
  
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.43,
  );
  
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: medium,
    letterSpacing: 0.5,
    height: 1.33,
  );
  
  // Caption styles
  static const TextStyle caption = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0.4,
    height: 1.33,
  );
  
  static const TextStyle overline = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 10,
    fontWeight: medium,
    letterSpacing: 1.5,
    height: 1.60,
  );
}

/// Responsive typography that scales with screen size
class AuiResponsiveTypography {
  const AuiResponsiveTypography._();
  
  /// Get responsive font size based on breakpoint
  static double getResponsiveFontSize(double baseSize, double screenWidth) {
    if (screenWidth < 600) {
      return baseSize * 0.875; // 14px base becomes 12.25px on mobile
    } else if (screenWidth < 840) {
      return baseSize * 0.9375; // 14px base becomes 13.125px on small tablet
    } else if (screenWidth < 1200) {
      return baseSize; // Base size on tablet
    } else if (screenWidth < 1600) {
      return baseSize * 1.125; // 14px base becomes 15.75px on desktop
    } else {
      return baseSize * 1.25; // 14px base becomes 17.5px on large desktop
    }
  }
  
  /// Create responsive text style
  static TextStyle responsive(TextStyle baseStyle, double screenWidth) {
    return baseStyle.copyWith(
      fontSize: getResponsiveFontSize(baseStyle.fontSize ?? 14, screenWidth),
    );
  }
}

/// Typography scale for different content types
class AuiContentTypography {
  const AuiContentTypography._();
  
  // Article/Content styles
  static const TextStyle articleTitle = AuiTypography.headlineLarge;
  static const TextStyle articleSubtitle = AuiTypography.headlineMedium;
  static const TextStyle articleBody = AuiTypography.bodyLarge;
  static const TextStyle articleCaption = AuiTypography.bodySmall;
  static const TextStyle articleQuote = TextStyle(
    fontFamily: AuiTypography.primaryFontFamily,
    fontSize: 18,
    fontWeight: AuiTypography.light,
    fontStyle: FontStyle.italic,
    letterSpacing: 0,
    height: 1.44,
  );
  
  // Card styles
  static const TextStyle cardTitle = AuiTypography.titleMedium;
  static const TextStyle cardSubtitle = AuiTypography.bodyMedium;
  static const TextStyle cardBody = AuiTypography.bodySmall;
  static const TextStyle cardCaption = AuiTypography.caption;
  
  // List styles
  static const TextStyle listTitle = AuiTypography.titleSmall;
  static const TextStyle listSubtitle = AuiTypography.bodyMedium;
  static const TextStyle listBody = AuiTypography.bodySmall;
  static const TextStyle listMeta = AuiTypography.caption;
  
  // Form styles
  static const TextStyle formLabel = AuiTypography.labelMedium;
  static const TextStyle formHint = AuiTypography.bodySmall;
  static const TextStyle formError = AuiTypography.bodySmall;
  static const TextStyle formHelp = AuiTypography.caption;
  
  // Navigation styles
  static const TextStyle navTitle = AuiTypography.titleLarge;
  static const TextStyle navItem = AuiTypography.labelLarge;
  static const TextStyle navSubItem = AuiTypography.bodyMedium;
  
  // Status styles
  static const TextStyle statusSuccess = AuiTypography.bodySmall;
  static const TextStyle statusWarning = AuiTypography.bodySmall;
  static const TextStyle statusError = AuiTypography.bodySmall;
  static const TextStyle statusInfo = AuiTypography.bodySmall;
}

/// Typography utilities
class AuiTypographyUtils {
  const AuiTypographyUtils._();
  
  /// Get text style with custom color
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
  
  /// Get text style with custom weight
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
  
  /// Get text style with custom size
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }
  
  /// Get text style with custom height
  static TextStyle withHeight(TextStyle style, double height) {
    return style.copyWith(height: height);
  }
  
  /// Get text style with custom letter spacing
  static TextStyle withLetterSpacing(TextStyle style, double spacing) {
    return style.copyWith(letterSpacing: spacing);
  }
  
  /// Get text style with custom decoration
  static TextStyle withDecoration(TextStyle style, TextDecoration decoration) {
    return style.copyWith(decoration: decoration);
  }
  
  /// Get text style with custom font family
  static TextStyle withFontFamily(TextStyle style, String fontFamily) {
    return style.copyWith(fontFamily: fontFamily);
  }
  
  /// Get text style with custom font style
  static TextStyle withFontStyle(TextStyle style, FontStyle fontStyle) {
    return style.copyWith(fontStyle: fontStyle);
  }
  
  /// Get text style with custom shadows
  static TextStyle withShadows(TextStyle style, List<Shadow> shadows) {
    return style.copyWith(shadows: shadows);
  }
  
  /// Get text style with custom background
  static TextStyle withBackground(TextStyle style, Paint background) {
    return style.copyWith(background: background);
  }
  
  /// Get text style with custom foreground
  static TextStyle withForeground(TextStyle style, Paint foreground) {
    return style.copyWith(foreground: foreground);
  }
}
