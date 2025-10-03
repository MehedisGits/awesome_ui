import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'text_field_variants.dart';
import 'text_field_sizes.dart';

/// Text field state utilities for the Awesome UI text field component.
/// 
/// Provides state management and visual feedback for different text field states,
/// ensuring consistent behavior across platforms and accessibility requirements.
class TextFieldStates {
  const TextFieldStates._();

  /// Get the background color for a text field variant and state
  static Color getBackgroundColor(
    TextFieldVariant variant,
    TextFieldState state,
    AppColors colors,
  ) {
    if (state == TextFieldState.disabled) {
      return colors.surfaceVariant;
    }

    switch (variant) {
      case TextFieldVariant.filled:
        return state == TextFieldState.focused
            ? colors.surface
            : colors.surfaceVariant;
      case TextFieldVariant.outlined:
        return colors.surface;
      case TextFieldVariant.underlined:
        return Colors.transparent;
    }
  }

  /// Get the border color for a text field variant and state
  static Color getBorderColor(
    TextFieldVariant variant,
    TextFieldState state,
    AppColors colors,
  ) {
    if (state == TextFieldState.disabled) {
      return colors.outlineVariant;
    }

    switch (state) {
      case TextFieldState.error:
        return colors.error;
      case TextFieldState.focused:
        return colors.primary;
      default:
        return colors.outline;
    }
  }

  /// Get the border width for a text field variant and state
  static double getBorderWidth(
    TextFieldVariant variant,
    TextFieldState state,
    TextFieldSize size,
  ) {
    if (state == TextFieldState.disabled) {
      return 0.0;
    }

    final baseWidth = TextFieldSizes.getBorderWidth(size);
    
    switch (state) {
      case TextFieldState.focused:
        return baseWidth * 2;
      case TextFieldState.error:
        return baseWidth * 1.5;
      default:
        return baseWidth;
    }
  }

  /// Get the label color for a text field state
  static Color getLabelColor(
    TextFieldState state,
    AppColors colors,
  ) {
    if (state == TextFieldState.disabled) {
      return colors.onSurfaceVariant;
    }

    switch (state) {
      case TextFieldState.error:
        return colors.error;
      case TextFieldState.focused:
        return colors.primary;
      default:
        return colors.onSurfaceVariant;
    }
  }

  /// Get the hint text color for a text field state
  static Color getHintColor(
    TextFieldState state,
    AppColors colors,
  ) {
    if (state == TextFieldState.disabled) {
      return colors.onSurfaceVariant;
    }

    return colors.onSurfaceVariant;
  }

  /// Get the helper text color for a text field state
  static Color getHelperColor(
    TextFieldState state,
    AppColors colors,
  ) {
    if (state == TextFieldState.disabled) {
      return colors.onSurfaceVariant;
    }

    switch (state) {
      case TextFieldState.error:
        return colors.error;
      default:
        return colors.onSurfaceVariant;
    }
  }

  /// Get the prefix/suffix text color for a text field state
  static Color getPrefixSuffixColor(
    TextFieldState state,
    AppColors colors,
  ) {
    if (state == TextFieldState.disabled) {
      return colors.onSurfaceVariant;
    }

    return colors.onSurface;
  }

  /// Get the prefix/suffix icon color for a text field state
  static Color getPrefixSuffixIconColor(
    TextFieldState state,
    AppColors colors,
  ) {
    if (state == TextFieldState.disabled) {
      return colors.onSurfaceVariant;
    }

    switch (state) {
      case TextFieldState.error:
        return colors.error;
      case TextFieldState.focused:
        return colors.primary;
      default:
        return colors.onSurfaceVariant;
    }
  }

