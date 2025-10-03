import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import '../adapters/platform_style.dart';
import '../adapters/material_adapter.dart';
import '../adapters/cupertino_adapter.dart';
import '../adapters/web_adapter.dart';

/// App style scope for managing platform-specific theming.
/// 
/// Provides a unified interface for accessing platform-specific
/// styles and themes throughout the application.
class AppStyleScope extends InheritedWidget {
  const AppStyleScope({
    super.key,
    required this.platformStyle,
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.radius,
    required this.elevation,
    required this.motion,
    required super.child,
  });

  final PlatformStyle platformStyle;
  final AppColors colors;
  final AppTypography typography;
  final AppSpacing spacing;
  final AppRadius radius;
  final AppElevation elevation;
  final AppMotion motion;

  /// Get the current app style scope from the context
  static AppStyleScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStyleScope>();
    assert(scope != null, 'AppStyleScope not found in widget tree');
    return scope!;
  }

  /// Get the current app style scope from the context (nullable)
  static AppStyleScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStyleScope>();
  }

  /// Check if the current platform style is Material
  bool get isMaterial => platformStyle == PlatformStyle.material;

  /// Check if the current platform style is Cupertino
  bool get isCupertino => platformStyle == PlatformStyle.cupertino;

  /// Check if the current platform style is Web
  bool get isWeb => platformStyle == PlatformStyle.web;

  /// Check if the current platform style is Adaptive
  bool get isAdaptive => platformStyle == PlatformStyle.adaptive;

  /// Get the resolved platform style
  PlatformStyle get resolvedPlatformStyle {
    if (platformStyle == PlatformStyle.adaptive) {
      return PlatformStyleUtils.getCurrentPlatformStyle();
    }
    return platformStyle;
  }

  /// Get the current theme data
  ThemeData get themeData {
    switch (resolvedPlatformStyle) {
      case PlatformStyle.material:
        return _createMaterialTheme();
      case PlatformStyle.cupertino:
        return _createCupertinoTheme();
      case PlatformStyle.web:
        return _createWebTheme();
      case PlatformStyle.adaptive:
        return _createAdaptiveTheme();
    }
  }

  /// Create Material theme
  ThemeData _createMaterialTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colors.toColorScheme(),
      textTheme: _createTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: MaterialAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: MaterialAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
          isOutlined: true,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: MaterialAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
          isText: true,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: MaterialAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
          isFilled: true,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceVariant,
        contentPadding: const EdgeInsets.all(AppSpacing.inputPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        labelStyle: AppTypography.bodyMedium,
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: colors.onSurfaceVariant,
        ),
        errorStyle: AppTypography.bodySmall.copyWith(
          color: colors.error,
        ),
      ),
      cardTheme: MaterialAdapter.createCardTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        elevation: elevation,
      ) as CardThemeData?,
      chipTheme: MaterialAdapter.createChipTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
      ),
      appBarTheme: MaterialAdapter.createAppBarTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      bottomNavigationBarTheme: MaterialAdapter.createBottomNavigationBarTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      navigationBarTheme: MaterialAdapter.createNavigationBarTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      drawerTheme: MaterialAdapter.createDrawerTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      bottomSheetTheme: MaterialAdapter.createBottomSheetTheme(
        colors: colors,
        radius: radius,
        elevation: elevation,
      ),
      dialogTheme: MaterialAdapter.createDialogTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
        elevation: elevation,
      ) as DialogThemeData?,
      snackBarTheme: MaterialAdapter.createSnackBarTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
        elevation: elevation,
      ),
      tooltipTheme: MaterialAdapter.createTooltipTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
      ),
      switchTheme: MaterialAdapter.createSwitchTheme(colors: colors),
      checkboxTheme: MaterialAdapter.createCheckboxTheme(
        colors: colors,
        radius: radius,
      ),
      radioTheme: MaterialAdapter.createRadioTheme(colors: colors),
    );
  }

  /// Create Cupertino theme
  ThemeData _createCupertinoTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colors.toColorScheme(),
      textTheme: _createTextTheme(),
      // Cupertino-specific theming would go here
      // For now, we'll use Material theme as base
    );
  }

  /// Create Web theme
  ThemeData _createWebTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colors.toColorScheme(),
      textTheme: _createTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: WebAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: WebAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
          isOutlined: true,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: WebAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
          isText: true,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: WebAdapter.createButtonStyle(
          colors: colors,
          spacing: spacing,
          radius: radius,
          typography: typography,
          elevation: elevation,
          isFilled: true,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceVariant,
        contentPadding: const EdgeInsets.all(AppSpacing.inputPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        labelStyle: AppTypography.bodyMedium,
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: colors.onSurfaceVariant,
        ),
        errorStyle: AppTypography.bodySmall.copyWith(
          color: colors.error,
        ),
      ),
      cardTheme: WebAdapter.createCardTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        elevation: elevation,
      ) as CardThemeData?,
      chipTheme: WebAdapter.createChipTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
      ),
      appBarTheme: WebAdapter.createAppBarTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      bottomNavigationBarTheme: WebAdapter.createBottomNavigationBarTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      navigationBarTheme: WebAdapter.createNavigationBarTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      drawerTheme: WebAdapter.createDrawerTheme(
        colors: colors,
        typography: typography,
        elevation: elevation,
      ),
      bottomSheetTheme: WebAdapter.createBottomSheetTheme(
        colors: colors,
        radius: radius,
        elevation: elevation,
      ),
      dialogTheme: WebAdapter.createDialogTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
        elevation: elevation,
      ) as DialogThemeData?,
      snackBarTheme: WebAdapter.createSnackBarTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
        elevation: elevation,
      ),
      tooltipTheme: WebAdapter.createTooltipTheme(
        colors: colors,
        spacing: spacing,
        radius: radius,
        typography: typography,
      ),
      switchTheme: WebAdapter.createSwitchTheme(colors: colors),
      checkboxTheme: WebAdapter.createCheckboxTheme(
        colors: colors,
        radius: radius,
      ),
      radioTheme: WebAdapter.createRadioTheme(colors: colors),
    );
  }

  /// Create Adaptive theme
  ThemeData _createAdaptiveTheme() {
    final currentStyle = PlatformStyleUtils.getCurrentPlatformStyle();
    switch (currentStyle) {
      case PlatformStyle.material:
        return _createMaterialTheme();
      case PlatformStyle.cupertino:
        return _createCupertinoTheme();
      case PlatformStyle.web:
        return _createWebTheme();
      case PlatformStyle.adaptive:
        return _createMaterialTheme(); // Fallback
    }
  }

  /// Create text theme
  TextTheme _createTextTheme() {
    return const TextTheme(
      displayLarge: AppTypography.displayLarge,
      displayMedium: AppTypography.displayMedium,
      displaySmall: AppTypography.displaySmall,
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      headlineSmall: AppTypography.headlineSmall,
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      titleSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge,
      labelMedium: AppTypography.labelMedium,
      labelSmall: AppTypography.labelSmall,
    );
  }

  @override
  bool updateShouldNotify(AppStyleScope oldWidget) {
    return platformStyle != oldWidget.platformStyle ||
           colors != oldWidget.colors ||
           typography != oldWidget.typography ||
           spacing != oldWidget.spacing ||
           radius != oldWidget.radius ||
           elevation != oldWidget.elevation ||
           motion != oldWidget.motion;
  }
}

/// App style scope builder for creating themed widgets
class AppStyleScopeBuilder extends StatelessWidget {
  const AppStyleScopeBuilder({
    super.key,
    required this.platformStyle,
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.radius,
    required this.elevation,
    required this.motion,
    required this.builder,
  });

  final PlatformStyle platformStyle;
  final AppColors colors;
  final AppTypography typography;
  final AppSpacing spacing;
  final AppRadius radius;
  final AppElevation elevation;
  final AppMotion motion;
  final Widget Function(BuildContext context, AppStyleScope scope) builder;

  @override
  Widget build(BuildContext context) {
    return AppStyleScope(
      platformStyle: platformStyle,
      colors: colors,
      typography: typography,
      spacing: spacing,
      radius: radius,
      elevation: elevation,
      motion: motion,
      child: Builder(
        builder: (context) => builder(context, AppStyleScope.of(context)),
      ),
    );
  }
}
