import 'package:flutter/material.dart';

/// Shadow configuration class
class ShadowConfig {
  final Color? color;
  final Offset? offset;
  final double? blurRadius;
  final double? spreadRadius;

  const ShadowConfig({
    this.color,
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });
}

/// Design tokens for elevation and shadows.
/// 
/// Provides consistent elevation tokens that work across different
/// components and platforms, following Material 3 elevation system.
class AppElevation {
  const AppElevation._();

  /// Create a standard elevation instance
  factory AppElevation.standard() => const AppElevation._();

  /// Elevation levels (Material 3)
  static const double level0 = 0.0;
  static const double level1 = 1.0;
  static const double level2 = 3.0;
  static const double level3 = 6.0;
  static const double level4 = 8.0;
  static const double level5 = 12.0;

  /// Semantic elevation tokens
  static const double none = level0;
  static const double micro = level1;
  static const double tiny = level1;
  static const double small = level2;
  static const double medium = level3;
  static const double large = level4;
  static const double huge = level5;

  /// Component-specific elevation
  static const double button = level1;
  static const double card = level2;
  static const double input = level1;
  static const double modal = level5;
  static const double chip = level1;
  static const double appBar = level2;
  static const double dialog = level5;
  static const double pressedElevation = level2;
  static const double hoverElevation = level1;
  static const double badge = level2;
  static const double tooltip = level3;
  static const double bottomSheet = level4;
  static const double drawer = level4;
  static const double fab = level3;

  /// Shadow colors
  static const Color shadowColor = Color(0xFF000000);
  static const Color shadowColorLight = Color(0x1A000000);
  static const Color shadowColorMedium = Color(0x33000000);
  static const Color shadowColorDark = Color(0x4D000000);

  /// Shadow definitions for each elevation level
  static const List<BoxShadow> level0Shadow = [];
  static const List<BoxShadow> level1Shadow = [
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];
  static const List<BoxShadow> level2Shadow = [
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 1),
      blurRadius: 1,
      spreadRadius: 0,
    ),
  ];
  static const List<BoxShadow> level3Shadow = [
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
    ),
  ];
  static const List<BoxShadow> level4Shadow = [
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 2),
      blurRadius: 1,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 1),
      blurRadius: 1,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
    ),
  ];
  static const List<BoxShadow> level5Shadow = [
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 1),
      blurRadius: 1,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
    ),
    BoxShadow(
      color: shadowColorLight,
      offset: Offset(0, 2),
      blurRadius: 1,
      spreadRadius: 0,
    ),
  ];

  /// Get shadow for elevation level
  static List<BoxShadow> getShadow(double elevation) {
    if (elevation <= level0) return level0Shadow;
    if (elevation <= level1) return level1Shadow;
    if (elevation <= level2) return level2Shadow;
    if (elevation <= level3) return level3Shadow;
    if (elevation <= level4) return level4Shadow;
    return level5Shadow;
  }

  /// Component-specific shadows
  static const List<BoxShadow> buttonShadow = level1Shadow;
  static const List<BoxShadow> cardShadow = level2Shadow;
  static const List<BoxShadow> inputShadow = level1Shadow;
  static const List<BoxShadow> modalShadow = level5Shadow;
  static const List<BoxShadow> chipShadow = level1Shadow;
  static const List<BoxShadow> badgeShadow = level2Shadow;
  static const List<BoxShadow> tooltipShadow = level3Shadow;
  static const List<BoxShadow> bottomSheetShadow = level4Shadow;
  static const List<BoxShadow> dialogShadow = level5Shadow;
  static const List<BoxShadow> appBarShadow = level2Shadow;
  static const List<BoxShadow> drawerShadow = level4Shadow;
  static const List<BoxShadow> fabShadow = level3Shadow;

  /// Custom shadow creation
  static List<BoxShadow> createShadow({
    required double elevation,
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    if (elevation <= 0) return [];
    
    return [
      BoxShadow(
        color: color ?? shadowColorLight,
        offset: offset ?? Offset(0, elevation / 2),
        blurRadius: blurRadius ?? elevation * 2,
        spreadRadius: spreadRadius ?? 0,
      ),
    ];
  }

  /// Multiple shadow creation
  static List<BoxShadow> createMultipleShadows({
    required List<ShadowConfig> shadows,
  }) {
    return shadows.map((config) => BoxShadow(
      color: config.color ?? shadowColorLight,
      offset: config.offset ?? Offset.zero,
      blurRadius: config.blurRadius ?? 0,
      spreadRadius: config.spreadRadius ?? 0,
    )).toList();
  }

  /// Get shadow for component elevation
  static List<BoxShadow> getComponentShadow(String component) {
    switch (component) {
      case 'card':
        return getShadow(card);
      case 'button':
        return getShadow(button);
      case 'dialog':
        return getShadow(dialog);
      case 'appBar':
        return getShadow(appBar);
      default:
        return getShadow(level2);
    }
  }


  /// Responsive elevation multipliers
  static const Map<String, double> breakpointMultipliers = {
    'mobile': 1.0,
    'tablet': 1.125,
    'desktop': 1.25,
    'largeDesktop': 1.375,
  };

  /// Get responsive elevation
  static double getResponsiveElevation(double baseElevation, String breakpoint) {
    final multiplier = breakpointMultipliers[breakpoint] ?? 1.0;
    return baseElevation * multiplier;
  }

  /// Get responsive shadow
  static List<BoxShadow> getResponsiveShadow(double baseElevation, String breakpoint) {
    final responsiveElevation = getResponsiveElevation(baseElevation, breakpoint);
    return getShadow(responsiveElevation);
  }

  /// Surface tint colors for Material 3
  static const Color surfaceTint = Color(0xFF6750A4);
  static const Color surfaceTintLight = Color(0xFFEADDFF);
  static const Color surfaceTintDark = Color(0xFF4F378B);

  /// Get surface tint color based on elevation
  static Color getSurfaceTintColor(double elevation, {bool isDark = false}) {
    if (elevation <= level0) return Colors.transparent;
    if (elevation <= level2) return isDark ? surfaceTintDark : surfaceTintLight;
    return isDark ? surfaceTint : surfaceTint;
  }

  /// Focus ring elevation
  static const double focusRingElevation = level1;
  static const List<BoxShadow> focusRingShadow = [
    BoxShadow(
      color: Color(0x80000000),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 2,
    ),
  ];

  /// Hover elevation
  static const List<BoxShadow> hoverShadow = level2Shadow;

  /// Pressed elevation
  static const List<BoxShadow> pressedShadow = level1Shadow;

  /// Disabled elevation
  static const double disabledElevation = level0;
  static const List<BoxShadow> disabledShadow = level0Shadow;
}
