import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Switch variants
enum AuiSwitchVariant {
  filled,
  outlined,
  rounded,
}

/// Switch sizes
enum AuiSwitchSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Switch states
enum AuiSwitchState {
  enabled,
  disabled,
  on,
  off,
}

/// A comprehensive switch component
class AuiSwitch extends StatelessWidget {
  const AuiSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.variant = AuiSwitchVariant.filled,
    this.size = AuiSwitchSize.md,
    this.state = AuiSwitchState.enabled,
    this.activeColor,
    this.inactiveColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.hoverColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.overlayColor,
    this.semanticLabel,
    this.tooltip,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final AuiSwitchVariant variant;
  final AuiSwitchSize size;
  final AuiSwitchState state;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Color? hoverColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final WidgetStateProperty<Color?>? overlayColor;
  final String? semanticLabel;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    
    // Get switch colors
    final switchActiveColor = _getActiveColor(colors);
    final switchActiveTrackColor = _getActiveTrackColor(colors);
    final switchInactiveTrackColor = _getInactiveTrackColor(colors);
    final switchActiveThumbColor = _getActiveThumbColor(colors);
    final switchInactiveThumbColor = _getInactiveThumbColor(colors);
    
    Widget switchWidget = Switch(
      value: value,
      onChanged: _getOnChanged(),
      activeColor: switchActiveColor,
      inactiveThumbColor: switchInactiveThumbColor,
      inactiveTrackColor: switchInactiveTrackColor,
      activeTrackColor: switchActiveTrackColor,
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return switchActiveThumbColor;
        }
        return switchInactiveThumbColor;
      }),
      hoverColor: hoverColor ?? colors.primary.withValues(alpha:0.08),
      splashRadius: splashRadius ?? _getSplashRadius(),
      materialTapTargetSize: materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
      dragStartBehavior: dragStartBehavior,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      autofocus: autofocus,
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
    );
    
    // Add semantics
    if (semanticLabel != null) {
      switchWidget = Semantics(
        label: semanticLabel,
        child: switchWidget,
      );
    }
    
    // Add tooltip
    if (tooltip != null) {
      switchWidget = Tooltip(
        message: tooltip!,
        child: switchWidget,
      );
    }
    
    return switchWidget;
  }
  
  /// Get onChanged callback
  ValueChanged<bool>? _getOnChanged() {
    if (state == AuiSwitchState.disabled) {
      return null;
    }
    return onChanged;
  }
  
  /// Get active color
  Color _getActiveColor(AuiColorScheme colors) {
    return activeColor ?? colors.primary;
  }
  
  /// Get inactive color
  
  /// Get active track color
  Color _getActiveTrackColor(AuiColorScheme colors) {
    return activeTrackColor ?? colors.primary.withValues(alpha:0.5);
  }
  
  /// Get inactive track color
  Color _getInactiveTrackColor(AuiColorScheme colors) {
    if (state == AuiSwitchState.disabled) {
      return colors.surfaceVariant;
    }
    return inactiveTrackColor ?? colors.surfaceVariant;
  }
  
  /// Get active thumb color
  Color _getActiveThumbColor(AuiColorScheme colors) {
    return activeThumbColor ?? colors.onPrimary;
  }
  
  /// Get inactive thumb color
  Color _getInactiveThumbColor(AuiColorScheme colors) {
    if (state == AuiSwitchState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    return inactiveThumbColor ?? colors.surface;
  }
  
  /// Get switch size
  
  /// Get splash radius
  double _getSplashRadius() {
    switch (size) {
      case AuiSwitchSize.xs:
        return 16.0;
      case AuiSwitchSize.sm:
        return 18.0;
      case AuiSwitchSize.md:
        return 20.0;
      case AuiSwitchSize.lg:
        return 22.0;
      case AuiSwitchSize.xl:
        return 24.0;
    }
  }
}

