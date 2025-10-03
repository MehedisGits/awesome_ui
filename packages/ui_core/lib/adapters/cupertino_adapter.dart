import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';

/// Cupertino adapter for cross-platform components.
/// 
/// Provides Cupertino specific implementations and styling
/// for components that need to adapt to different platforms.
class CupertinoAdapter {
  const CupertinoAdapter._();

  /// Create Cupertino button style
  static CupertinoButtonStyle createButtonStyle({
    required AppColors colors,
    required AppSpacing spacing,
    required AppTypography typography,
    bool isPrimary = true,
    bool isDestructive = false,
    bool isDisabled = false,
    bool isPressed = false,
  }) {
    Color backgroundColor;
    Color foregroundColor;

    if (isDestructive) {
      backgroundColor = colors.error;
      foregroundColor = colors.onError;
    } else if (isPrimary) {
      backgroundColor = colors.primary;
      foregroundColor = colors.onPrimary;
    } else {
      backgroundColor = colors.secondary;
      foregroundColor = colors.onSecondary;
    }

    if (isDisabled) {
      backgroundColor = colors.surfaceVariant;
      foregroundColor = colors.onSurfaceVariant;
    }

    return CupertinoButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: const EdgeInsets.all(AppSpacing.buttonPadding),
      textStyle: AppTypography.buttonLarge,
    );
  }

  /// Create Cupertino text field decoration
  static BoxDecoration createTextFieldDecoration({
    required AppColors colors,
    required AppRadius radius,
    bool isFocused = false,
    bool hasError = false,
    bool isDisabled = false,
  }) {
    return BoxDecoration(
      color: isDisabled
          ? colors.surfaceVariant.withOpacity(0.5)
          : colors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppRadius.input),
      border: Border.all(
        color: hasError
            ? colors.error
            : isFocused
                ? colors.primary
                : colors.outline,
        width: isFocused ? 2 : 1,
      ),
    );
  }

  /// Create Cupertino card style
  static BoxDecoration createCardDecoration({
    required AppColors colors,
    required AppRadius radius,
    required AppElevation elevation,
  }) {
    return BoxDecoration(
      color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      boxShadow: AppElevation.getComponentShadow('card'),
    );
  }

  /// Create Cupertino chip style
  static BoxDecoration createChipDecoration({
    required AppColors colors,
    required AppRadius radius,
    bool isSelected = false,
    bool isDisabled = false,
  }) {
    return BoxDecoration(
      color: isDisabled
          ? colors.surfaceVariant.withOpacity(0.5)
          : isSelected
              ? colors.primaryContainer
              : colors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      border: Border.all(
        color: colors.outline,
        width: 1,
      ),
    );
  }

  /// Create Cupertino navigation bar style
  static CupertinoNavigationBarData createNavigationBarStyle({
    required AppColors colors,
    required AppTypography typography,
  }) {
    return CupertinoNavigationBarData(
      backgroundColor: colors.surface,
      border: Border(
        bottom: BorderSide(
          color: colors.outlineVariant,
          width: 0.5,
        ),
      ),
      titleTextStyle: AppTypography.titleLarge.copyWith(
        color: colors.onSurface,
      ),
      largeTitleTextStyle: AppTypography.headlineLarge.copyWith(
        color: colors.onSurface,
      ),
    );
  }

  /// Create Cupertino tab bar style
  static CupertinoTabBarData createTabBarStyle({
    required AppColors colors,
    required AppTypography typography,
  }) {
    return CupertinoTabBarData(
      backgroundColor: colors.surface,
      activeColor: colors.primary,
      inactiveColor: colors.onSurfaceVariant,
      border: Border(
        top: BorderSide(
          color: colors.outlineVariant,
          width: 0.5,
        ),
      ),
      iconSize: 24,
      labelStyle: AppTypography.labelSmall,
    );
  }

  /// Create Cupertino dialog style
  static BoxDecoration createDialogDecoration({
    required AppColors colors,
    required AppRadius radius,
    required AppElevation elevation,
  }) {
    return BoxDecoration(
      color: colors.surface,
      borderRadius: AppRadius.dialogRadius,
      boxShadow: AppElevation.getComponentShadow('dialog'),
    );
  }

  /// Create Cupertino action sheet style
  static BoxDecoration createActionSheetDecoration({
    required AppColors colors,
    required AppRadius radius,
  }) {
    return BoxDecoration(
      color: colors.surface,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppRadius.lg),
        topRight: Radius.circular(AppRadius.lg),
      ),
    );
  }

  /// Create Cupertino switch style
  static CupertinoSwitchData createSwitchStyle({
    required AppColors colors,
  }) {
    return CupertinoSwitchData(
      activeColor: colors.primary,
      trackColor: colors.surfaceVariant,
      thumbColor: colors.onPrimary,
    );
  }

  /// Create Cupertino slider style
  static CupertinoSliderData createSliderStyle({
    required AppColors colors,
  }) {
    return CupertinoSliderData(
      activeColor: colors.primary,
      thumbColor: colors.primary,
    );
  }

  /// Create Cupertino picker style
  static CupertinoPickerData createPickerStyle({
    required AppColors colors,
    required AppTypography typography,
  }) {
    return CupertinoPickerData(
      backgroundColor: colors.surface,
      itemExtent: 32,
      textStyle: AppTypography.bodyMedium.copyWith(
        color: colors.onSurface,
      ),
    );
  }

  /// Create Cupertino date picker style
  static CupertinoDatePickerData createDatePickerStyle({
    required AppColors colors,
    required AppTypography typography,
  }) {
    return CupertinoDatePickerData(
      backgroundColor: colors.surface,
      textStyle: AppTypography.bodyMedium.copyWith(
        color: colors.onSurface,
      ),
    );
  }

  /// Create Cupertino alert dialog style
  static CupertinoAlertDialogData createAlertDialogStyle({
    required AppColors colors,
    required AppTypography typography,
    required AppRadius radius,
  }) {
    return CupertinoAlertDialogData(
      backgroundColor: colors.surface,
      titleTextStyle: AppTypography.headlineSmall.copyWith(
        color: colors.onSurface,
      ),
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: colors.onSurface,
      ),
      actionTextStyle: AppTypography.labelLarge.copyWith(
        color: colors.primary,
      ),
      borderRadius: AppRadius.dialogRadius,
    );
  }

  /// Create Cupertino list tile style
  static CupertinoListTileData createListTileStyle({
    required AppColors colors,
    required AppSpacing spacing,
    required AppTypography typography,
  }) {
    return CupertinoListTileData(
      backgroundColor: colors.surface,
      titleTextStyle: AppTypography.bodyLarge.copyWith(
        color: colors.onSurface,
      ),
      subtitleTextStyle: AppTypography.bodyMedium.copyWith(
        color: colors.onSurfaceVariant,
      ),
      padding: AppSpacing.paddingMedium,
    );
  }

  /// Create Cupertino segmented control style
  static CupertinoSegmentedControlData createSegmentedControlStyle({
    required AppColors colors,
    required AppRadius radius,
    required AppTypography typography,
  }) {
    return CupertinoSegmentedControlData(
      backgroundColor: colors.surfaceVariant,
      selectedColor: colors.primary,
      unselectedColor: Colors.transparent,
      borderColor: colors.outline,
      textStyle: AppTypography.labelMedium.copyWith(
        color: colors.onSurface,
      ),
      selectedTextStyle: AppTypography.labelMedium.copyWith(
        color: colors.onPrimary,
      ),
      borderRadius: AppRadius.buttonRadius,
    );
  }

  /// Create Cupertino refresh indicator style
  static CupertinoRefreshIndicatorData createRefreshIndicatorStyle({
    required AppColors colors,
  }) {
    return CupertinoRefreshIndicatorData(
      color: colors.primary,
    );
  }

  /// Create Cupertino activity indicator style
  static CupertinoActivityIndicatorData createActivityIndicatorStyle({
    required AppColors colors,
  }) {
    return CupertinoActivityIndicatorData(
      color: colors.primary,
      radius: 10,
    );
  }
}

