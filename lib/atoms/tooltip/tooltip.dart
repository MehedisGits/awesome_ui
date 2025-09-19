import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Tooltip variants
enum AuiTooltipVariant {
  filled,
  outlined,
  elevated,
  tonal,
}

/// Tooltip sizes
enum AuiTooltipSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Tooltip emphasis levels
enum AuiTooltipEmphasis {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
  neutral,
}

/// A comprehensive tooltip component
class AuiTooltip extends StatelessWidget {
  const AuiTooltip({
    super.key,
    required this.message,
    required this.child,
    this.variant = AuiTooltipVariant.filled,
    this.size = AuiTooltipSize.md,
    this.emphasis = AuiTooltipEmphasis.primary,
    this.color,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.margin,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.decoration,
    this.textAlign,
    this.textDirection,
    this.verticalOffset,
    this.preferBelow,
    this.triggerMode = TooltipTriggerMode.tap,
    this.enableFeedback = true,
    this.waitDuration,
    this.showDuration,
    this.tooltipPosition,
  });

  final String message;
  final Widget child;
  final AuiTooltipVariant variant;
  final AuiTooltipSize size;
  final AuiTooltipEmphasis emphasis;
  final Color? color;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final Decoration? decoration;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double? verticalOffset;
  final bool? preferBelow;
  final TooltipTriggerMode triggerMode;
  final bool enableFeedback;
  final Duration? waitDuration;
  final Duration? showDuration;
  final Offset? tooltipPosition;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get tooltip colors
    final tooltipColor = _getTooltipColor(colors);
    final tooltipBackgroundColor = _getTooltipBackgroundColor(colors);
    
    // Get tooltip padding
    final tooltipPadding = _getTooltipPadding(spacing);
    
    // Get tooltip border radius
    final tooltipBorderRadius = _getTooltipBorderRadius(spacing);
    
    // Get tooltip elevation
    final tooltipElevation = _getTooltipElevation(elevation);
    
    return Tooltip(
      message: message,
      decoration: decoration ?? BoxDecoration(
        color: backgroundColor ?? tooltipBackgroundColor,
        borderRadius: borderRadius ?? tooltipBorderRadius,
        boxShadow: _getTooltipShadows(colors, tooltipElevation),
      ),
      textStyle: textStyle ?? TextStyle(
        color: color ?? tooltipColor,
        fontSize: _getTooltipFontSize(),
      ),
      padding: padding ?? tooltipPadding,
      margin: margin,
      height: _getTooltipHeight(),
      verticalOffset: verticalOffset ?? _getTooltipVerticalOffset(),
      preferBelow: preferBelow ?? true,
      triggerMode: triggerMode,
      enableFeedback: enableFeedback,
      waitDuration: waitDuration ?? _getTooltipWaitDuration(),
      showDuration: showDuration ?? _getTooltipShowDuration(),
      excludeFromSemantics: excludeFromSemantics,
      textAlign: textAlign,
      child: child,
    );
  }
  
  /// Get tooltip color based on emphasis
  Color _getTooltipColor(AuiColorScheme colors) {
    switch (emphasis) {
      case AuiTooltipEmphasis.primary:
        return colors.onPrimary;
      case AuiTooltipEmphasis.secondary:
        return colors.onSecondary;
      case AuiTooltipEmphasis.success:
        return colors.onSuccess;
      case AuiTooltipEmphasis.warning:
        return colors.onWarning;
      case AuiTooltipEmphasis.error:
        return colors.onError;
      case AuiTooltipEmphasis.info:
        return colors.onInfo;
      case AuiTooltipEmphasis.neutral:
        return colors.onSurface;
    }
  }
  
  /// Get tooltip background color based on variant and emphasis
  Color _getTooltipBackgroundColor(AuiColorScheme colors) {
    switch (variant) {
      case AuiTooltipVariant.filled:
        return _getEmphasisColor(colors);
      case AuiTooltipVariant.outlined:
        return colors.surface;
      case AuiTooltipVariant.elevated:
        return _getEmphasisColor(colors);
      case AuiTooltipVariant.tonal:
        return _getEmphasisColor(colors).withValues(alpha:0.12);
    }
  }
  
  /// Get emphasis color
  Color _getEmphasisColor(AuiColorScheme colors) {
    switch (emphasis) {
      case AuiTooltipEmphasis.primary:
        return colors.primary;
      case AuiTooltipEmphasis.secondary:
        return colors.secondary;
      case AuiTooltipEmphasis.success:
        return colors.success;
      case AuiTooltipEmphasis.warning:
        return colors.warning;
      case AuiTooltipEmphasis.error:
        return colors.error;
      case AuiTooltipEmphasis.info:
        return colors.info;
      case AuiTooltipEmphasis.neutral:
        return colors.outline;
    }
  }
  
  /// Get tooltip padding based on size
  EdgeInsets _getTooltipPadding(AuiSpacingScheme spacing) {
    switch (size) {
      case AuiTooltipSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.xs, vertical: spacing.micro);
      case AuiTooltipSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.nano);
      case AuiTooltipSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiTooltipSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiTooltipSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
    }
  }
  
  /// Get tooltip border radius based on size
  BorderRadius _getTooltipBorderRadius(AuiSpacingScheme spacing) {
    switch (size) {
      case AuiTooltipSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiTooltipSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiTooltipSize.md:
        return BorderRadius.circular(spacing.sm);
      case AuiTooltipSize.lg:
        return BorderRadius.circular(spacing.md);
      case AuiTooltipSize.xl:
        return BorderRadius.circular(spacing.md);
    }
  }
  
  /// Get tooltip elevation based on variant
  double _getTooltipElevation(AuiElevationScheme elevation) {
    switch (variant) {
      case AuiTooltipVariant.filled:
        return elevation.level1;
      case AuiTooltipVariant.outlined:
        return elevation.level0;
      case AuiTooltipVariant.elevated:
        return elevation.level2;
      case AuiTooltipVariant.tonal:
        return elevation.level1;
    }
  }
  
  /// Get tooltip font size based on size
  double _getTooltipFontSize() {
    switch (size) {
      case AuiTooltipSize.xs:
        return 10.0;
      case AuiTooltipSize.sm:
        return 11.0;
      case AuiTooltipSize.md:
        return 12.0;
      case AuiTooltipSize.lg:
        return 13.0;
      case AuiTooltipSize.xl:
        return 14.0;
    }
  }
  
  /// Get tooltip height based on size
  double _getTooltipHeight() {
    switch (size) {
      case AuiTooltipSize.xs:
        return 20.0;
      case AuiTooltipSize.sm:
        return 24.0;
      case AuiTooltipSize.md:
        return 28.0;
      case AuiTooltipSize.lg:
        return 32.0;
      case AuiTooltipSize.xl:
        return 36.0;
    }
  }
  
  /// Get tooltip vertical offset
  double _getTooltipVerticalOffset() {
    switch (size) {
      case AuiTooltipSize.xs:
        return 8.0;
      case AuiTooltipSize.sm:
        return 10.0;
      case AuiTooltipSize.md:
        return 12.0;
      case AuiTooltipSize.lg:
        return 14.0;
      case AuiTooltipSize.xl:
        return 16.0;
    }
  }
  
  /// Get tooltip wait duration
  Duration _getTooltipWaitDuration() {
    return const Duration(milliseconds: 500);
  }
  
  /// Get tooltip show duration
  Duration _getTooltipShowDuration() {
    return const Duration(milliseconds: 2000);
  }
  
  /// Get tooltip shadows
  List<BoxShadow> _getTooltipShadows(AuiColorScheme colors, double elevation) {
    return [
      BoxShadow(
        color: colors.shadow.withValues(alpha:0.1),
        offset: const Offset(0, 2),
        blurRadius: 4,
        spreadRadius: 0,
      ),
      BoxShadow(
        color: colors.shadow.withValues(alpha:0.05),
        offset: const Offset(0, 1),
        blurRadius: 2,
        spreadRadius: 0,
      ),
    ];
  }
}

