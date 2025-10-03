import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';

/// Web-optimized adapter for cross-platform components.
/// 
/// Provides web-specific implementations and styling optimizations
/// for components that need to adapt to different platforms.
class WebAdapter {
  const WebAdapter._();

  /// Create web-optimized button style
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

    // Web-specific hover and focus states
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
      // Web-specific properties
      mouseCursor: WidgetStateProperty.all(
        isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      ),
      animationDuration: const Duration(milliseconds: 150),
    );
  }

  /// Create web-optimized input decoration
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
        borderRadius: AppRadius.inputRadius,
        borderSide: BorderSide(color: colors.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputRadius,
        borderSide: BorderSide(color: colors.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputRadius,
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputRadius,
        borderSide: BorderSide(color: colors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputRadius,
        borderSide: BorderSide(color: colors.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputRadius,
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
      // Web-specific properties
      isDense: true,
      isCollapsed: false,
    );
  }

  /// Create web-optimized card style
  static CardTheme createCardTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppElevation elevation,
  }) {
    return CardTheme(
      color: colors.surface,
      elevation: AppElevation.card,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.cardRadius,
      ),
      margin: AppSpacing.paddingSmall,
      clipBehavior: Clip.antiAlias,
      // Web-specific properties
      shadowColor: colors.shadow,
    );
  }

  /// Create web-optimized app bar style
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

  /// Create web-optimized navigation bar style
  static NavigationBarThemeData createNavigationBarTheme({
    required AppColors colors,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return NavigationBarThemeData(
      backgroundColor: colors.surface,
      elevation: AppElevation.level2,
      height: 80,
      labelTextStyle: WidgetStateProperty.all(AppTypography.labelSmall),
      // Web-specific properties
      indicatorColor: colors.primaryContainer,
      surfaceTintColor: colors.surfaceTint,
    );
  }

  /// Create web-optimized dialog style
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
      // Web-specific properties
      shadowColor: colors.shadow,
    );
  }

  /// Create web-optimized bottom sheet style
  static BottomSheetThemeData createBottomSheetTheme({
    required AppColors colors,
    required AppRadius radius,
    required AppElevation elevation,
  }) {
    return BottomSheetThemeData(
      backgroundColor: colors.surface,
      elevation: AppElevation.bottomSheet,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.bottomSheetRadius,
      ),
      clipBehavior: Clip.antiAlias,
      // Web-specific properties
      shadowColor: colors.shadow,
      modalBackgroundColor: colors.surface,
      modalElevation: AppElevation.dialog,
    );
  }

  /// Create web-optimized snack bar style
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
      // Web-specific properties
      width: 400,
      showCloseIcon: true,
      closeIconColor: colors.onInverseSurface,
    );
  }

  /// Create web-optimized tooltip style
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
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      textStyle: AppTypography.bodySmall.copyWith(
        color: colors.onInverseSurface,
      ),
      padding: AppSpacing.paddingSmall,
      margin: AppSpacing.paddingMicro,
      // Web-specific properties
      preferBelow: true,
      verticalOffset: 8,
      waitDuration: const Duration(milliseconds: 500),
      showDuration: const Duration(seconds: 2),
    );
  }

  /// Create web-optimized switch style
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
      // Web-specific properties
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  /// Create web-optimized checkbox style
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
      // Web-specific properties
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  /// Create web-optimized radio style
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
      // Web-specific properties
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  /// Create web-optimized slider style
  static SliderThemeData createSliderTheme({
    required AppColors colors,
  }) {
    return SliderThemeData(
      activeTrackColor: colors.primary,
      inactiveTrackColor: colors.surfaceVariant,
      thumbColor: colors.primary,
      overlayColor: colors.primary.withOpacity(0.12),
      valueIndicatorColor: colors.inverseSurface,
      valueIndicatorTextStyle: TextStyle(
        color: colors.onInverseSurface,
        fontSize: 12,
      ),
      // Web-specific properties
      trackHeight: 4,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
    );
  }

  /// Create web-optimized progress indicator style
  static ProgressIndicatorThemeData createProgressIndicatorTheme({
    required AppColors colors,
  }) {
    return ProgressIndicatorThemeData(
      color: colors.primary,
      linearTrackColor: colors.surfaceVariant,
      circularTrackColor: colors.surfaceVariant,
      // Web-specific properties
      linearMinHeight: 4,
    );
  }

  /// Create web-optimized tab bar style
  static TabBarTheme createTabBarTheme({
    required AppColors colors,
    required AppTypography typography,
  }) {
    return TabBarTheme(
      labelColor: colors.primary,
      unselectedLabelColor: colors.onSurfaceVariant,
      labelStyle: AppTypography.labelMedium,
      unselectedLabelStyle: AppTypography.labelMedium,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),
      // Web-specific properties
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: colors.outlineVariant,
    );
  }

  /// Create web-optimized badge style
  static BadgeThemeData createBadgeTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppTypography typography,
  }) {
    return BadgeThemeData(
      backgroundColor: colors.error,
      textColor: colors.onError,
      textStyle: AppTypography.labelSmall,
      padding: AppSpacing.paddingMicro,
      // Web-specific properties
      smallSize: 16,
      largeSize: 24,
    );
  }

  /// Create web-optimized segmented button style
  static SegmentedButtonThemeData createSegmentedButtonTheme({
    required AppColors colors,
    required AppSpacing spacing,
    required AppRadius radius,
    required AppTypography typography,
  }) {
    return SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.surfaceVariant;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.onPrimary;
          }
          return colors.onSurface;
        }),
        padding: WidgetStateProperty.all(const EdgeInsets.all(AppSpacing.buttonPadding)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
        ),
        textStyle: WidgetStateProperty.all(AppTypography.labelMedium),
        // Web-specific properties
        mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
      ),
    );
  }

  /// Create web-optimized chip theme
  static ChipThemeData createChipTheme({
    required AppColors colors,
    required AppTypography typography,
    required AppRadius radius,
    required AppSpacing spacing,
  }) {
    return ChipThemeData(
      backgroundColor: colors.surfaceVariant,
      selectedColor: colors.primaryContainer,
      disabledColor: colors.surfaceVariant.withOpacity(0.38),
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

  /// Create web-optimized bottom navigation bar theme
  static BottomNavigationBarThemeData createBottomNavigationBarTheme({
    required AppColors colors,
    required AppTypography typography,
    required AppElevation elevation,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: colors.surface,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.onSurface.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
      elevation: AppElevation.level2,
      selectedLabelStyle: AppTypography.labelSmall,
      unselectedLabelStyle: AppTypography.labelSmall,
    );
  }

  /// Create web-optimized drawer theme
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
}
