import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'button_variants.dart';
import 'button_sizes.dart';

/// Button state utilities for the Awesome UI button component.
/// 
/// Provides state management and visual feedback for different button states,
/// ensuring consistent behavior across platforms and accessibility requirements.
class ButtonStates {
  const ButtonStates._();

  /// Get the background color for a button variant and state
  static Color getBackgroundColor(
    ButtonVariant variant,
    ButtonState state,
    AppColors colors,
  ) {
    if (state == ButtonState.disabled) {
      return colors.surfaceVariant;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return state == ButtonState.pressed
            ? colors.primary.withOpacity(0.8)
            : colors.primary;
      case ButtonVariant.secondary:
        return state == ButtonState.pressed
            ? colors.secondary.withOpacity(0.8)
            : colors.secondary;
      case ButtonVariant.tonal:
        return state == ButtonState.pressed
            ? colors.primaryContainer.withOpacity(0.8)
            : colors.primaryContainer;
      case ButtonVariant.ghost:
        return state == ButtonState.pressed
            ? colors.surfaceVariant.withOpacity(0.8)
            : Colors.transparent;
      case ButtonVariant.destructive:
        return state == ButtonState.pressed
            ? colors.error.withOpacity(0.8)
            : colors.error;
      case ButtonVariant.outlined:
        return state == ButtonState.pressed
            ? colors.surfaceVariant.withOpacity(0.8)
            : Colors.transparent;
    }
  }

  /// Get the foreground color for a button variant and state
  static Color getForegroundColor(
    ButtonVariant variant,
    ButtonState state,
    AppColors colors,
  ) {
    if (state == ButtonState.disabled) {
      return colors.onSurfaceVariant;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return colors.onPrimary;
      case ButtonVariant.secondary:
        return colors.onSecondary;
      case ButtonVariant.tonal:
        return colors.onPrimaryContainer;
      case ButtonVariant.ghost:
        return colors.primary;
      case ButtonVariant.destructive:
        return colors.onError;
      case ButtonVariant.outlined:
        return colors.primary;
    }
  }

  /// Get the border color for a button variant and state
  static Color? getBorderColor(
    ButtonVariant variant,
    ButtonState state,
    AppColors colors,
  ) {
    if (state == ButtonState.disabled) {
      return colors.outlineVariant;
    }

    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.secondary:
      case ButtonVariant.tonal:
        return null; // No border for filled buttons
      case ButtonVariant.ghost:
        return state == ButtonState.pressed
            ? colors.primary.withOpacity(0.8)
            : colors.primary;
      case ButtonVariant.destructive:
        return state == ButtonState.pressed
            ? colors.error.withOpacity(0.8)
            : colors.error;
      case ButtonVariant.outlined:
        return state == ButtonState.pressed
            ? colors.primary.withOpacity(0.8)
            : colors.primary;
    }
  }

  /// Get the border width for a button variant and state
  static double getBorderWidth(
    ButtonVariant variant,
    ButtonState state,
  ) {
    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.secondary:
      case ButtonVariant.tonal:
        return 0.0; // No border for filled buttons
      case ButtonVariant.ghost:
      case ButtonVariant.destructive:
        return state == ButtonState.pressed ? 2.0 : 1.0;
      case ButtonVariant.outlined:
        return state == ButtonState.pressed ? 2.0 : 1.0;
    }
  }

  /// Get the elevation for a button variant and state
  static double getElevation(
    ButtonVariant variant,
    ButtonState state,
    ButtonSize size,
  ) {
    if (state == ButtonState.disabled) {
      return 0.0;
    }

    final baseElevation = ButtonSizes.getElevation(size);
    
    switch (state) {
      case ButtonState.normal:
        return baseElevation;
      case ButtonState.hovered:
        return baseElevation + 1.0;
      case ButtonState.pressed:
        return 0.0; // Pressed buttons are flat
      case ButtonState.focused:
        return baseElevation;
      case ButtonState.disabled:
        return 0.0;
      case ButtonState.loading:
        return baseElevation;
    }
  }

  /// Get the overlay color for a button state
  static Color? getOverlayColor(
    ButtonVariant variant,
    ButtonState state,
    AppColors colors,
  ) {
    if (state == ButtonState.disabled || state == ButtonState.loading) {
      return null;
    }

    final baseColor = getBackgroundColor(variant, ButtonState.normal, colors);
    
    switch (state) {
      case ButtonState.hovered:
        return baseColor.withOpacity(0.08);
      case ButtonState.pressed:
        return baseColor.withOpacity(0.12);
      case ButtonState.focused:
        return colors.primary.withOpacity(0.12);
      default:
        return null;
    }
  }

  /// Get the shadow color for a button variant and state
  static Color getShadowColor(
    ButtonVariant variant,
    ButtonState state,
    AppColors colors,
  ) {
    if (state == ButtonState.disabled) {
      return Colors.transparent;
    }

    return colors.shadow.withOpacity(0.2);
  }

  /// Get the focus ring color for a button variant and state
  static Color getFocusRingColor(
    ButtonVariant variant,
    ButtonState state,
    AppColors colors,
  ) {
    if (state != ButtonState.focused) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.5);
  }

  /// Get the loading indicator color for a button variant and state
  static Color getLoadingIndicatorColor(
    ButtonVariant variant,
    ButtonState state,
    AppColors colors,
  ) {
    if (state == ButtonState.disabled) {
      return colors.onSurfaceVariant;
    }

    return getForegroundColor(variant, state, colors);
  }

  /// Get the text style for a button variant and state
  static TextStyle getTextStyle(
    ButtonVariant variant,
    ButtonState state,
    ButtonSize size,
    AppTypography typography,
  ) {
    final fontSize = ButtonSizes.getFontSize(size);
    final fontWeight = FontWeight.w500;
    final color = getForegroundColor(variant, state, AppColors.light);

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.1,
    );
  }

  /// Check if a button should show a loading indicator
  static bool shouldShowLoading(ButtonState state) {
    return state == ButtonState.loading;
  }

  /// Check if a button is interactive
  static bool isInteractive(ButtonState state) {
    return state != ButtonState.disabled && state != ButtonState.loading;
  }

  /// Check if a button should show focus ring
  static bool shouldShowFocusRing(ButtonState state) {
    return state == ButtonState.focused;
  }

  /// Get the cursor for a button state
  static MouseCursor getCursor(ButtonState state) {
    if (state == ButtonState.disabled || state == ButtonState.loading) {
      return SystemMouseCursors.forbidden;
    }
    return SystemMouseCursors.click;
  }

  /// Get the semantic label for a button state
  static String? getSemanticLabel(ButtonState state, String? baseLabel) {
    if (state == ButtonState.loading) {
      return '${baseLabel ?? 'Button'} (Loading)';
    }
    if (state == ButtonState.disabled) {
      return '${baseLabel ?? 'Button'} (Disabled)';
    }
    return baseLabel;
  }

  /// Get the semantic hint for a button state
  static String? getSemanticHint(ButtonState state) {
    switch (state) {
      case ButtonState.loading:
        return 'Button is loading, please wait';
      case ButtonState.disabled:
        return 'Button is disabled';
      case ButtonState.focused:
        return 'Press Enter or Space to activate';
      default:
        return null;
    }
  }

  /// Get the focus color for a button state
  static Color getFocusColor(
    ButtonState state,
    AppColors colors,
  ) {
    if (state == ButtonState.disabled) {
      return Colors.transparent;
    }

    return state == ButtonState.focused
        ? colors.primary.withOpacity(0.12)
        : Colors.transparent;
  }
}