  /// Get the focus ring color for a text field state
  static Color getFocusRingColor(
    TextFieldState state,
    AppColors colors,
  ) {
    if (state != TextFieldState.focused) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.5);
  }

  /// Get the text style for a text field state and size
  static TextStyle getTextStyle(
    TextFieldState state,
    TextFieldSize size,
    AppTypography typography,
  ) {
    final fontSize = TextFieldSizes.getFontSize(size);
    final fontWeight = FontWeight.w400;
    final color = state == TextFieldState.disabled
        ? AppColors.light.onSurfaceVariant
        : AppColors.light.onSurface;

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.0,
    );
  }

  /// Get the label text style for a text field state and size
  static TextStyle getLabelTextStyle(
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    final fontSize = TextFieldSizes.getFontSize(size) * 0.875;
    final fontWeight = FontWeight.w400;
    final color = getLabelColor(state, colors);

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.1,
    );
  }

  /// Get the hint text style for a text field state and size
  static TextStyle getHintTextStyle(
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    final fontSize = TextFieldSizes.getFontSize(size);
    final fontWeight = FontWeight.w400;
    final color = getHintColor(state, colors);

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.0,
    );
  }

  /// Get the helper text style for a text field state and size
  static TextStyle getHelperTextStyle(
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    final fontSize = TextFieldSizes.getFontSize(size) * 0.75;
    final fontWeight = FontWeight.w400;
    final color = getHelperColor(state, colors);

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.4,
    );
  }

  /// Get the prefix/suffix text style for a text field state and size
  static TextStyle getPrefixSuffixTextStyle(
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    final fontSize = TextFieldSizes.getFontSize(size);
    final fontWeight = FontWeight.w400;
    final color = getPrefixSuffixColor(state, colors);

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.0,
    );
  }

  /// Check if a text field should show focus ring
  static bool shouldShowFocusRing(TextFieldState state) {
    return state == TextFieldState.focused;
  }

  /// Check if a text field is interactive
  static bool isInteractive(TextFieldState state) {
    return state != TextFieldState.disabled && state != TextFieldState.readOnly;
  }

  /// Get the cursor for a text field state
  static MouseCursor getCursor(TextFieldState state) {
    if (state == TextFieldState.disabled) {
      return SystemMouseCursors.forbidden;
    }
    if (state == TextFieldState.readOnly) {
      return SystemMouseCursors.text;
    }
    return SystemMouseCursors.text;
  }

  /// Get the semantic label for a text field state
  static String? getSemanticLabel(TextFieldState state, String? baseLabel) {
    if (state == TextFieldState.disabled) {
      return '${baseLabel ?? 'Text field'} (Disabled)';
    }
    if (state == TextFieldState.readOnly) {
      return '${baseLabel ?? 'Text field'} (Read only)';
    }
    if (state == TextFieldState.error) {
      return '${baseLabel ?? 'Text field'} (Error)';
    }
    return baseLabel;
  }

  /// Get the semantic hint for a text field state
  static String? getSemanticHint(TextFieldState state) {
    switch (state) {
      case TextFieldState.disabled:
        return 'Text field is disabled';
      case TextFieldState.readOnly:
        return 'Text field is read only';
      case TextFieldState.error:
        return 'Text field has an error';
      case TextFieldState.focused:
        return 'Text field is focused';
      default:
        return null;
    }
  }

  /// Get the input decoration for a text field variant and state
  static InputDecoration getInputDecoration(
    TextFieldVariant variant,
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
    TextFieldDecoration decoration,
  ) {
    final border = _getBorder(variant, state, size, colors);
    final focusedBorder = _getFocusedBorder(variant, state, size, colors);
    final errorBorder = _getErrorBorder(variant, state, size, colors);
    final disabledBorder = _getDisabledBorder(variant, state, size, colors);
    final enabledBorder = _getEnabledBorder(variant, state, size, colors);

    return InputDecoration(
      labelText: decoration.labelText,
      hintText: decoration.hintText,
      helperText: decoration.helperText,
      errorText: decoration.errorText,
      prefixText: decoration.prefixText,
      suffixText: decoration.suffixText,
      prefixIcon: decoration.prefixIcon,
      suffixIcon: decoration.suffixIcon,
      isDense: decoration.isDense,
      isCollapsed: decoration.isCollapsed,
      contentPadding: decoration.contentPadding ?? TextFieldSizes.getContentPadding(size),
      filled: variant == TextFieldVariant.filled,
      fillColor: decoration.fillColor ?? getBackgroundColor(variant, state, colors),
      border: border,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      disabledBorder: disabledBorder,
      enabledBorder: enabledBorder,
      labelStyle: getLabelTextStyle(state, size, colors),
      hintStyle: getHintTextStyle(state, size, colors),
      helperStyle: getHelperTextStyle(state, size, colors),
      errorStyle: getHelperTextStyle(state, size, colors),
      prefixStyle: getPrefixSuffixTextStyle(state, size, colors),
      suffixStyle: getPrefixSuffixTextStyle(state, size, colors),
    );
  }

  /// Get the border for a text field variant and state
  static InputBorder _getBorder(
    TextFieldVariant variant,
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    switch (variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide.none,
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide(
            color: getBorderColor(variant, state, colors),
            width: getBorderWidth(variant, state, size),
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: getBorderColor(variant, state, colors),
            width: getBorderWidth(variant, state, size),
          ),
        );
    }
  }

  /// Get the focused border for a text field variant and state
  static InputBorder _getFocusedBorder(
    TextFieldVariant variant,
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    switch (variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide(
            color: colors.primary,
            width: getBorderWidth(variant, TextFieldState.focused, size),
          ),
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide(
            color: colors.primary,
            width: getBorderWidth(variant, TextFieldState.focused, size),
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary,
            width: getBorderWidth(variant, TextFieldState.focused, size),
          ),
        );
    }
  }

  /// Get the error border for a text field variant and state
  static InputBorder _getErrorBorder(
    TextFieldVariant variant,
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    switch (variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide(
            color: colors.error,
            width: getBorderWidth(variant, TextFieldState.error, size),
          ),
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide(
            color: colors.error,
            width: getBorderWidth(variant, TextFieldState.error, size),
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.error,
            width: getBorderWidth(variant, TextFieldState.error, size),
          ),
        );
    }
  }

  /// Get the disabled border for a text field variant and state
  static InputBorder _getDisabledBorder(
    TextFieldVariant variant,
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    switch (variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide.none,
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide(
            color: colors.outlineVariant,
            width: 1.0,
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.outlineVariant,
            width: 1.0,
          ),
        );
    }
  }

  /// Get the enabled border for a text field variant and state
  static InputBorder _getEnabledBorder(
    TextFieldVariant variant,
    TextFieldState state,
    TextFieldSize size,
    AppColors colors,
  ) {
    switch (variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide.none,
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: TextFieldSizes.getBorderRadius(size),
          borderSide: BorderSide(
            color: colors.outline,
            width: getBorderWidth(variant, state, size),
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.outline,
            width: getBorderWidth(variant, state, size),
          ),
        );
    }
  }
}