import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';

/// Material 3 adapter for cross-platform components.
/// 
/// Provides Material 3 specific implementations and styling
/// for components that need to adapt to different platforms.
class MaterialAdapter {
  const MaterialAdapter._();

  /// Create Material 3 button style
  static ButtonStyle createButtonStyle({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppTypography typography,
    required AppElevation elevation,
    bool isPrimary = true,
    bool isOutlined = false,
    bool isText = false,
    bool isFilled = false,
    bool isDestructive = false,
    bool isDisabled = false,
    bool isPressed = false,
    bool isHovered = false,
    bool isFocused = false,
  }) {
    Color backgroundColor;
    Color foregroundColor;
    Color? overlayColor;
    double? elevationValue;

    if (isDestructive) {
      backgroundColor = isOutlined || isText
          ? Colors.transparent
          : colors.error;
      foregroundColor = isOutlined || isText
          ? colors.error
          : colors.onError;
    } else if (isPrimary) {
      backgroundColor = isOutlined || isText
          ? Colors.transparent
          : colors.primary;
      foregroundColor = isOutlined || isText
          ? colors.primary
          : colors.onPrimary;
    } else {
      backgroundColor = isOutlined || isText
          ? Colors.transparent
          : colors.secondary;
      foregroundColor = isOutlined || isText
          ? colors.secondary
          : colors.onSecondary;
    }

    if (isDisabled) {
      backgroundColor = colors.surfaceVariant;
      foregroundColor = colors.onSurfaceVariant;
      elevationValue = 0;
    } else {
      elevationValue = isPressed
          ? AppElevation.pressedElevation
          : isHovered
              ? AppElevation.hoverElevation
              : AppElevation.button;
    }

    if (isFocused) {
      overlayColor = colors.primary.withOpacity(0.12);
    } else if (isHovered) {
      overlayColor = backgroundColor.withOpacity(0.08);
    } else if (isPressed) {
      overlayColor = backgroundColor.withOpacity(0.12);
    }

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(foregroundColor),
      overlayColor: WidgetStateProperty.all(overlayColor),
      elevation: WidgetStateProperty.all(elevationValue),
      padding: WidgetStateProperty.all(const EdgeInsets.all(AppSpacing.buttonPadding)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
      textStyle: WidgetStateProperty.all(AppTypography.buttonLarge),
    );
  }

