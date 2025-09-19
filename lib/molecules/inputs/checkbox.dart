import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Checkbox variants
enum AuiCheckboxVariant {
  filled,
  outlined,
  rounded,
}

/// Checkbox sizes
enum AuiCheckboxSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Checkbox states
enum AuiCheckboxState {
  enabled,
  disabled,
  indeterminate,
  checked,
  unchecked,
}

/// A comprehensive checkbox component
class AuiCheckbox extends StatelessWidget {
  const AuiCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.variant = AuiCheckboxVariant.filled,
    this.size = AuiCheckboxSize.md,
    this.state = AuiCheckboxState.enabled,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.overlayColor,
    this.semanticLabel,
    this.tooltip,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.shape,
    this.side,
    this.isError = false,
    this.tristate = false,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final AuiCheckboxVariant variant;
  final AuiCheckboxSize size;
  final AuiCheckboxState state;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final String? semanticLabel;
  final String? tooltip;
  final bool autofocus;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final bool isError;
  final bool tristate;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    
    // Get checkbox colors
    final checkboxColor = _getCheckboxColor(colors);
    final checkColor = _getCheckColor(colors);
    final borderColor = _getBorderColor(colors);
    
    // Get checkbox shape
    final checkboxShape = _getCheckboxShape();
    
    Widget checkbox = Checkbox(
      value: value,
      onChanged: _getOnChanged(),
      activeColor: checkboxColor,
      checkColor: checkColor,
      focusColor: focusColor ?? colors.primary.withValues(alpha:0.12),
      hoverColor: hoverColor ?? colors.primary.withValues(alpha:0.08),
      splashRadius: _getSplashRadius(),
      overlayColor: overlayColor ?? WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return colors.primary.withValues(alpha:0.12);
        }
        if (states.contains(WidgetState.hovered)) {
          return colors.primary.withValues(alpha:0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.primary.withValues(alpha:0.16);
        }
        return null;
      }),
      materialTapTargetSize: materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
      visualDensity: visualDensity ?? VisualDensity.standard,
      shape: checkboxShape,
      side: side ?? BorderSide(
        color: borderColor,
        width: _getBorderWidth(),
      ),
      tristate: tristate,
      autofocus: autofocus,
      focusNode: focusNode,
      mouseCursor: mouseCursor,
    );
    
    // Add semantics
    if (semanticLabel != null) {
      checkbox = Semantics(
        label: semanticLabel,
        child: checkbox,
      );
    }
    
    // Add tooltip
    if (tooltip != null) {
      checkbox = Tooltip(
        message: tooltip!,
        child: checkbox,
      );
    }
    
    return checkbox;
  }
  
  /// Get onChanged callback
  ValueChanged<bool?>? _getOnChanged() {
    if (state == AuiCheckboxState.disabled) {
      return null;
    }
    return onChanged;
  }
  
  /// Get checkbox color
  Color _getCheckboxColor(AuiColorScheme colors) {
    if (isError) {
      return colors.error;
    }
    return color ?? colors.primary;
  }
  
  /// Get check color
  Color _getCheckColor(AuiColorScheme colors) {
    if (isError) {
      return colors.onError;
    }
    return checkColor ?? colors.onPrimary;
  }
  
  /// Get background color
  
  /// Get border color
  Color _getBorderColor(AuiColorScheme colors) {
    if (state == AuiCheckboxState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    if (isError) {
      return colors.error;
    }
    return borderColor ?? colors.outline;
  }
  
  /// Get checkbox size
  double _getCheckboxSize() {
    switch (size) {
      case AuiCheckboxSize.xs:
        return 16.0;
      case AuiCheckboxSize.sm:
        return 18.0;
      case AuiCheckboxSize.md:
        return 20.0;
      case AuiCheckboxSize.lg:
        return 22.0;
      case AuiCheckboxSize.xl:
        return 24.0;
    }
  }
  
  /// Get splash radius
  double _getSplashRadius() {
    switch (size) {
      case AuiCheckboxSize.xs:
        return 12.0;
      case AuiCheckboxSize.sm:
        return 14.0;
      case AuiCheckboxSize.md:
        return 16.0;
      case AuiCheckboxSize.lg:
        return 18.0;
      case AuiCheckboxSize.xl:
        return 20.0;
    }
  }
  
  /// Get checkbox shape
  OutlinedBorder? _getCheckboxShape() {
    if (shape != null) return shape;
    
    switch (variant) {
      case AuiCheckboxVariant.filled:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
      case AuiCheckboxVariant.outlined:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
      case AuiCheckboxVariant.rounded:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getCheckboxSize() / 2),
        );
    }
  }
  
  /// Get border radius
  double _getBorderRadius() {
    switch (size) {
      case AuiCheckboxSize.xs:
        return 2.0;
      case AuiCheckboxSize.sm:
        return 3.0;
      case AuiCheckboxSize.md:
        return 4.0;
      case AuiCheckboxSize.lg:
        return 5.0;
      case AuiCheckboxSize.xl:
        return 6.0;
    }
  }
  
  /// Get border width
  double _getBorderWidth() {
    switch (size) {
      case AuiCheckboxSize.xs:
        return 1.0;
      case AuiCheckboxSize.sm:
        return 1.0;
      case AuiCheckboxSize.md:
        return 1.5;
      case AuiCheckboxSize.lg:
        return 2.0;
      case AuiCheckboxSize.xl:
        return 2.0;
    }
  }
}

