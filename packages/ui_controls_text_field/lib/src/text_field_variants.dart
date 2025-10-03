import 'package:flutter/material.dart';

/// Text field variant definitions for the Awesome UI text field component.
/// 
/// Defines the different visual styles and behaviors that text fields can have,
/// following Material 3 design principles while maintaining cross-platform compatibility.
enum TextFieldVariant {
  /// Filled text field - Material 3 filled style
  filled,
  
  /// Outlined text field - Material 3 outlined style
  outlined,
  
  /// Underlined text field - Cupertino style
  underlined,
}

/// Text field size definitions for the Awesome UI text field component.
/// 
/// Provides consistent sizing across different platforms and use cases,
/// following Material 3 sizing guidelines.
enum TextFieldSize {
  /// Small text field - 40dp height
  sm,
  
  /// Medium text field - 56dp height (default)
  md,
  
  /// Large text field - 64dp height
  lg,
}

/// Text field state definitions for the Awesome UI text field component.
/// 
/// Defines the different interactive states that text fields can be in,
/// providing consistent behavior across platforms.
enum TextFieldState {
  /// Normal state - default appearance
  normal,
  
  /// Focused state - keyboard focus
  focused,
  
  /// Error state - validation error
  error,
  
  /// Disabled state - not interactive
  disabled,
  
  /// Read-only state - display only
  readOnly,
}

/// Text field input type definitions.
/// 
/// Defines the different input types for specialized text fields.
enum TextFieldInputType {
  /// Text input
  text,
  
  /// Email input
  email,
  
  /// Password input
  password,
  
  /// Number input
  number,
  
  /// Phone input
  phone,
  
  /// URL input
  url,
  
  /// Multiline text input
  multiline,
}

/// Text field decoration configuration.
/// 
/// Contains all the styling information needed to render a text field
/// with the appropriate platform-specific appearance.
class TextFieldDecoration {
  const TextFieldDecoration({
    this.variant = TextFieldVariant.filled,
    this.size = TextFieldSize.md,
    this.state = TextFieldState.normal,
    this.inputType = TextFieldInputType.text,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixText,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense = false,
    this.isCollapsed = false,
    this.contentPadding,
    this.borderRadius,
    this.borderColor,
    this.focusColor,
    this.hoverColor,
    this.fillColor,
    this.errorColor,
  });

  final TextFieldVariant variant;
  final TextFieldSize size;
  final TextFieldState state;
  final TextFieldInputType inputType;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDense;
  final bool isCollapsed;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? fillColor;
  final Color? errorColor;

  /// Create a copy of this decoration with the given fields replaced.
  TextFieldDecoration copyWith({
    TextFieldVariant? variant,
    TextFieldSize? size,
    TextFieldState? state,
    TextFieldInputType? inputType,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    String? prefixText,
    String? suffixText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? isDense,
    bool? isCollapsed,
    EdgeInsetsGeometry? contentPadding,
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? focusColor,
    Color? hoverColor,
    Color? fillColor,
    Color? errorColor,
  }) {
    return TextFieldDecoration(
      variant: variant ?? this.variant,
      size: size ?? this.size,
      state: state ?? this.state,
      inputType: inputType ?? this.inputType,
      labelText: labelText ?? this.labelText,
      hintText: hintText ?? this.hintText,
      helperText: helperText ?? this.helperText,
      errorText: errorText ?? this.errorText,
      prefixText: prefixText ?? this.prefixText,
      suffixText: suffixText ?? this.suffixText,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      isDense: isDense ?? this.isDense,
      isCollapsed: isCollapsed ?? this.isCollapsed,
      contentPadding: contentPadding ?? this.contentPadding,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      fillColor: fillColor ?? this.fillColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TextFieldDecoration &&
        other.variant == variant &&
        other.size == size &&
        other.state == state &&
        other.inputType == inputType &&
        other.labelText == labelText &&
        other.hintText == hintText &&
        other.helperText == helperText &&
        other.errorText == errorText &&
        other.prefixText == prefixText &&
        other.suffixText == suffixText &&
        other.prefixIcon == prefixIcon &&
        other.suffixIcon == suffixIcon &&
        other.isDense == isDense &&
        other.isCollapsed == isCollapsed &&
        other.contentPadding == contentPadding &&
        other.borderRadius == borderRadius &&
        other.borderColor == borderColor &&
        other.focusColor == focusColor &&
        other.hoverColor == hoverColor &&
        other.fillColor == fillColor &&
        other.errorColor == errorColor;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      variant,
      size,
      state,
      inputType,
      labelText,
      hintText,
      helperText,
      errorText,
      prefixText,
      suffixText,
      prefixIcon,
      suffixIcon,
      isDense,
      isCollapsed,
      contentPadding,
      borderRadius,
      borderColor,
      focusColor,
      hoverColor,
      fillColor,
      errorColor,
    ]);
  }
}