  /// Create Material 3 input decoration
  static InputDecoration createInputDecoration({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppTypography typography,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isFocused = false,
    bool hasError = false,
    bool isDisabled = false,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: isDisabled
          ? colors.surfaceVariant.withOpacity(0.5)
          : colors.surfaceVariant,
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
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: BorderSide(color: colors.outlineVariant),
      ),
      labelStyle: AppTypography.bodyMedium.copyWith(
        color: hasError ? colors.error : colors.onSurfaceVariant,
      ),
      hintStyle: AppTypography.bodyMedium.copyWith(
        color: colors.onSurfaceVariant,
      ),
      helperStyle: AppTypography.bodySmall.copyWith(
        color: colors.onSurfaceVariant,
      ),
      errorStyle: AppTypography.bodySmall.copyWith(
        color: colors.error,
      ),
    );
  }

  /// Create Material 3 card style
  static CardTheme createCardTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppElevation elevation,
  }) {
    return CardTheme(
      color: colors.surface,
      elevation: AppElevation.card,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.cardRadius,
      ),
      margin: AppSpacing.paddingSmall,
      clipBehavior: Clip.antiAlias,
    );
  }

  /// Create Material 3 chip style
  static ChipThemeData createChipTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppTypography typography,
  }) {
    return ChipThemeData(
      backgroundColor: colors.surfaceVariant,
      selectedColor: colors.primaryContainer,
      disabledColor: colors.surfaceVariant.withOpacity(0.5),
      labelStyle: AppTypography.labelMedium,
      secondaryLabelStyle: AppTypography.labelMedium,
      padding: AppSpacing.paddingSmall,
      labelPadding: AppSpacing.paddingMicro,
      side: BorderSide(color: colors.outline),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.chipRadius,
      ),
    );
  }

  /// Create Material 3 app bar style
  static AppBarTheme createAppBarTheme({
    required AppColors colors,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return AppBarTheme(
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      elevation: AppElevation.appBar,
      centerTitle: true,
      titleTextStyle: AppTypography.titleLarge,
      toolbarTextStyle: AppTypography.bodyMedium,
      iconTheme: IconThemeData(
        color: colors.onSurface,
        size: 24,
      ),
      actionsIconTheme: IconThemeData(
        color: colors.onSurface,
        size: 24,
      ),
    );
  }

  /// Create Material 3 bottom navigation bar style
  static BottomNavigationBarThemeData createBottomNavigationBarTheme({
    required AppColors colors,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: colors.surface,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.onSurfaceVariant,
      type: BottomNavigationBarType.fixed,
      elevation: AppElevation.level2,
      selectedLabelStyle: AppTypography.labelSmall,
      unselectedLabelStyle: AppTypography.labelSmall,
    );
  }

  /// Create Material 3 dialog style
  static DialogTheme createDialogTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return DialogTheme(
      backgroundColor: colors.surface,
      elevation: AppElevation.dialog,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.dialogRadius,
      ),
      titleTextStyle: AppTypography.headlineSmall.copyWith(
        color: colors.onSurface,
      ),
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: colors.onSurface,
      ),
    );
  }

  /// Create Material 3 snack bar style
  static SnackBarThemeData createSnackBarTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return SnackBarThemeData(
      backgroundColor: colors.inverseSurface,
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: colors.onInverseSurface,
      ),
      actionTextColor: colors.primary,
      disabledActionTextColor: colors.onInverseSurface.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.smRadius,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: AppElevation.level3,
      // margin: AppSpacing.paddingMedium, // Removed: 'margin' is not a valid parameter
    );
  }

  /// Create Material 3 tooltip style
  static TooltipThemeData createTooltipTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppTypography typography,
  }) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: colors.inverseSurface,
        borderRadius: AppRadius.tooltipRadius,
      ),
      textStyle: AppTypography.bodySmall.copyWith(
        color: colors.onInverseSurface,
      ),
      padding: AppSpacing.paddingSmall,
      margin: AppSpacing.paddingMicro,
    );
  }

  /// Create Material 3 switch style
  static SwitchThemeData createSwitchTheme({
    required AppColors colors,
  }) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colors.onPrimary;
        }
        return colors.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colors.primary;
        }
        return colors.surfaceVariant;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return colors.primary.withOpacity(0.12);
        }
        return null;
      }),
    );
  }

  /// Create Material 3 checkbox style
  static CheckboxThemeData createCheckboxTheme({
    required AppColors colors,
    required AppRadius radius,
  }) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colors.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(colors.onPrimary),
      side: BorderSide(color: colors.outline),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.xsRadius,
      ),
    );
  }

  /// Create Material 3 radio style
  static RadioThemeData createRadioTheme({
    required AppColors colors,
  }) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colors.primary;
        }
        return colors.outline;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return colors.primary.withOpacity(0.12);
        }
        return null;
      }),
    );
  }

  /// Create Material 3 navigation bar theme
  static NavigationBarThemeData createNavigationBarTheme({
    required AppColors colors,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return NavigationBarThemeData(
      elevation: AppElevation.level2,
      backgroundColor: colors.surface,
      indicatorColor: colors.primaryContainer,
      labelTextStyle: WidgetStateProperty.all(AppTypography.labelSmall),
      iconTheme: WidgetStateProperty.all(IconThemeData(
        color: colors.onSurface,
        size: 24,
      )),
    );
  }

  /// Create Material 3 drawer theme
  static DrawerThemeData createDrawerTheme({
    required AppColors colors,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
      elevation: AppElevation.level2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  /// Create Material 3 bottom sheet theme
  static BottomSheetThemeData createBottomSheetTheme({
    required AppColors colors,
    required AppRadius radius,
    required AppElevation elevation,
  }) {
    return BottomSheetThemeData(
      backgroundColor: colors.surface,
      elevation: AppElevation.level2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.lg),
        ),
      ),
    );
  }
}