/// Checkbox with label component
class AuiCheckboxWithLabel extends StatelessWidget {
  const AuiCheckboxWithLabel({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.variant = AuiCheckboxVariant.filled,
    this.size = AuiCheckboxSize.md,
    this.state = AuiCheckboxState.enabled,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.overlayColor,
    this.semanticLabel,
    this.tooltip,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.shape,
    this.side,
    this.isError = false,
    this.tristate = false,
    this.labelStyle,
    this.spacing = 8.0,
    this.labelPosition = AuiCheckboxLabelPosition.end,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String label;
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final AuiCheckboxVariant variant;
  final AuiCheckboxSize size;
  final AuiCheckboxState state;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final String? semanticLabel;
  final String? tooltip;
  final bool autofocus;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final bool isError;
  final bool tristate;
  final TextStyle? labelStyle;
  final double spacing;
  final AuiCheckboxLabelPosition labelPosition;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final typography = theme.typography;
    
    final checkbox = AuiCheckbox(
      value: value,
      onChanged: onChanged,
      variant: variant,
      size: size,
      state: state,
      color: color,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      checkColor: checkColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      overlayColor: overlayColor,
      semanticLabel: semanticLabel,
      tooltip: tooltip,
      autofocus: autofocus,
      focusNode: focusNode,
      mouseCursor: mouseCursor,
      materialTapTargetSize: materialTapTargetSize,
      visualDensity: visualDensity,
      shape: shape,
      side: side,
      isError: isError,
      tristate: tristate,
    );
    
    final labelWidget = Text(
      label,
      style: labelStyle ?? typography.bodyMedium.copyWith(
        color: state == AuiCheckboxState.disabled 
            ? colors.outline.withValues(alpha:0.38)
            : colors.onSurface,
      ),
    );
    
    if (labelPosition == AuiCheckboxLabelPosition.start) {
      return Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          labelWidget,
          SizedBox(width: spacing),
          checkbox,
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          checkbox,
          SizedBox(width: spacing),
          labelWidget,
        ],
      );
    }
  }
}

/// Checkbox label position
enum AuiCheckboxLabelPosition {
  start,
  end,
}

/// Checkbox utilities
class AuiCheckboxUtils {
  const AuiCheckboxUtils._();
  
  /// Get checkbox size from enum
  static double getCheckboxSize(AuiCheckboxSize size) {
    switch (size) {
      case AuiCheckboxSize.xs:
        return 16.0;
      case AuiCheckboxSize.sm:
        return 18.0;
      case AuiCheckboxSize.md:
        return 20.0;
      case AuiCheckboxSize.lg:
        return 22.0;
      case AuiCheckboxSize.xl:
        return 24.0;
    }
  }
  
  /// Get border radius for size
  static double getBorderRadius(AuiCheckboxSize size) {
    switch (size) {
      case AuiCheckboxSize.xs:
        return 2.0;
      case AuiCheckboxSize.sm:
        return 3.0;
      case AuiCheckboxSize.md:
        return 4.0;
      case AuiCheckboxSize.lg:
        return 5.0;
      case AuiCheckboxSize.xl:
        return 6.0;
    }
  }
  
  /// Get splash radius for size
  static double getSplashRadius(AuiCheckboxSize size) {
    switch (size) {
      case AuiCheckboxSize.xs:
        return 12.0;
      case AuiCheckboxSize.sm:
        return 14.0;
      case AuiCheckboxSize.md:
        return 16.0;
      case AuiCheckboxSize.lg:
        return 18.0;
      case AuiCheckboxSize.xl:
        return 20.0;
    }
  }
}
