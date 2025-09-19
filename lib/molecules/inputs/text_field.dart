import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../foundation/theme.dart';

/// Text field variants
enum AuiTextFieldVariant {
  filled,
  outlined,
  underlined,
}

/// Text field sizes
enum AuiTextFieldSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Text field states
enum AuiTextFieldState {
  enabled,
  disabled,
  error,
  focused,
  hovered,
}

/// A comprehensive text field component
class AuiTextField extends StatefulWidget {
  const AuiTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.mouseCursor,
    this.onTap,
    this.onTapOutside,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.restorationId,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.variant = AuiTextFieldVariant.outlined,
    this.size = AuiTextFieldSize.md,
    this.state = AuiTextFieldState.enabled,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.counterText,
    this.semanticCounterText,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.enabledBorderColor,
    this.hoverBorderColor,
    this.focusedColor,
    this.errorColor,
    this.disabledColor,
    this.enabledColor,
    this.hoverColor,
    this.semanticLabel,
    this.tooltip,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final MouseCursor? mouseCursor;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final String? restorationId;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final bool canRequestFocus;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final AuiTextFieldVariant variant;
  final AuiTextFieldSize size;
  final AuiTextFieldState state;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final String? counterText;
  final String? semanticCounterText;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;
  final Color? enabledBorderColor;
  final Color? hoverBorderColor;
  final Color? focusedColor;
  final Color? errorColor;
  final Color? disabledColor;
  final Color? enabledColor;
  final Color? hoverColor;
  final String? semanticLabel;
  final String? tooltip;

  @override
  State<AuiTextField> createState() => _AuiTextFieldState();
}

