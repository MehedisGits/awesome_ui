import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';
import 'spacing.dart';
import 'elevation.dart';
import 'motion.dart';

/// Main theme system for awesome_ui
/// 
/// Provides a comprehensive theme that combines all foundation systems
/// with support for light/dark modes and brand customization.
class AuiThemeData {
  const AuiThemeData({
    required this.brightness,
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.elevation,
    required this.motion,
    this.brandColors,
    this.customColors,
  });
  
  final Brightness brightness;
  final AuiColorScheme colors;
  final AuiTypographyScheme typography;
  final AuiSpacingScheme spacing;
  final AuiElevationScheme elevation;
  final AuiMotionScheme motion;
  final AuiBrandColors? brandColors;
  final Map<String, Color>? customColors;
  
  /// Create light theme
  factory AuiThemeData.light({
    AuiBrandColors? brandColors,
    Map<String, Color>? customColors,
  }) {
    return AuiThemeData(
      brightness: Brightness.light,
      colors: AuiColorScheme.light(brandColors: brandColors),
      typography: AuiTypographyScheme.light(),
      spacing: AuiSpacingScheme.standard(),
      elevation: AuiElevationScheme.light(),
      motion: AuiMotionScheme.standard(),
      brandColors: brandColors,
      customColors: customColors,
    );
  }
  
  /// Create dark theme
  factory AuiThemeData.dark({
    AuiBrandColors? brandColors,
    Map<String, Color>? customColors,
  }) {
    return AuiThemeData(
      brightness: Brightness.dark,
      colors: AuiColorScheme.dark(brandColors: brandColors),
      typography: AuiTypographyScheme.dark(),
      spacing: AuiSpacingScheme.standard(),
      elevation: AuiElevationScheme.dark(),
      motion: AuiMotionScheme.standard(),
      brandColors: brandColors,
      customColors: customColors,
    );
  }
  
  /// Create theme with brand colors
  factory AuiThemeData.brand({
    required AuiBrandColors brandColors,
    required Brightness brightness,
    Map<String, Color>? customColors,
  }) {
    return AuiThemeData(
      brightness: brightness,
      colors: AuiColorScheme.brand(brandColors: brandColors, brightness: brightness),
      typography: AuiTypographyScheme.brand(brandColors: brandColors, brightness: brightness),
      spacing: AuiSpacingScheme.standard(),
      elevation: AuiElevationScheme.brand(brandColors: brandColors, brightness: brightness),
      motion: AuiMotionScheme.brand(brandColors: brandColors),
      brandColors: brandColors,
      customColors: customColors,
    );
  }
  
  /// Merge with another theme
  AuiThemeData merge(AuiThemeData? other) {
    if (other == null) return this;
    
    return AuiThemeData(
      brightness: other.brightness,
      colors: colors.merge(other.colors),
      typography: typography.merge(other.typography),
      spacing: spacing.merge(other.spacing),
      elevation: elevation.merge(other.elevation),
      motion: motion.merge(other.motion),
      brandColors: other.brandColors ?? brandColors,
      customColors: {...?customColors, ...?other.customColors},
    );
  }
  
  /// Copy with new values
  AuiThemeData copyWith({
    Brightness? brightness,
    AuiColorScheme? colors,
    AuiTypographyScheme? typography,
    AuiSpacingScheme? spacing,
    AuiElevationScheme? elevation,
    AuiMotionScheme? motion,
    AuiBrandColors? brandColors,
    Map<String, Color>? customColors,
  }) {
    return AuiThemeData(
      brightness: brightness ?? this.brightness,
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      spacing: spacing ?? this.spacing,
      elevation: elevation ?? this.elevation,
      motion: motion ?? this.motion,
      brandColors: brandColors ?? this.brandColors,
      customColors: customColors ?? this.customColors,
    );
  }
  
  /// Get custom color by name
  Color? getCustomColor(String name) {
    return customColors?[name];
  }
  