/// Switch with label component
class AuiSwitchWithLabel extends StatelessWidget {
  const AuiSwitchWithLabel({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.variant = AuiSwitchVariant.filled,
    this.size = AuiSwitchSize.md,
    this.state = AuiSwitchState.enabled,
    this.activeColor,
    this.inactiveColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.hoverColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.overlayColor,
    this.semanticLabel,
    this.tooltip,
    this.labelStyle,
    this.spacing = 8.0,
    this.labelPosition = AuiSwitchLabelPosition.end,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final AuiSwitchVariant variant;
  final AuiSwitchSize size;
  final AuiSwitchState state;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Color? hoverColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final WidgetStateProperty<Color?>? overlayColor;
  final String? semanticLabel;
  final String? tooltip;
  final TextStyle? labelStyle;
  final double spacing;
  final AuiSwitchLabelPosition labelPosition;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final typography = theme.typography;
    
    final switchWidget = AuiSwitch(
      value: value,
      onChanged: onChanged,
      variant: variant,
      size: size,
      state: state,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      activeTrackColor: activeTrackColor,
      inactiveTrackColor: inactiveTrackColor,
      activeThumbColor: activeThumbColor,
      inactiveThumbColor: inactiveThumbColor,
      hoverColor: hoverColor,
      splashRadius: splashRadius,
      materialTapTargetSize: materialTapTargetSize,
      dragStartBehavior: dragStartBehavior,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      autofocus: autofocus,
      overlayColor: overlayColor,
      semanticLabel: semanticLabel,
      tooltip: tooltip,
    );
    
    final labelWidget = Text(
      label,
      style: labelStyle ?? typography.bodyMedium.copyWith(
        color: state == AuiSwitchState.disabled 
            ? colors.outline.withValues(alpha:0.38)
            : colors.onSurface,
      ),
    );
    
    if (labelPosition == AuiSwitchLabelPosition.start) {
      return Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          labelWidget,
          SizedBox(width: spacing),
          switchWidget,
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          switchWidget,
          SizedBox(width: spacing),
          labelWidget,
        ],
      );
    }
  }
}

/// Switch label position
enum AuiSwitchLabelPosition {
  start,
  end,
}

/// Switch utilities
class AuiSwitchUtils {
  const AuiSwitchUtils._();
  
  /// Get switch size from enum
  static double getSwitchSize(AuiSwitchSize size) {
    switch (size) {
      case AuiSwitchSize.xs:
        return 28.0;
      case AuiSwitchSize.sm:
        return 32.0;
      case AuiSwitchSize.md:
        return 36.0;
      case AuiSwitchSize.lg:
        return 40.0;
      case AuiSwitchSize.xl:
        return 44.0;
    }
  }
  
  /// Get splash radius for size
  static double getSplashRadius(AuiSwitchSize size) {
    switch (size) {
      case AuiSwitchSize.xs:
        return 16.0;
      case AuiSwitchSize.sm:
        return 18.0;
      case AuiSwitchSize.md:
        return 20.0;
      case AuiSwitchSize.lg:
        return 22.0;
      case AuiSwitchSize.xl:
        return 24.0;
    }
  }
  
  /// Get active color
  static Color getActiveColor(AuiColorScheme colors) {
    return colors.primary;
  }
  
  /// Get inactive color
  static Color getInactiveColor(AuiColorScheme colors) {
    return colors.outline;
  }
  
  /// Get active track color
  static Color getActiveTrackColor(AuiColorScheme colors) {
    return colors.primary.withValues(alpha:0.5);
  }
  
  /// Get inactive track color
  static Color getInactiveTrackColor(AuiColorScheme colors) {
    return colors.surfaceVariant;
  }
  
  /// Get active thumb color
  static Color getActiveThumbColor(AuiColorScheme colors) {
    return colors.onPrimary;
  }
  
  /// Get inactive thumb color
  static Color getInactiveThumbColor(AuiColorScheme colors) {
    return colors.surface;
  }
}