/// Data classes for Cupertino components
class CupertinoButtonStyle {
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsets padding;
  final TextStyle textStyle;

  const CupertinoButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.padding,
    required this.textStyle,
  });
}

class CupertinoNavigationBarData {
  final Color backgroundColor;
  final Border border;
  final TextStyle titleTextStyle;
  final TextStyle largeTitleTextStyle;

  const CupertinoNavigationBarData({
    required this.backgroundColor,
    required this.border,
    required this.titleTextStyle,
    required this.largeTitleTextStyle,
  });
}

class CupertinoTabBarData {
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Border border;
  final double iconSize;
  final TextStyle labelStyle;

  const CupertinoTabBarData({
    required this.backgroundColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.border,
    required this.iconSize,
    required this.labelStyle,
  });
}

class CupertinoSwitchData {
  final Color activeColor;
  final Color trackColor;
  final Color thumbColor;

  const CupertinoSwitchData({
    required this.activeColor,
    required this.trackColor,
    required this.thumbColor,
  });
}

class CupertinoSliderData {
  final Color activeColor;
  final Color thumbColor;

  const CupertinoSliderData({
    required this.activeColor,
    required this.thumbColor,
  });
}

class CupertinoPickerData {
  final Color backgroundColor;
  final double itemExtent;
  final TextStyle textStyle;

  const CupertinoPickerData({
    required this.backgroundColor,
    required this.itemExtent,
    required this.textStyle,
  });
}

class CupertinoDatePickerData {
  final Color backgroundColor;
  final TextStyle textStyle;

  const CupertinoDatePickerData({
    required this.backgroundColor,
    required this.textStyle,
  });
}

class CupertinoAlertDialogData {
  final Color backgroundColor;
  final TextStyle titleTextStyle;
  final TextStyle contentTextStyle;
  final TextStyle actionTextStyle;
  final BorderRadius borderRadius;

  const CupertinoAlertDialogData({
    required this.backgroundColor,
    required this.titleTextStyle,
    required this.contentTextStyle,
    required this.actionTextStyle,
    required this.borderRadius,
  });
}

class CupertinoListTileData {
  final Color backgroundColor;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final EdgeInsets padding;

  const CupertinoListTileData({
    required this.backgroundColor,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.padding,
  });
}

class CupertinoSegmentedControlData {
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final BorderRadius borderRadius;

  const CupertinoSegmentedControlData({
    required this.backgroundColor,
    required this.selectedColor,
    required this.unselectedColor,
    required this.borderColor,
    required this.textStyle,
    required this.selectedTextStyle,
    required this.borderRadius,
  });
}

class CupertinoRefreshIndicatorData {
  final Color color;

  const CupertinoRefreshIndicatorData({
    required this.color,
  });
}

class CupertinoActivityIndicatorData {
  final Color color;
  final double radius;

  const CupertinoActivityIndicatorData({
    required this.color,
    required this.radius,
  });
}