  /// Check if theme is dark
  bool get isDark => brightness == Brightness.dark;
  
  /// Check if theme is light
  bool get isLight => brightness == Brightness.light;
}

/// Color scheme for awesome_ui
class AuiColorScheme {
  const AuiColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.background,
    required this.onBackground,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
  });
  
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color background;
  final Color onBackground;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;
  
  /// Create light color scheme
  factory AuiColorScheme.light({AuiBrandColors? brandColors}) {
    if (brandColors != null) {
      return AuiColorScheme.brand(brandColors: brandColors, brightness: Brightness.light);
    }
    
    return const AuiColorScheme(
      primary: AuiColors.primary,
      onPrimary: AuiColors.onPrimary,
      primaryContainer: AuiColors.primaryContainer,
      onPrimaryContainer: AuiColors.onPrimaryContainer,
      secondary: AuiColors.secondary,
      onSecondary: AuiColors.onSecondary,
      secondaryContainer: AuiColors.secondaryContainer,
      onSecondaryContainer: AuiColors.onSecondaryContainer,
      tertiary: AuiColors.tertiary,
      onTertiary: AuiColors.onTertiary,
      tertiaryContainer: AuiColors.tertiaryContainer,
      onTertiaryContainer: AuiColors.onTertiaryContainer,
      error: AuiColors.error,
      onError: AuiColors.onError,
      errorContainer: AuiColors.errorContainer,
      onErrorContainer: AuiColors.onErrorContainer,
      success: AuiColors.success,
      onSuccess: AuiColors.onSuccess,
      successContainer: AuiColors.successContainer,
      onSuccessContainer: AuiColors.onSuccessContainer,
      warning: AuiColors.warning,
      onWarning: AuiColors.onWarning,
      warningContainer: AuiColors.warningContainer,
      onWarningContainer: AuiColors.onWarningContainer,
      info: AuiColors.info,
      onInfo: AuiColors.onInfo,
      infoContainer: AuiColors.infoContainer,
      onInfoContainer: AuiColors.onInfoContainer,
      surface: AuiColors.surface,
      onSurface: AuiColors.onSurface,
      surfaceVariant: AuiColors.surfaceVariant,
      onSurfaceVariant: AuiColors.onSurfaceVariant,
      background: AuiColors.background,
      onBackground: AuiColors.onBackground,
      outline: AuiColors.outline,
      outlineVariant: AuiColors.outlineVariant,
      shadow: AuiColors.shadow,
      scrim: AuiColors.scrim,
      inverseSurface: AuiColors.inverseSurface,
      onInverseSurface: AuiColors.onInverseSurface,
      inversePrimary: AuiColors.inversePrimary,
    );
  }
  
  /// Create dark color scheme
  factory AuiColorScheme.dark({AuiBrandColors? brandColors}) {
    if (brandColors != null) {
      return AuiColorScheme.brand(brandColors: brandColors, brightness: Brightness.dark);
    }
    
    return const AuiColorScheme(
      primary: AuiColors.darkPrimary,
      onPrimary: AuiColors.darkOnPrimary,
      primaryContainer: AuiColors.darkPrimaryContainer,
      onPrimaryContainer: AuiColors.darkOnPrimaryContainer,
      secondary: AuiColors.darkSecondary,
      onSecondary: AuiColors.darkOnSecondary,
      secondaryContainer: AuiColors.darkSecondaryContainer,
      onSecondaryContainer: AuiColors.darkOnSecondaryContainer,
      tertiary: AuiColors.darkTertiary,
      onTertiary: AuiColors.darkOnTertiary,
      tertiaryContainer: AuiColors.darkTertiaryContainer,
      onTertiaryContainer: AuiColors.darkOnTertiaryContainer,
      error: AuiColors.darkError,
      onError: AuiColors.darkOnError,
      errorContainer: AuiColors.darkErrorContainer,
      onErrorContainer: AuiColors.darkOnErrorContainer,
      success: AuiColors.darkSuccess,
      onSuccess: AuiColors.darkOnSuccess,
      successContainer: AuiColors.darkSuccessContainer,
      onSuccessContainer: AuiColors.darkOnSuccessContainer,
      warning: AuiColors.darkWarning,
      onWarning: AuiColors.darkOnWarning,
      warningContainer: AuiColors.darkWarningContainer,
      onWarningContainer: AuiColors.darkOnWarningContainer,
      info: AuiColors.darkInfo,
      onInfo: AuiColors.darkOnInfo,
      infoContainer: AuiColors.darkInfoContainer,
      onInfoContainer: AuiColors.darkOnInfoContainer,
      surface: AuiColors.darkSurface,
      onSurface: AuiColors.darkOnSurface,
      surfaceVariant: AuiColors.darkSurfaceVariant,
      onSurfaceVariant: AuiColors.darkOnSurfaceVariant,
      background: AuiColors.darkBackground,
      onBackground: AuiColors.darkOnBackground,
      outline: AuiColors.darkOutline,
      outlineVariant: AuiColors.darkOutlineVariant,
      shadow: AuiColors.shadow,
      scrim: AuiColors.scrim,
      inverseSurface: AuiColors.darkInverseSurface,
      onInverseSurface: AuiColors.darkOnInverseSurface,
      inversePrimary: AuiColors.darkInversePrimary,
    );
  }
  
  /// Create brand color scheme
  factory AuiColorScheme.brand({
    required AuiBrandColors brandColors,
    required Brightness brightness,
  }) {
    // This would implement brand color logic
    // For now, return the appropriate base scheme
    return brightness == Brightness.light 
        ? AuiColorScheme.light(brandColors: brandColors)
        : AuiColorScheme.dark(brandColors: brandColors);
  }
  
  /// Merge with another color scheme
  AuiColorScheme merge(AuiColorScheme? other) {
    if (other == null) return this;
    
    return AuiColorScheme(
      primary: other.primary,
      onPrimary: other.onPrimary,
      primaryContainer: other.primaryContainer,
      onPrimaryContainer: other.onPrimaryContainer,
      secondary: other.secondary,
      onSecondary: other.onSecondary,
      secondaryContainer: other.secondaryContainer,
      onSecondaryContainer: other.onSecondaryContainer,
      tertiary: other.tertiary,
      onTertiary: other.onTertiary,
      tertiaryContainer: other.tertiaryContainer,
      onTertiaryContainer: other.onTertiaryContainer,
      error: other.error,
      onError: other.onError,
      errorContainer: other.errorContainer,
      onErrorContainer: other.onErrorContainer,
      success: other.success,
      onSuccess: other.onSuccess,
      successContainer: other.successContainer,
      onSuccessContainer: other.onSuccessContainer,
      warning: other.warning,
      onWarning: other.onWarning,
      warningContainer: other.warningContainer,
      onWarningContainer: other.onWarningContainer,
      info: other.info,
      onInfo: other.onInfo,
      infoContainer: other.infoContainer,
      onInfoContainer: other.onInfoContainer,
      surface: other.surface,
      onSurface: other.onSurface,
      surfaceVariant: other.surfaceVariant,
      onSurfaceVariant: other.onSurfaceVariant,
      background: other.background,
      onBackground: other.onBackground,
      outline: other.outline,
      outlineVariant: other.outlineVariant,
      shadow: other.shadow,
      scrim: other.scrim,
      inverseSurface: other.inverseSurface,
      onInverseSurface: other.onInverseSurface,
      inversePrimary: other.inversePrimary,
    );
  }
}

