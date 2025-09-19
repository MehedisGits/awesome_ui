import 'package:flutter/material.dart';

/// Color system for awesome_ui
/// 
/// Provides a comprehensive color palette with semantic naming,
/// brand colors, and accessibility-compliant contrast ratios.
class AuiColors {
  // Brand Colors
  static const Color primary = Color(0xFF6750A4);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFEADDFF);
  static const Color onPrimaryContainer = Color(0xFF21005D);
  
  static const Color secondary = Color(0xFF625B71);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE8DEF8);
  static const Color onSecondaryContainer = Color(0xFF1D192B);
  
  static const Color tertiary = Color(0xFF7D5260);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFD8E4);
  static const Color onTertiaryContainer = Color(0xFF31111D);
  
  // Error Colors
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);
  
  // Success Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFC8E6C9);
  static const Color onSuccessContainer = Color(0xFF1B5E20);
  
  // Warning Colors
  static const Color warning = Color(0xFFF57C00);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color warningContainer = Color(0xFFFFE0B2);
  static const Color onWarningContainer = Color(0xFFE65100);
  
  // Info Colors
  static const Color info = Color(0xFF1976D2);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFBBDEFB);
  static const Color onInfoContainer = Color(0xFF0D47A1);
  
  // Surface Colors
  static const Color surface = Color(0xFFFFFBFE);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  static const Color onSurfaceVariant = Color(0xFF49454F);
  static const Color surfaceContainerHighest = Color(0xFFE6E0E9);
  static const Color surfaceContainerHigh = Color(0xFFECE6F0);
  static const Color surfaceContainer = Color(0xFFF3EDF7);
  static const Color surfaceContainerLow = Color(0xFFF7F2FA);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceDim = Color(0xFFDDD9DD);
  static const Color surfaceBright = Color(0xFFFFFBFE);
  
  // Background Colors
  static const Color background = Color(0xFFFFFBFE);
  static const Color onBackground = Color(0xFF1C1B1F);
  
  // Outline Colors
  static const Color outline = Color(0xFF79747E);
  static const Color outlineVariant = Color(0xFFCAC4D0);
  
  // Shadow Colors
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  
  // Inverse Colors
  static const Color inverseSurface = Color(0xFF313033);
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  static const Color inversePrimary = Color(0xFFD0BCFF);
  
  // Neutral Colors (Grayscale)
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
  static const Color neutral950 = Color(0xFF0A0A0A);
  
  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFFD0BCFF);
  static const Color darkOnPrimary = Color(0xFF381E72);
  static const Color darkPrimaryContainer = Color(0xFF4F378B);
  static const Color darkOnPrimaryContainer = Color(0xFFEADDFF);
  
  static const Color darkSecondary = Color(0xFFCCC2DC);
  static const Color darkOnSecondary = Color(0xFF332D41);
  static const Color darkSecondaryContainer = Color(0xFF4A4458);
  static const Color darkOnSecondaryContainer = Color(0xFFE8DEF8);
  
  static const Color darkTertiary = Color(0xFFEFB8C8);
  static const Color darkOnTertiary = Color(0xFF492532);
  static const Color darkTertiaryContainer = Color(0xFF633B48);
  static const Color darkOnTertiaryContainer = Color(0xFFFFD8E4);
  
  static const Color darkError = Color(0xFFFFB4AB);
  static const Color darkOnError = Color(0xFF690005);
  static const Color darkErrorContainer = Color(0xFF93000A);
  static const Color darkOnErrorContainer = Color(0xFFFFDAD6);
  
  static const Color darkSuccess = Color(0xFFA5D6A7);
  static const Color darkOnSuccess = Color(0xFF003300);
  static const Color darkSuccessContainer = Color(0xFF1B5E20);
  static const Color darkOnSuccessContainer = Color(0xFFC8E6C9);
  
  static const Color darkWarning = Color(0xFFFFCC02);
  static const Color darkOnWarning = Color(0xFF332900);
  static const Color darkWarningContainer = Color(0xFFE65100);
  static const Color darkOnWarningContainer = Color(0xFFFFE0B2);
  
  static const Color darkInfo = Color(0xFF90CAF9);
  static const Color darkOnInfo = Color(0xFF003258);
  static const Color darkInfoContainer = Color(0xFF0D47A1);
  static const Color darkOnInfoContainer = Color(0xFFBBDEFB);
  
  static const Color darkSurface = Color(0xFF1C1B1F);
  static const Color darkOnSurface = Color(0xFFE6E0E9);
  static const Color darkSurfaceVariant = Color(0xFF49454F);
  static const Color darkOnSurfaceVariant = Color(0xFFCAC4D0);
  static const Color darkSurfaceContainerHighest = Color(0xFF2B2930);
  static const Color darkSurfaceContainerHigh = Color(0xFF312F36);
  static const Color darkSurfaceContainer = Color(0xFF37343B);
  static const Color darkSurfaceContainerLow = Color(0xFF3D3A41);
  static const Color darkSurfaceContainerLowest = Color(0xFF1C1B1F);
  static const Color darkSurfaceDim = Color(0xFF141218);
  static const Color darkSurfaceBright = Color(0xFF3B383E);
  
  static const Color darkBackground = Color(0xFF1C1B1F);
  static const Color darkOnBackground = Color(0xFFE6E0E9);
  
  static const Color darkOutline = Color(0xFF938F99);
  static const Color darkOutlineVariant = Color(0xFF49454F);
  
  static const Color darkInverseSurface = Color(0xFFE6E0E9);
  static const Color darkOnInverseSurface = Color(0xFF313033);
  static const Color darkInversePrimary = Color(0xFF6750A4);
}