class _AuiTextFieldState extends State<AuiTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    
    // Get text field decoration
    final decoration = _getTextFieldDecoration(colors, spacing);
    
    // Get text field style
    final textStyle = _getTextFieldStyle(colors);
    
    Widget textField = TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: textStyle,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      autofocus: widget.autofocus,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled ?? (widget.state != AuiTextFieldState.disabled),
      mouseCursor: widget.mouseCursor,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      scrollPadding: widget.scrollPadding,
      dragStartBehavior: widget.dragStartBehavior,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
      clipBehavior: widget.clipBehavior,
      canRequestFocus: widget.canRequestFocus,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      magnifierConfiguration: widget.magnifierConfiguration,
    );
    
    // Add margin if provided
    if (widget.margin != null) {
      textField = Padding(
        padding: widget.margin!,
        child: textField,
      );
    }
    
    // Add tooltip if provided
    if (widget.tooltip != null) {
      textField = Tooltip(
        message: widget.tooltip!,
        child: textField,
      );
    }
    
    return textField;
  }
  
  /// Get text field decoration
  InputDecoration _getTextFieldDecoration(AuiColorScheme colors, AuiSpacingScheme spacing) {
    final baseDecoration = widget.decoration ?? const InputDecoration();
    
    return baseDecoration.copyWith(
      labelText: widget.label,
      hintText: widget.hint,
      helperText: widget.helperText,
      errorText: widget.errorText,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      prefixText: widget.prefixText,
      suffixText: widget.suffixText,
      counterText: widget.counterText,
      semanticCounterText: widget.semanticCounterText,
      filled: widget.variant == AuiTextFieldVariant.filled,
      fillColor: widget.backgroundColor ?? _getBackgroundColor(colors),
      border: _getBorder(colors, spacing),
      enabledBorder: _getEnabledBorder(colors, spacing),
      focusedBorder: _getFocusedBorder(colors, spacing),
      errorBorder: _getErrorBorder(colors, spacing),
      disabledBorder: _getDisabledBorder(colors, spacing),
      focusedErrorBorder: _getFocusedErrorBorder(colors, spacing),
      contentPadding: _getContentPadding(spacing),
      labelStyle: _getLabelStyle(colors),
      hintStyle: _getHintStyle(colors),
      helperStyle: _getHelperStyle(colors),
      errorStyle: _getErrorStyle(colors),
      prefixStyle: _getPrefixStyle(colors),
      suffixStyle: _getSuffixStyle(colors),
      counterStyle: _getCounterStyle(colors),
    );
  }
  
  /// Get text field style
  TextStyle _getTextFieldStyle(AuiColorScheme colors) {
    return widget.style ?? TextStyle(
      color: _getTextColor(colors),
      fontSize: _getFontSize(),
    );
  }
  
  /// Get background color
  Color _getBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiTextFieldState.disabled) {
      return colors.surfaceVariant;
    }
    return widget.backgroundColor ?? colors.surface;
  }
  
  /// Get text color
  Color _getTextColor(AuiColorScheme colors) {
    if (widget.state == AuiTextFieldState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    return widget.color ?? colors.onSurface;
  }
  
  /// Get border
  InputBorder _getBorder(AuiColorScheme colors, AuiSpacingScheme spacing) {
    switch (widget.variant) {
      case AuiTextFieldVariant.filled:
        return OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(_getBorderRadius(spacing)),
          borderSide: BorderSide.none,
        );
      case AuiTextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(_getBorderRadius(spacing)),
          borderSide: BorderSide(
            color: widget.borderColor ?? colors.outline,
            width: 1.0,
          ),
        );
      case AuiTextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? colors.outline,
            width: 1.0,
          ),
        );
    }
  }
  
  /// Get enabled border
  InputBorder _getEnabledBorder(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return _getBorder(colors, spacing).copyWith(
      borderSide: BorderSide(
        color: widget.enabledBorderColor ?? colors.outline,
        width: 1.0,
      ),
    );
  }
  
  /// Get focused border
  InputBorder _getFocusedBorder(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return _getBorder(colors, spacing).copyWith(
      borderSide: BorderSide(
        color: widget.focusedBorderColor ?? colors.primary,
        width: 2.0,
      ),
    );
  }
  
  /// Get error border
  InputBorder _getErrorBorder(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return _getBorder(colors, spacing).copyWith(
      borderSide: BorderSide(
        color: widget.errorBorderColor ?? colors.error,
        width: 1.0,
      ),
    );
  }
  
  /// Get disabled border
  InputBorder _getDisabledBorder(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return _getBorder(colors, spacing).copyWith(
      borderSide: BorderSide(
        color: widget.disabledBorderColor ?? colors.outline.withValues(alpha:0.38),
        width: 1.0,
      ),
    );
  }
  
  /// Get focused error border
  InputBorder _getFocusedErrorBorder(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return _getBorder(colors, spacing).copyWith(
      borderSide: BorderSide(
        color: widget.errorBorderColor ?? colors.error,
        width: 2.0,
      ),
    );
  }
  
  /// Get content padding
  EdgeInsets _getContentPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiTextFieldSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiTextFieldSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.sm);
      case AuiTextFieldSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiTextFieldSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.md);
      case AuiTextFieldSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.md);
    }
  }
  
  /// Get label style
  TextStyle _getLabelStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getLabelColor(colors),
      fontSize: _getFontSize(),
    );
  }
  
  /// Get hint style
  TextStyle _getHintStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getHintColor(colors),
      fontSize: _getFontSize(),
    );
  }
  
  /// Get helper style
  TextStyle _getHelperStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getHelperColor(colors),
      fontSize: _getFontSize() * 0.875,
    );
  }
  
  /// Get error style
  TextStyle _getErrorStyle(AuiColorScheme colors) {
    return TextStyle(
      color: widget.errorColor ?? colors.error,
      fontSize: _getFontSize() * 0.875,
    );
  }
  
  /// Get prefix style
  TextStyle _getPrefixStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getTextColor(colors),
      fontSize: _getFontSize(),
    );
  }
  
  /// Get suffix style
  TextStyle _getSuffixStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getTextColor(colors),
      fontSize: _getFontSize(),
    );
  }
  
  /// Get counter style
  TextStyle _getCounterStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getTextColor(colors),
      fontSize: _getFontSize() * 0.875,
    );
  }
  
  /// Get label color
  Color _getLabelColor(AuiColorScheme colors) {
    if (widget.state == AuiTextFieldState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    if (widget.state == AuiTextFieldState.error) {
      return colors.error;
    }
    return widget.focusedColor ?? colors.primary;
  }
  
  /// Get hint color
  Color _getHintColor(AuiColorScheme colors) {
    if (widget.state == AuiTextFieldState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    return colors.onSurfaceVariant;
  }
  
  /// Get helper color
  Color _getHelperColor(AuiColorScheme colors) {
    if (widget.state == AuiTextFieldState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    return colors.onSurfaceVariant;
  }
  
  /// Get font size based on size
  double _getFontSize() {
    switch (widget.size) {
      case AuiTextFieldSize.xs:
        return 12.0;
      case AuiTextFieldSize.sm:
        return 14.0;
      case AuiTextFieldSize.md:
        return 16.0;
      case AuiTextFieldSize.lg:
        return 18.0;
      case AuiTextFieldSize.xl:
        return 20.0;
    }
  }
  
  /// Get border radius based on size
  double _getBorderRadius(AuiSpacingScheme spacing) {
    switch (widget.size) {
      case AuiTextFieldSize.xs:
        return spacing.xs;
      case AuiTextFieldSize.sm:
        return spacing.sm;
      case AuiTextFieldSize.md:
        return spacing.sm;
      case AuiTextFieldSize.lg:
        return spacing.md;
      case AuiTextFieldSize.xl:
        return spacing.md;
    }
  }
}

/// Text field utilities
class AuiTextFieldUtils {
  const AuiTextFieldUtils._();
  
  /// Get font size for size
  static double getFontSize(AuiTextFieldSize size) {
    switch (size) {
      case AuiTextFieldSize.xs:
        return 12.0;
      case AuiTextFieldSize.sm:
        return 14.0;
      case AuiTextFieldSize.md:
        return 16.0;
      case AuiTextFieldSize.lg:
        return 18.0;
      case AuiTextFieldSize.xl:
        return 20.0;
    }
  }
  
  /// Get border radius for size
  static double getBorderRadius(AuiTextFieldSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiTextFieldSize.xs:
        return spacing.xs;
      case AuiTextFieldSize.sm:
        return spacing.sm;
      case AuiTextFieldSize.md:
        return spacing.sm;
      case AuiTextFieldSize.lg:
        return spacing.md;
      case AuiTextFieldSize.xl:
        return spacing.md;
    }
  }
}