/// Typography scheme for awesome_ui
class AuiTypographyScheme {
  const AuiTypographyScheme({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.codeLarge,
    required this.codeMedium,
    required this.codeSmall,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
    required this.caption,
    required this.overline,
  });
  
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle codeLarge;
  final TextStyle codeMedium;
  final TextStyle codeSmall;
  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;
  final TextStyle caption;
  final TextStyle overline;
  
  /// Create light typography scheme
  factory AuiTypographyScheme.light() {
    return const AuiTypographyScheme(
      displayLarge: AuiTypography.displayLarge,
      displayMedium: AuiTypography.displayMedium,
      displaySmall: AuiTypography.displaySmall,
      headlineLarge: AuiTypography.headlineLarge,
      headlineMedium: AuiTypography.headlineMedium,
      headlineSmall: AuiTypography.headlineSmall,
      titleLarge: AuiTypography.titleLarge,
      titleMedium: AuiTypography.titleMedium,
      titleSmall: AuiTypography.titleSmall,
      bodyLarge: AuiTypography.bodyLarge,
      bodyMedium: AuiTypography.bodyMedium,
      bodySmall: AuiTypography.bodySmall,
      labelLarge: AuiTypography.labelLarge,
      labelMedium: AuiTypography.labelMedium,
      labelSmall: AuiTypography.labelSmall,
      codeLarge: AuiTypography.codeLarge,
      codeMedium: AuiTypography.codeMedium,
      codeSmall: AuiTypography.codeSmall,
      buttonLarge: AuiTypography.buttonLarge,
      buttonMedium: AuiTypography.buttonMedium,
      buttonSmall: AuiTypography.buttonSmall,
      caption: AuiTypography.caption,
      overline: AuiTypography.overline,
    );
  }
  
