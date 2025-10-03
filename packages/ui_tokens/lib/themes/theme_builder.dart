import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';
import '../brands/fintech_tokens.dart';
import '../brands/health_tokens.dart';
import '../brands/ecommerce_tokens.dart';

/// Theme builder for the Awesome UI component library.
/// 
/// Provides a unified interface for creating themes with different
/// brand variants and light/dark modes.
class AppThemeBuilder {
  const AppThemeBuilder._();

  /// Brand variants
  static const String defaultBrand = 'default';
  static const String fintechBrand = 'fintech';
  static const String healthBrand = 'health';
  static const String ecommerceBrand = 'ecommerce';

  /// Available brand variants
  static const List<String> availableBrands = [
    defaultBrand,
    fintechBrand,
    healthBrand,
    ecommerceBrand,
  ];

  /// Create theme based on brand and brightness
  static ThemeData createTheme({
    required String brand,
    required Brightness brightness,
  }) {
    switch (brand) {
      case fintechBrand:
        return _createFintechTheme(brightness);
      case healthBrand:
        return _createHealthTheme(brightness);
      case ecommerceBrand:
        return _createEcommerceTheme(brightness);
      case defaultBrand:
      default:
        return _createDefaultTheme(brightness);
    }
  }

  /// Create default theme
  static ThemeData _createDefaultTheme(Brightness brightness) {
    return brightness == Brightness.light
        ? AppLightTheme.theme
        : AppDarkTheme.theme;
  }

  /// Create fintech theme
  static ThemeData _createFintechTheme(Brightness brightness) {
    final baseTheme = brightness == Brightness.light
        ? AppLightTheme.theme
        : AppDarkTheme.theme;
    
    final colors = brightness == Brightness.light
        ? FintechTokens.light
        : FintechTokens.dark;
    
    return baseTheme.copyWith(
      colorScheme: colors.toColorScheme(),
      // Override specific theme properties for fintech
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 2,
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Create health theme
  static ThemeData _createHealthTheme(Brightness brightness) {
    final baseTheme = brightness == Brightness.light
        ? AppLightTheme.theme
        : AppDarkTheme.theme;
    
    final colors = brightness == Brightness.light
        ? HealthTokens.light
        : HealthTokens.dark;
    
    return baseTheme.copyWith(
      colorScheme: colors.toColorScheme(),
      // Override specific theme properties for health
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 2,
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  /// Create ecommerce theme
  static ThemeData _createEcommerceTheme(Brightness brightness) {
    final baseTheme = brightness == Brightness.light
        ? AppLightTheme.theme
        : AppDarkTheme.theme;
    
    final colors = brightness == Brightness.light
        ? EcommerceTokens.light
        : EcommerceTokens.dark;
    
    return baseTheme.copyWith(
      colorScheme: colors.toColorScheme(),
      // Override specific theme properties for ecommerce
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 2,
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  /// Get brand-specific colors
  static Map<String, Color> getBrandColors(String brand, Brightness brightness) {
    switch (brand) {
      case fintechBrand:
        final colors = brightness == Brightness.light
            ? FintechTokens.light
            : FintechTokens.dark;
        return colors.toCupertinoColors();
      case healthBrand:
        final colors = brightness == Brightness.light
            ? HealthTokens.light
            : HealthTokens.dark;
        return colors.toCupertinoColors();
      case ecommerceBrand:
        final colors = brightness == Brightness.light
            ? EcommerceTokens.light
            : EcommerceTokens.dark;
        return colors.toCupertinoColors();
      case defaultBrand:
      default:
        final colors = brightness == Brightness.light
            ? AppLightTheme.theme.colorScheme
            : AppDarkTheme.theme.colorScheme;
        return {
          'primary': colors.primary,
          'secondary': colors.secondary,
          'tertiary': colors.tertiary,
          'error': colors.error,
          'surface': colors.surface,
          'onSurface': colors.onSurface,
        };
    }
  }

  /// Get brand-specific status colors
  static Map<String, Color> getBrandStatusColors(String brand) {
    switch (brand) {
      case fintechBrand:
        return FintechTokens.statusColors;
      case healthBrand:
        return HealthTokens.statusColors;
      case ecommerceBrand:
        return EcommerceTokens.orderStatusColors;
      case defaultBrand:
      default:
        return {
          'success': Colors.green,
          'warning': Colors.orange,
          'error': Colors.red,
          'info': Colors.blue,
        };
    }
  }

  /// Validate brand name
  static bool isValidBrand(String brand) {
    return availableBrands.contains(brand);
  }

  /// Get default brand
  static String getDefaultBrand() => defaultBrand;

  /// Get all available brands
  static List<String> getAvailableBrands() => List.from(availableBrands);
}
