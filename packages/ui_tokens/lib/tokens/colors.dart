import 'package:flutter/material.dart';

/// Design token for colors following Material 3 color system.
/// 
/// Provides semantic color tokens that work across both Material 3 and Cupertino
/// design systems, with support for light/dark themes and brand variants.
class AppColors {
  const AppColors._({
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
    required this.surfaceContainer,
    required this.surfaceContainerHighest,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.surfaceTint,
  });

  // Primary colors
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  // Secondary colors
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;

  // Tertiary colors
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;

  // Error colors
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;

  // Success colors
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  // Warning colors
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  // Info colors
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;

  // Surface colors
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color surfaceContainer;
  final Color surfaceContainerHighest;

  // Outline colors
  final Color outline;
  final Color outlineVariant;

  // Shadow and scrim
  final Color shadow;
  final Color scrim;

  // Inverse colors
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;

  // Surface tint
  final Color surfaceTint;

  /// Light theme colors
  static const AppColors light = AppColors._(
    // Primary
    primary: Color(0xFF6750A4),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEADDFF),
    onPrimaryContainer: Color(0xFF21005D),
    
    // Secondary
    secondary: Color(0xFF625B71),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE8DEF8),
    onSecondaryContainer: Color(0xFF1D192B),
    
    // Tertiary
    tertiary: Color(0xFF7D5260),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD8E4),
    onTertiaryContainer: Color(0xFF31111D),
    
    // Error
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    
    // Success
    success: Color(0xFF2E7D32),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFFC8E6C9),
    onSuccessContainer: Color(0xFF1B5E20),
    
    // Warning
    warning: Color(0xFFF57C00),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFFFFE0B2),
    onWarningContainer: Color(0xFFE65100),
    
    // Info
    info: Color(0xFF1976D2),
    onInfo: Color(0xFFFFFFFF),
    infoContainer: Color(0xFFBBDEFB),
    onInfoContainer: Color(0xFF0D47A1),
    
    // Surface
    surface: Color(0xFFFFFBFE),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    surfaceContainer: Color(0xFFF3EDF7),
    surfaceContainerHighest: Color(0xFFE6E0E9),
    
    // Outline
    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFCAC4D0),
    
    // Shadow and scrim
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    
    // Inverse
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFD0BCFF),
    
    // Surface tint
    surfaceTint: Color(0xFF6750A4),
  );

  /// Dark theme colors
  static const AppColors dark = AppColors._(
    // Primary
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    
    // Secondary
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    onSecondaryContainer: Color(0xFFE8DEF8),
    
    // Tertiary
    tertiary: Color(0xFFEFB8C8),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD8E4),
    
    // Error
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    
    // Success
    success: Color(0xFFA5D6A7),
    onSuccess: Color(0xFF1B5E20),
    successContainer: Color(0xFF388E3C),
    onSuccessContainer: Color(0xFFC8E6C9),
    
    // Warning
    warning: Color(0xFFFFB74D),
    onWarning: Color(0xFFE65100),
    warningContainer: Color(0xFFFF8F00),
    onWarningContainer: Color(0xFFFFE0B2),
    
    // Info
    info: Color(0xFF90CAF9),
    onInfo: Color(0xFF0D47A1),
    infoContainer: Color(0xFF1565C0),
    onInfoContainer: Color(0xFFBBDEFB),
    
    // Surface
    surface: Color(0xFF1C1B1F),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    surfaceContainer: Color(0xFF211F26),
    surfaceContainerHighest: Color(0xFF2B2930),
    
    // Outline
    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454F),
    
    // Shadow and scrim
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    
    // Inverse
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF6750A4),
    
    // Surface tint
    surfaceTint: Color(0xFFD0BCFF),
  );

  /// High contrast colors for accessibility
  static const AppColors highContrast = AppColors._(
    // Primary
    primary: Color(0xFF000000),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF000000),
    onPrimaryContainer: Color(0xFFFFFFFF),
    
    // Secondary
    secondary: Color(0xFF000000),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF000000),
    onSecondaryContainer: Color(0xFFFFFFFF),
    
    // Tertiary
    tertiary: Color(0xFF000000),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF000000),
    onTertiaryContainer: Color(0xFFFFFFFF),
    
    // Error
    error: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFF000000),
    onErrorContainer: Color(0xFFFFFFFF),
    
    // Success
    success: Color(0xFF000000),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFF000000),
    onSuccessContainer: Color(0xFFFFFFFF),
    
    // Warning
    warning: Color(0xFF000000),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFF000000),
    onWarningContainer: Color(0xFFFFFFFF),
    
    // Info
    info: Color(0xFF000000),
    onInfo: Color(0xFFFFFFFF),
    infoContainer: Color(0xFF000000),
    onInfoContainer: Color(0xFFFFFFFF),
    
    // Surface
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    surfaceVariant: Color(0xFFFFFFFF),
    onSurfaceVariant: Color(0xFF000000),
    surfaceContainer: Color(0xFFF8F8F8),
    surfaceContainerHighest: Color(0xFFF0F0F0),
    
    // Outline
    outline: Color(0xFF000000),
    outlineVariant: Color(0xFF000000),
    
    // Shadow and scrim
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    
    // Inverse
    inverseSurface: Color(0xFF000000),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF000000),
    
    // Surface tint
    surfaceTint: Color(0xFF000000),
  );

  /// State layer colors for Material 3
  Color get primaryStateLayer => primary.withOpacity(0.12);
  Color get onPrimaryStateLayer => onPrimary.withOpacity(0.12);
  Color get secondaryStateLayer => secondary.withOpacity(0.12);
  Color get onSecondaryStateLayer => onSecondary.withOpacity(0.12);
  Color get tertiaryStateLayer => tertiary.withOpacity(0.12);
  Color get onTertiaryStateLayer => onTertiary.withOpacity(0.12);
  Color get errorStateLayer => error.withOpacity(0.12);
  Color get onErrorStateLayer => onError.withOpacity(0.12);
  Color get successStateLayer => success.withOpacity(0.12);
  Color get onSuccessStateLayer => onSuccess.withOpacity(0.12);
  Color get warningStateLayer => warning.withOpacity(0.12);
  Color get onWarningStateLayer => onWarning.withOpacity(0.12);
  Color get infoStateLayer => info.withOpacity(0.12);
  Color get onInfoStateLayer => onInfo.withOpacity(0.12);
  Color get surfaceStateLayer => surface.withOpacity(0.12);
  Color get onSurfaceStateLayer => onSurface.withOpacity(0.12);

  /// Focus ring colors
  Color get focusRing => primary.withOpacity(0.5);
  Color get focusRingError => error.withOpacity(0.5);
  Color get focusRingSuccess => success.withOpacity(0.5);
  Color get focusRingWarning => warning.withOpacity(0.5);
  Color get focusRingInfo => info.withOpacity(0.5);

  /// Convert to Material 3 ColorScheme
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: surface.computeLuminance() > 0.5 ? Brightness.light : Brightness.dark,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      surfaceContainer: surfaceContainer,
      surfaceContainerHighest: surfaceContainerHighest,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: inversePrimary,
      surfaceTint: surfaceTint,
    );
  }

  /// Create a copy of this AppColors with the given fields replaced with new values
  AppColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? surfaceContainer,
    Color? surfaceContainerHighest,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
  }) {
    return AppColors._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHighest: surfaceContainerHighest ?? this.surfaceContainerHighest,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      onInverseSurface: onInverseSurface ?? this.onInverseSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      surfaceTint: surfaceTint ?? this.surfaceTint,
    );
  }

  /// Convert to Cupertino color scheme
  Map<String, Color> toCupertinoColors() {
    return {
      'primary': primary,
      'primaryContainer': primaryContainer,
      'secondary': secondary,
      'secondaryContainer': secondaryContainer,
      'tertiary': tertiary,
      'tertiaryContainer': tertiaryContainer,
      'error': error,
      'errorContainer': errorContainer,
      'success': success,
      'successContainer': successContainer,
      'warning': warning,
      'warningContainer': warningContainer,
      'info': info,
      'infoContainer': infoContainer,
      'surface': surface,
      'surfaceVariant': surfaceVariant,
      'outline': outline,
      'outlineVariant': outlineVariant,
    };
  }
}