  /// Create dark typography scheme
  factory AuiTypographyScheme.dark() {
    return AuiTypographyScheme.light(); // Typography doesn't change for dark mode
  }
  
  /// Create brand typography scheme
  factory AuiTypographyScheme.brand({
    required AuiBrandColors brandColors,
    required Brightness brightness,
  }) {
    return AuiTypographyScheme.light(); // Typography doesn't change for brand
  }
  
  /// Merge with another typography scheme
  AuiTypographyScheme merge(AuiTypographyScheme? other) {
    if (other == null) return this;
    
    return AuiTypographyScheme(
      displayLarge: other.displayLarge,
      displayMedium: other.displayMedium,
      displaySmall: other.displaySmall,
      headlineLarge: other.headlineLarge,
      headlineMedium: other.headlineMedium,
      headlineSmall: other.headlineSmall,
      titleLarge: other.titleLarge,
      titleMedium: other.titleMedium,
      titleSmall: other.titleSmall,
      bodyLarge: other.bodyLarge,
      bodyMedium: other.bodyMedium,
      bodySmall: other.bodySmall,
      labelLarge: other.labelLarge,
      labelMedium: other.labelMedium,
      labelSmall: other.labelSmall,
      codeLarge: other.codeLarge,
      codeMedium: other.codeMedium,
      codeSmall: other.codeSmall,
      buttonLarge: other.buttonLarge,
      buttonMedium: other.buttonMedium,
      buttonSmall: other.buttonSmall,
      caption: other.caption,
      overline: other.overline,
    );
  }
}

/// Spacing scheme for awesome_ui
class AuiSpacingScheme {
  const AuiSpacingScheme({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.micro,
    required this.nano,
    required this.macro,
    required this.mega,
    required this.giga,
    required this.zero,
    required this.auto,
  });
  
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double xxxl;
  final double micro;
  final double nano;
  final double macro;
  final double mega;
  final double giga;
  final double zero;
  final double auto;
  
  /// Create standard spacing scheme
  factory AuiSpacingScheme.standard() {
    return const AuiSpacingScheme(
      xs: AuiSpacing.xs,
      sm: AuiSpacing.sm,
      md: AuiSpacing.md,
      lg: AuiSpacing.lg,
      xl: AuiSpacing.xl,
      xxl: AuiSpacing.xxl,
      xxxl: AuiSpacing.xxxl,
      micro: AuiSpacing.micro,
      nano: AuiSpacing.nano,
      macro: AuiSpacing.macro,
      mega: AuiSpacing.mega,
      giga: AuiSpacing.giga,
      zero: AuiSpacing.zero,
      auto: AuiSpacing.auto,
    );
  }
  
