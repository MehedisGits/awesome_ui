import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';
import '../tokens/spacing.dart';
import '../tokens/radius.dart';
import '../tokens/elevation.dart';

/// Light theme configuration for the Awesome UI component library.
/// 
/// Provides a complete Material 3 light theme with custom design tokens
/// and brand-specific color schemes.
class AppLightTheme {
  const AppLightTheme._();

  /// Default light theme
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.light.toColorScheme(),
    textTheme: _textTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    filledButtonTheme: _filledButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    cardTheme: _cardTheme.data,
    chipTheme: _chipTheme,
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    navigationBarTheme: _navigationBarTheme,
    drawerTheme: _drawerTheme,
    bottomSheetTheme: _bottomSheetTheme,
    dialogTheme: _dialogTheme.data,
    snackBarTheme: _snackBarTheme,
    tooltipTheme: _tooltipTheme,
    dividerTheme: _dividerTheme,
    listTileTheme: _listTileTheme,
    switchTheme: _switchTheme,
    checkboxTheme: _checkboxTheme,
    radioTheme: _radioTheme,
    sliderTheme: _sliderTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
    tabBarTheme: _tabBarTheme.data,
    badgeTheme: _badgeTheme,
    segmentedButtonTheme: _segmentedButtonTheme,
  );

  /// Text theme
  static TextTheme get _textTheme => const TextTheme(
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

  /// Elevated button theme
  static ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(AppSpacing.buttonPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      elevation: AppElevation.button,
      textStyle: AppTypography.buttonLarge,
    ),
  );

  /// Outlined button theme
  static OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.all(AppSpacing.buttonPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      textStyle: AppTypography.buttonLarge,
    ),
  );

  /// Text button theme
  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.all(AppSpacing.buttonPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      textStyle: AppTypography.buttonLarge,
    ),
  );

  /// Filled button theme
  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: EdgeInsets.all(AppSpacing.buttonPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      textStyle: AppTypography.buttonLarge,
    ),
  );

  /// Input decoration theme
  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.light.surfaceVariant,
    contentPadding: EdgeInsets.all(AppSpacing.inputPadding),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.light.outline),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.light.outline),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.light.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.light.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.light.error, width: 2),
    ),
    labelStyle: AppTypography.bodyMedium,
    hintStyle: AppTypography.bodyMedium.copyWith(
      color: AppColors.light.onSurfaceVariant,
    ),
    errorStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.light.error,
    ),
  );

  /// Card theme
  static CardTheme get _cardTheme => CardTheme(
    elevation: AppElevation.card,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
    ),
    margin: AppSpacing.paddingSmall,
  );

  /// Chip theme
  static ChipThemeData get _chipTheme => ChipThemeData(
    padding: AppSpacing.paddingSmall,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.chip),
    ),
    labelStyle: AppTypography.labelMedium,
  );

  /// App bar theme
  static AppBarTheme get _appBarTheme => AppBarTheme(
    elevation: AppElevation.appBar,
    centerTitle: true,
    titleTextStyle: AppTypography.titleLarge,
    toolbarTextStyle: AppTypography.bodyMedium,
  );

  /// Bottom navigation bar theme
  static BottomNavigationBarThemeData get _bottomNavigationBarTheme => BottomNavigationBarThemeData(
    elevation: AppElevation.level2,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.light.primary,
    unselectedItemColor: AppColors.light.onSurfaceVariant,
    selectedLabelStyle: AppTypography.labelSmall,
    unselectedLabelStyle: AppTypography.labelSmall,
  );

  /// Navigation bar theme
  static NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
    elevation: AppElevation.level2,
    height: 80,
    labelTextStyle: WidgetStateProperty.all(AppTypography.labelSmall),
  );

  /// Drawer theme
  static DrawerThemeData get _drawerTheme => DrawerThemeData(
    elevation: AppElevation.drawer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(AppRadius.lg),
        bottomRight: Radius.circular(AppRadius.lg),
      ),
    ),
  );

  /// Bottom sheet theme
  static BottomSheetThemeData get _bottomSheetTheme => BottomSheetThemeData(
    elevation: AppElevation.bottomSheet,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.bottomSheetRadius,
    ),
    clipBehavior: Clip.antiAlias,
  );

  /// Dialog theme
  static DialogTheme get _dialogTheme => DialogTheme(
    elevation: AppElevation.dialog,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.dialogRadius,
    ),
    titleTextStyle: AppTypography.headlineSmall,
    contentTextStyle: AppTypography.bodyMedium,
  );

  /// Snack bar theme
  static SnackBarThemeData get _snackBarTheme => SnackBarThemeData(
    elevation: AppElevation.level3,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.smRadius,
    ),
    behavior: SnackBarBehavior.floating,
    contentTextStyle: AppTypography.bodyMedium.copyWith(
      color: AppColors.light.onError,
    ),
  );

  /// Tooltip theme
  static TooltipThemeData get _tooltipTheme => TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.light.inverseSurface,
      borderRadius: AppRadius.tooltipRadius,
    ),
    textStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.light.onInverseSurface,
    ),
    padding: AppSpacing.paddingSmall,
  );

  /// Divider theme
  static DividerThemeData get _dividerTheme => DividerThemeData(
    color: AppColors.light.outlineVariant,
    thickness: 1,
    space: 1,
  );

  /// List tile theme
  static ListTileThemeData get _listTileTheme => ListTileThemeData(
    contentPadding: AppSpacing.paddingMedium,
    titleTextStyle: AppTypography.bodyLarge,
    subtitleTextStyle: AppTypography.bodyMedium,
    leadingAndTrailingTextStyle: AppTypography.bodyMedium,
  );

  /// Switch theme
  static SwitchThemeData get _switchTheme => SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.light.onPrimary;
      }
      return AppColors.light.outline;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.light.primary;
      }
      return AppColors.light.surfaceVariant;
    }),
  );

  /// Checkbox theme
  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.light.primary;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(AppColors.light.onPrimary),
    side: BorderSide(color: AppColors.light.outline),
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.xsRadius,
    ),
  );

  /// Radio theme
  static RadioThemeData get _radioTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.light.primary;
      }
      return AppColors.light.outline;
    }),
  );

  /// Slider theme
  static SliderThemeData get _sliderTheme => SliderThemeData(
    activeTrackColor: AppColors.light.primary,
    inactiveTrackColor: AppColors.light.surfaceVariant,
    thumbColor: AppColors.light.primary,
    overlayColor: AppColors.light.primary.withOpacity(0.12),
    valueIndicatorColor: AppColors.light.inverseSurface,
    valueIndicatorTextStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.light.onInverseSurface,
    ),
  );

  /// Progress indicator theme
  static ProgressIndicatorThemeData get _progressIndicatorTheme => ProgressIndicatorThemeData(
    color: AppColors.light.primary,
    linearTrackColor: AppColors.light.surfaceVariant,
    circularTrackColor: AppColors.light.surfaceVariant,
  );

  /// Tab bar theme
  static TabBarTheme get _tabBarTheme => TabBarTheme(
    labelColor: AppColors.light.primary,
    unselectedLabelColor: AppColors.light.onSurfaceVariant,
    labelStyle: AppTypography.labelMedium,
    unselectedLabelStyle: AppTypography.labelMedium,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.light.primary, width: 2),
    ),
  );

  /// Badge theme
  static BadgeThemeData get _badgeTheme => BadgeThemeData(
    backgroundColor: AppColors.light.error,
    textColor: AppColors.light.onError,
    textStyle: AppTypography.labelSmall,
    padding: AppSpacing.paddingMicro,
  );

  /// Segmented button theme
  static SegmentedButtonThemeData get _segmentedButtonTheme => SegmentedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(AppSpacing.buttonPadding)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    ),
  );
}