/// Tooltip utilities
class AuiTooltipUtils {
  const AuiTooltipUtils._();
  
  /// Get tooltip size from enum
  static double getTooltipSize(AuiTooltipSize size) {
    switch (size) {
      case AuiTooltipSize.xs:
        return 20.0;
      case AuiTooltipSize.sm:
        return 24.0;
      case AuiTooltipSize.md:
        return 28.0;
      case AuiTooltipSize.lg:
        return 32.0;
      case AuiTooltipSize.xl:
        return 36.0;
    }
  }
  
  /// Get tooltip font size
  static double getTooltipFontSize(AuiTooltipSize size) {
    switch (size) {
      case AuiTooltipSize.xs:
        return 10.0;
      case AuiTooltipSize.sm:
        return 11.0;
      case AuiTooltipSize.md:
        return 12.0;
      case AuiTooltipSize.lg:
        return 13.0;
      case AuiTooltipSize.xl:
        return 14.0;
    }
  }
  
  /// Get tooltip color for emphasis
  static Color getTooltipColor(AuiTooltipEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiTooltipEmphasis.primary:
        return colors.onPrimary;
      case AuiTooltipEmphasis.secondary:
        return colors.onSecondary;
      case AuiTooltipEmphasis.success:
        return colors.onSuccess;
      case AuiTooltipEmphasis.warning:
        return colors.onWarning;
      case AuiTooltipEmphasis.error:
        return colors.onError;
      case AuiTooltipEmphasis.info:
        return colors.onInfo;
      case AuiTooltipEmphasis.neutral:
        return colors.onSurface;
    }
  }
  
  /// Get tooltip background color
  static Color getTooltipBackgroundColor(AuiTooltipVariant variant, AuiTooltipEmphasis emphasis, AuiColorScheme colors) {
    final emphasisColor = _getEmphasisColor(emphasis, colors);
    
    switch (variant) {
      case AuiTooltipVariant.filled:
        return emphasisColor;
      case AuiTooltipVariant.outlined:
        return colors.surface;
      case AuiTooltipVariant.elevated:
        return emphasisColor;
      case AuiTooltipVariant.tonal:
        return emphasisColor.withValues(alpha:0.12);
    }
  }
  
  /// Get emphasis color
  static Color _getEmphasisColor(AuiTooltipEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiTooltipEmphasis.primary:
        return colors.primary;
      case AuiTooltipEmphasis.secondary:
        return colors.secondary;
      case AuiTooltipEmphasis.success:
        return colors.success;
      case AuiTooltipEmphasis.warning:
        return colors.warning;
      case AuiTooltipEmphasis.error:
        return colors.error;
      case AuiTooltipEmphasis.info:
        return colors.info;
      case AuiTooltipEmphasis.neutral:
        return colors.outline;
    }
  }
}