  /// Merge with another spacing scheme
  AuiSpacingScheme merge(AuiSpacingScheme? other) {
    if (other == null) return this;
    
    return AuiSpacingScheme(
      xs: other.xs,
      sm: other.sm,
      md: other.md,
      lg: other.lg,
      xl: other.xl,
      xxl: other.xxl,
      xxxl: other.xxxl,
      micro: other.micro,
      nano: other.nano,
      macro: other.macro,
      mega: other.mega,
      giga: other.giga,
      zero: other.zero,
      auto: other.auto,
    );
  }
}

/// Elevation scheme for awesome_ui
class AuiElevationScheme {
  const AuiElevationScheme({
    required this.level0,
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
    required this.level5,
    required this.level6,
    required this.level7,
    required this.level8,
    required this.level9,
    required this.level10,
    required this.level11,
    required this.level12,
    required this.level13,
    required this.level14,
    required this.level15,
    required this.level16,
    required this.level17,
    required this.level18,
    required this.level19,
    required this.level20,
    required this.level21,
    required this.level22,
    required this.level23,
    required this.level24,
  });
  
  final double level0;
  final double level1;
  final double level2;
  final double level3;
  final double level4;
  final double level5;
  final double level6;
  final double level7;
  final double level8;
  final double level9;
  final double level10;
  final double level11;
  final double level12;
  final double level13;
  final double level14;
  final double level15;
  final double level16;
  final double level17;
  final double level18;
  final double level19;
  final double level20;
  final double level21;
  final double level22;
  final double level23;
  final double level24;
  
  /// Create light elevation scheme
  factory AuiElevationScheme.light() {
    return const AuiElevationScheme(
      level0: AuiElevation.level0,
      level1: AuiElevation.level1,
      level2: AuiElevation.level2,
      level3: AuiElevation.level3,
      level4: AuiElevation.level4,
      level5: AuiElevation.level5,
      level6: AuiElevation.level6,
      level7: AuiElevation.level7,
      level8: AuiElevation.level8,
      level9: AuiElevation.level9,
      level10: AuiElevation.level10,
      level11: AuiElevation.level11,
      level12: AuiElevation.level12,
      level13: AuiElevation.level13,
      level14: AuiElevation.level14,
      level15: AuiElevation.level15,
      level16: AuiElevation.level16,
      level17: AuiElevation.level17,
      level18: AuiElevation.level18,
      level19: AuiElevation.level19,
      level20: AuiElevation.level20,
      level21: AuiElevation.level21,
      level22: AuiElevation.level22,
      level23: AuiElevation.level23,
      level24: AuiElevation.level24,
    );
  }
  
  /// Create dark elevation scheme
  factory AuiElevationScheme.dark() {
    return AuiElevationScheme.light(); // Elevation doesn't change for dark mode
  }
  
  /// Create brand elevation scheme
  factory AuiElevationScheme.brand({
    required AuiBrandColors brandColors,
    required Brightness brightness,
  }) {
    return AuiElevationScheme.light(); // Elevation doesn't change for brand
  }
  
  /// Merge with another elevation scheme
  AuiElevationScheme merge(AuiElevationScheme? other) {
    if (other == null) return this;
    
    return AuiElevationScheme(
      level0: other.level0,
      level1: other.level1,
      level2: other.level2,
      level3: other.level3,
      level4: other.level4,
      level5: other.level5,
      level6: other.level6,
      level7: other.level7,
      level8: other.level8,
      level9: other.level9,
      level10: other.level10,
      level11: other.level11,
      level12: other.level12,
      level13: other.level13,
      level14: other.level14,
      level15: other.level15,
      level16: other.level16,
      level17: other.level17,
      level18: other.level18,
      level19: other.level19,
      level20: other.level20,
      level21: other.level21,
      level22: other.level22,
      level23: other.level23,
      level24: other.level24,
    );
  }
}

