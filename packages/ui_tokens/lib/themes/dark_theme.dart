import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';
import '../tokens/spacing.dart';
import '../tokens/radius.dart';
import '../tokens/elevation.dart';

/// Dark theme configuration for the Awesome UI component library.
/// 
/// Provides a complete Material 3 dark theme with custom design tokens
/// and brand-specific color schemes.
class AppDarkTheme {
  const AppDarkTheme._();

  /// Default dark theme
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.dark.toColorScheme(),
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
    fillColor: AppColors.dark.surfaceVariant,
    contentPadding: EdgeInsets.all(AppSpacing.inputPadding),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.dark.outline),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.dark.outline),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.dark.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.dark.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
      borderSide: BorderSide(color: AppColors.dark.error, width: 2),
    ),
    labelStyle: AppTypography.bodyMedium,
    hintStyle: AppTypography.bodyMedium.copyWith(
      color: AppColors.dark.onSurfaceVariant,
    ),
    errorStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.dark.error,
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
    selectedItemColor: AppColors.dark.primary,
    unselectedItemColor: AppColors.dark.onSurfaceVariant,
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
      color: AppColors.dark.onError,
    ),
  );

  /// Tooltip theme
  static TooltipThemeData get _tooltipTheme => TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.dark.inverseSurface,
      borderRadius: AppRadius.tooltipRadius,
    ),
    textStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.dark.onInverseSurface,
    ),
    padding: AppSpacing.paddingSmall,
  );

  /// Divider theme
  static DividerThemeData get _dividerTheme => DividerThemeData(
    color: AppColors.dark.outlineVariant,
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
        return AppColors.dark.onPrimary;
      }
      return AppColors.dark.outline;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.dark.primary;
      }
      return AppColors.dark.surfaceVariant;
    }),
  );

  /// Checkbox theme
  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.dark.primary;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(AppColors.dark.onPrimary),
    side: BorderSide(color: AppColors.dark.outline),
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.xsRadius,
    ),
  );

  /// Radio theme
  static RadioThemeData get _radioTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.dark.primary;
      }
      return AppColors.dark.outline;
    }),
  );

  /// Slider theme
  static SliderThemeData get _sliderTheme => SliderThemeData(
    activeTrackColor: AppColors.dark.primary,
    inactiveTrackColor: AppColors.dark.surfaceVariant,
    thumbColor: AppColors.dark.primary,
    overlayColor: AppColors.dark.primary.withOpacity(0.12),
    valueIndicatorColor: AppColors.dark.inverseSurface,
    valueIndicatorTextStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.dark.onInverseSurface,
    ),
  );

  /// Progress indicator theme
  static ProgressIndicatorThemeData get _progressIndicatorTheme => ProgressIndicatorThemeData(
    color: AppColors.dark.primary,
    linearTrackColor: AppColors.dark.surfaceVariant,
    circularTrackColor: AppColors.dark.surfaceVariant,
  );

  /// Tab bar theme
  static TabBarTheme get _tabBarTheme => TabBarTheme(
    labelColor: AppColors.dark.primary,
    unselectedLabelColor: AppColors.dark.onSurfaceVariant,
    labelStyle: AppTypography.labelMedium,
    unselectedLabelStyle: AppTypography.labelMedium,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.dark.primary, width: 2),
    ),
  );

  /// Badge theme
  static BadgeThemeData get _badgeTheme => BadgeThemeData(
    backgroundColor: AppColors.dark.error,
    textColor: AppColors.dark.onError,
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
