import 'package:flutter/material.dart';

/// Contrast utilities for accessibility support.
class ContrastUtils {
  const ContrastUtils._();

  /// Calculate contrast ratio between two colors
  static double calculateContrastRatio(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();
    
    final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final darker = luminance1 > luminance2 ? luminance2 : luminance1;
    
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Check if contrast ratio meets WCAG AA standards
  static bool meetsWCAGAA(Color foreground, Color background) {
    return calculateContrastRatio(foreground, background) >= 4.5;
  }

  /// Check if contrast ratio meets WCAG AAA standards
  static bool meetsWCAGAAA(Color foreground, Color background) {
    return calculateContrastRatio(foreground, background) >= 7.0;
  }

  /// Get accessible text color for background
  static Color getAccessibleTextColor(Color background) {
    const lightText = Color(0xFFFFFFFF);
    const darkText = Color(0xFF000000);
    
    final lightContrast = calculateContrastRatio(lightText, background);
    final darkContrast = calculateContrastRatio(darkText, background);
    
    return lightContrast > darkContrast ? lightText : darkText;
  }

  /// Get accessible background color for text
  static Color getAccessibleBackgroundColor(Color text) {
    const lightBackground = Color(0xFFFFFFFF);
    const darkBackground = Color(0xFF000000);
    
    final lightContrast = calculateContrastRatio(text, lightBackground);
    final darkContrast = calculateContrastRatio(text, darkBackground);
    
    return lightContrast > darkContrast ? lightBackground : darkBackground;
  }

  /// Adjust color to meet contrast requirements
  static Color adjustColorForContrast(Color color, Color background, double minContrast) {
    if (calculateContrastRatio(color, background) >= minContrast) {
      return color;
    }
    
    // Try to find a color that meets the contrast requirement
    final hsl = HSLColor.fromColor(color);
    final backgroundLuminance = background.computeLuminance();
    
    // Adjust lightness to meet contrast
    double lightness = hsl.lightness;
    const step = 0.01;
    
    while (calculateContrastRatio(color, background) < minContrast && lightness > 0 && lightness < 1) {
      if (backgroundLuminance > 0.5) {
        lightness -= step; // Darken for light backgrounds
      } else {
        lightness += step; // Lighten for dark backgrounds
      }
      
      color = hsl.withLightness(lightness).toColor();
    }
    
    return color;
  }

  /// Get high contrast color variant
  static Color getHighContrastColor(Color color) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness(hsl.lightness > 0.5 ? 0.1 : 0.9).toColor();
  }

  /// Check if colors are high contrast
  static bool isHighContrast(Color color1, Color color2) {
    return calculateContrastRatio(color1, color2) >= 7.0;
  }

  /// Get contrast level description
  static String getContrastLevelDescription(Color foreground, Color background) {
    final ratio = calculateContrastRatio(foreground, background);
    
    if (ratio >= 7.0) {
      return 'AAA (Excellent)';
    } else if (ratio >= 4.5) {
      return 'AA (Good)';
    } else if (ratio >= 3.0) {
      return 'AA Large (Acceptable)';
    } else {
      return 'Fail (Poor)';
    }
  }

  /// Get contrast level color
  static Color getContrastLevelColor(Color foreground, Color background) {
    final ratio = calculateContrastRatio(foreground, background);
    
    if (ratio >= 7.0) {
      return Colors.green;
    } else if (ratio >= 4.5) {
      return Colors.blue;
    } else if (ratio >= 3.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  /// Create accessible color scheme
  static ColorScheme createAccessibleColorScheme(ColorScheme baseScheme) {
    return ColorScheme(
      brightness: baseScheme.brightness,
      primary: adjustColorForContrast(baseScheme.primary, baseScheme.surface, 4.5),
      onPrimary: adjustColorForContrast(baseScheme.onPrimary, baseScheme.primary, 4.5),
      secondary: adjustColorForContrast(baseScheme.secondary, baseScheme.surface, 4.5),
      onSecondary: adjustColorForContrast(baseScheme.onSecondary, baseScheme.secondary, 4.5),
      tertiary: adjustColorForContrast(baseScheme.tertiary, baseScheme.surface, 4.5),
      onTertiary: adjustColorForContrast(baseScheme.onTertiary, baseScheme.tertiary, 4.5),
      error: adjustColorForContrast(baseScheme.error, baseScheme.surface, 4.5),
      onError: adjustColorForContrast(baseScheme.onError, baseScheme.error, 4.5),
      surface: baseScheme.surface,
      onSurface: adjustColorForContrast(baseScheme.onSurface, baseScheme.surface, 4.5),
      surfaceVariant: baseScheme.surfaceVariant,
      onSurfaceVariant: adjustColorForContrast(baseScheme.onSurfaceVariant, baseScheme.surfaceVariant, 4.5),
      outline: adjustColorForContrast(baseScheme.outline, baseScheme.surface, 3.0),
      outlineVariant: adjustColorForContrast(baseScheme.outlineVariant, baseScheme.surface, 3.0),
      shadow: baseScheme.shadow,
      scrim: baseScheme.scrim,
      inverseSurface: baseScheme.inverseSurface,
      onInverseSurface: adjustColorForContrast(baseScheme.onInverseSurface, baseScheme.inverseSurface, 4.5),
      inversePrimary: adjustColorForContrast(baseScheme.inversePrimary, baseScheme.inverseSurface, 4.5),
      surfaceTint: baseScheme.surfaceTint,
    );
  }
}