/// Motion scheme for awesome_ui
class AuiMotionScheme {
  const AuiMotionScheme({
    required this.instant,
    required this.fast,
    required this.medium,
    required this.slow,
    required this.slower,
    required this.slowest,
    required this.micro,
    required this.nano,
    required this.macro,
    required this.mega,
    required this.giga,
  });
  
  final Duration instant;
  final Duration fast;
  final Duration medium;
  final Duration slow;
  final Duration slower;
  final Duration slowest;
  final Duration micro;
  final Duration nano;
  final Duration macro;
  final Duration mega;
  final Duration giga;
  
  /// Create standard motion scheme
  factory AuiMotionScheme.standard() {
    return const AuiMotionScheme(
      instant: AuiMotion.instant,
      fast: AuiMotion.fast,
      medium: AuiMotion.medium,
      slow: AuiMotion.slow,
      slower: AuiMotion.slower,
      slowest: AuiMotion.slowest,
      micro: AuiMotion.micro,
      nano: AuiMotion.nano,
      macro: AuiMotion.macro,
      mega: AuiMotion.mega,
      giga: AuiMotion.giga,
    );
  }
  
  /// Create brand motion scheme
  factory AuiMotionScheme.brand({required AuiBrandColors brandColors}) {
    return AuiMotionScheme.standard(); // Motion doesn't change for brand
  }
  
  /// Merge with another motion scheme
  AuiMotionScheme merge(AuiMotionScheme? other) {
    if (other == null) return this;
    
    return AuiMotionScheme(
      instant: other.instant,
      fast: other.fast,
      medium: other.medium,
      slow: other.slow,
      slower: other.slower,
      slowest: other.slowest,
      micro: other.micro,
      nano: other.nano,
      macro: other.macro,
      mega: other.mega,
      giga: other.giga,
    );
  }
}

/// Brand colors definition
class AuiBrandColors {
  const AuiBrandColors({
    required this.primary,
    required this.secondary,
    this.tertiary,
    this.accent,
    this.neutral,
  });
  
  final Color primary;
  final Color secondary;
  final Color? tertiary;
  final Color? accent;
  final Color? neutral;
}

/// Theme InheritedWidget
class AuiTheme extends InheritedWidget {
  const AuiTheme({
    super.key,
    required this.data,
    required super.child,
  });
  
  final AuiThemeData data;
  
  /// Get theme from context
  static AuiThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AuiTheme>();
    assert(theme != null, 'AuiTheme not found in context');
    return theme!.data;
  }
  
  /// Get theme from context (nullable)
  static AuiThemeData? maybeOf(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AuiTheme>();
    return theme?.data;
  }
  
  @override
  bool updateShouldNotify(AuiTheme oldWidget) {
    return data != oldWidget.data;
  }
}

/// Theme extensions for easy access
extension AuiThemeExtension on BuildContext {
  /// Get awesome_ui theme
  AuiThemeData get auiTheme => AuiTheme.of(this);
  
  /// Get awesome_ui colors
  AuiColorScheme get auiColors => auiTheme.colors;
  
  /// Get awesome_ui typography
  AuiTypographyScheme get auiTypography => auiTheme.typography;
  
  /// Get awesome_ui spacing
  AuiSpacingScheme get auiSpacing => auiTheme.spacing;
  
  /// Get awesome_ui elevation
  AuiElevationScheme get auiElevation => auiTheme.elevation;
  
  /// Get awesome_ui motion
  AuiMotionScheme get auiMotion => auiTheme.motion;
  
  /// Get custom color by name
  Color? getCustomColor(String name) => auiTheme.getCustomColor(name);
  
  /// Check if theme is dark
  bool get isDarkTheme => auiTheme.isDark;
  
  /// Check if theme is light
  bool get isLightTheme => auiTheme.isLight;
}