/// Color variants for different emphasis levels
class AuiColorVariants {
  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }
  
  /// Get lighter shade of color
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
  
  /// Get darker shade of color
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
  
  /// Get color with different saturation
  static Color withSaturation(Color color, double saturation) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withSaturation(saturation.clamp(0.0, 1.0)).toColor();
  }
  
  /// Get color with different hue
  static Color withHue(Color color, double hue) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withHue(hue % 360).toColor();
  }
}

/// Semantic color roles for consistent theming
class AuiColorRoles {
  const AuiColorRoles._();
  
  // Primary role colors
  static const Color primary = AuiColors.primary;
  static const Color onPrimary = AuiColors.onPrimary;
  static const Color primaryContainer = AuiColors.primaryContainer;
  static const Color onPrimaryContainer = AuiColors.onPrimaryContainer;
  
  // Secondary role colors
  static const Color secondary = AuiColors.secondary;
  static const Color onSecondary = AuiColors.onSecondary;
  static const Color secondaryContainer = AuiColors.secondaryContainer;
  static const Color onSecondaryContainer = AuiColors.onSecondaryContainer;
  
  // Tertiary role colors
  static const Color tertiary = AuiColors.tertiary;
  static const Color onTertiary = AuiColors.onTertiary;
  static const Color tertiaryContainer = AuiColors.tertiaryContainer;
  static const Color onTertiaryContainer = AuiColors.onTertiaryContainer;
  
  // Error role colors
  static const Color error = AuiColors.error;
  static const Color onError = AuiColors.onError;
  static const Color errorContainer = AuiColors.errorContainer;
  static const Color onErrorContainer = AuiColors.onErrorContainer;
  
  // Success role colors
  static const Color success = AuiColors.success;
  static const Color onSuccess = AuiColors.onSuccess;
  static const Color successContainer = AuiColors.successContainer;
  static const Color onSuccessContainer = AuiColors.onSuccessContainer;
  
  // Warning role colors
  static const Color warning = AuiColors.warning;
  static const Color onWarning = AuiColors.onWarning;
  static const Color warningContainer = AuiColors.warningContainer;
  static const Color onWarningContainer = AuiColors.onWarningContainer;
  
  // Info role colors
  static const Color info = AuiColors.info;
  static const Color onInfo = AuiColors.onInfo;
  static const Color infoContainer = AuiColors.infoContainer;
  static const Color onInfoContainer = AuiColors.onInfoContainer;
  
  // Surface role colors
  static const Color surface = AuiColors.surface;
  static const Color onSurface = AuiColors.onSurface;
  static const Color surfaceVariant = AuiColors.surfaceVariant;
  static const Color onSurfaceVariant = AuiColors.onSurfaceVariant;
  
  // Background role colors
  static const Color background = AuiColors.background;
  static const Color onBackground = AuiColors.onBackground;
  
  // Outline role colors
  static const Color outline = AuiColors.outline;
  static const Color outlineVariant = AuiColors.outlineVariant;
}
