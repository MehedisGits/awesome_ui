import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Progress indicator variants
enum AuiProgressVariant {
  linear,
  circular,
  circularDeterminate,
  circularIndeterminate,
}

/// Progress indicator sizes
enum AuiProgressSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Progress indicator emphasis levels
enum AuiProgressEmphasis {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
  neutral,
}

/// Progress indicator states
enum AuiProgressState {
  determinate,
  indeterminate,
  paused,
  completed,
  error,
}

/// A comprehensive progress indicator component
class AuiProgress extends StatelessWidget {
  const AuiProgress({
    super.key,
    this.value,
    this.variant = AuiProgressVariant.linear,
    this.size = AuiProgressSize.md,
    this.emphasis = AuiProgressEmphasis.primary,
    this.state = AuiProgressState.determinate,
    this.color,
    this.backgroundColor,
    this.strokeWidth,
    this.borderRadius,
    this.semanticLabel,
    this.semanticValue,
    this.minHeight,
    this.maxHeight,
    this.animationDuration,
    this.animationCurve,
  });

  final double? value;
  final AuiProgressVariant variant;
  final AuiProgressSize size;
  final AuiProgressEmphasis emphasis;
  final AuiProgressState state;
  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth;
  final BorderRadius? borderRadius;
  final String? semanticLabel;
  final String? semanticValue;
  final double? minHeight;
  final double? maxHeight;
  final Duration? animationDuration;
  final Curve? animationCurve;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    
    // Get progress colors
    final progressColor = _getProgressColor(colors);
    final progressBackgroundColor = _getProgressBackgroundColor(colors);
    
    // Get progress size
    final progressSize = _getProgressSize();
    
    // Get stroke width
    final progressStrokeWidth = _getStrokeWidth();
    
    // Get animation duration
    final progressAnimationDuration = _getAnimationDuration();
    
    // Get animation curve
    final progressAnimationCurve = _getAnimationCurve();
    
    Widget progressWidget;
    
    switch (variant) {
      case AuiProgressVariant.linear:
        progressWidget = _buildLinearProgress(
          progressColor,
          progressBackgroundColor,
          progressSize,
          progressAnimationDuration,
          progressAnimationCurve,
        );
        break;
      case AuiProgressVariant.circular:
        progressWidget = _buildCircularProgress(
          progressColor,
          progressBackgroundColor,
          progressSize,
          progressStrokeWidth,
          progressAnimationDuration,
          progressAnimationCurve,
        );
        break;
      case AuiProgressVariant.circularDeterminate:
        progressWidget = _buildCircularDeterminateProgress(
          progressColor,
          progressBackgroundColor,
          progressSize,
          progressStrokeWidth,
          progressAnimationDuration,
          progressAnimationCurve,
        );
        break;
      case AuiProgressVariant.circularIndeterminate:
        progressWidget = _buildCircularIndeterminateProgress(
          progressColor,
          progressBackgroundColor,
          progressSize,
          progressStrokeWidth,
          progressAnimationDuration,
          progressAnimationCurve,
        );
        break;
    }
    
    // Add semantics
    if (semanticLabel != null || semanticValue != null) {
      progressWidget = Semantics(
        label: semanticLabel,
        value: semanticValue,
        child: progressWidget,
      );
    }
    
    return progressWidget;
  }
  
  /// Build linear progress indicator
  Widget _buildLinearProgress(
    Color progressColor,
    Color progressBackgroundColor,
    double progressSize,
    Duration animationDuration,
    Curve animationCurve,
  ) {
    return SizedBox(
      height: progressSize,
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: backgroundColor ?? progressBackgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? progressColor),
        minHeight: minHeight ?? progressSize,
        semanticsLabel: semanticLabel,
        semanticsValue: semanticValue,
      ),
    );
  }
  
  /// Build circular progress indicator
  Widget _buildCircularProgress(
    Color progressColor,
    Color progressBackgroundColor,
    double progressSize,
    double progressStrokeWidth,
    Duration animationDuration,
    Curve animationCurve,
  ) {
    return SizedBox(
      width: progressSize,
      height: progressSize,
      child: CircularProgressIndicator(
        value: value,
        backgroundColor: backgroundColor ?? progressBackgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? progressColor),
        strokeWidth: progressStrokeWidth,
        semanticsLabel: semanticLabel,
        semanticsValue: semanticValue,
      ),
    );
  }
  
  /// Build circular determinate progress indicator
  Widget _buildCircularDeterminateProgress(
    Color progressColor,
    Color progressBackgroundColor,
    double progressSize,
    double progressStrokeWidth,
    Duration animationDuration,
    Curve animationCurve,
  ) {
    return SizedBox(
      width: progressSize,
      height: progressSize,
      child: CircularProgressIndicator(
        value: value ?? 0.0,
        backgroundColor: backgroundColor ?? progressBackgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? progressColor),
        strokeWidth: progressStrokeWidth,
        semanticsLabel: semanticLabel,
        semanticsValue: semanticValue,
      ),
    );
  }
  
  /// Build circular indeterminate progress indicator
  Widget _buildCircularIndeterminateProgress(
    Color progressColor,
    Color progressBackgroundColor,
    double progressSize,
    double progressStrokeWidth,
    Duration animationDuration,
    Curve animationCurve,
  ) {
    return SizedBox(
      width: progressSize,
      height: progressSize,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor ?? progressBackgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? progressColor),
        strokeWidth: progressStrokeWidth,
        semanticsLabel: semanticLabel,
        semanticsValue: semanticValue,
      ),
    );
  }
  
  /// Get progress color based on emphasis
  Color _getProgressColor(AuiColorScheme colors) {
    switch (emphasis) {
      case AuiProgressEmphasis.primary:
        return colors.primary;
      case AuiProgressEmphasis.secondary:
        return colors.secondary;
      case AuiProgressEmphasis.success:
        return colors.success;
      case AuiProgressEmphasis.warning:
        return colors.warning;
      case AuiProgressEmphasis.error:
        return colors.error;
      case AuiProgressEmphasis.info:
        return colors.info;
      case AuiProgressEmphasis.neutral:
        return colors.outline;
    }
  }
  
  /// Get progress background color
  Color _getProgressBackgroundColor(AuiColorScheme colors) {
    return backgroundColor ?? colors.surfaceVariant;
  }
  
  /// Get progress size based on size enum
  double _getProgressSize() {
    switch (size) {
      case AuiProgressSize.xs:
        return 4.0;
      case AuiProgressSize.sm:
        return 6.0;
      case AuiProgressSize.md:
        return 8.0;
      case AuiProgressSize.lg:
        return 12.0;
      case AuiProgressSize.xl:
        return 16.0;
    }
  }
  
  /// Get stroke width for circular progress
  double _getStrokeWidth() {
    if (strokeWidth != null) return strokeWidth!;
    
    switch (size) {
      case AuiProgressSize.xs:
        return 2.0;
      case AuiProgressSize.sm:
        return 3.0;
      case AuiProgressSize.md:
        return 4.0;
      case AuiProgressSize.lg:
        return 6.0;
      case AuiProgressSize.xl:
        return 8.0;
    }
  }
  
  /// Get animation duration
  Duration _getAnimationDuration() {
    return animationDuration ?? const Duration(milliseconds: 300);
  }
  
  /// Get animation curve
  Curve _getAnimationCurve() {
    return animationCurve ?? Curves.easeInOut;
  }
}

/// Progress with label component
class AuiProgressWithLabel extends StatelessWidget {
  const AuiProgressWithLabel({
    super.key,
    required this.label,
    this.value,
    this.variant = AuiProgressVariant.linear,
    this.size = AuiProgressSize.md,
    this.emphasis = AuiProgressEmphasis.primary,
    this.state = AuiProgressState.determinate,
    this.color,
    this.backgroundColor,
    this.strokeWidth,
    this.borderRadius,
    this.semanticLabel,
    this.semanticValue,
    this.minHeight,
    this.maxHeight,
    this.animationDuration,
    this.animationCurve,
    this.labelStyle,
    this.labelPosition = AuiProgressLabelPosition.top,
    this.showPercentage = false,
    this.spacing = 8.0,
  });

  final String label;
  final double? value;
  final AuiProgressVariant variant;
  final AuiProgressSize size;
  final AuiProgressEmphasis emphasis;
  final AuiProgressState state;
  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth;
  final BorderRadius? borderRadius;
  final String? semanticLabel;
  final String? semanticValue;
  final double? minHeight;
  final double? maxHeight;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final TextStyle? labelStyle;
  final AuiProgressLabelPosition labelPosition;
  final bool showPercentage;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final typography = theme.typography;
    
    final progressWidget = AuiProgress(
      value: value,
      variant: variant,
      size: size,
      emphasis: emphasis,
      state: state,
      color: color,
      backgroundColor: backgroundColor,
      strokeWidth: strokeWidth,
      borderRadius: borderRadius,
      semanticLabel: semanticLabel,
      semanticValue: semanticValue,
      minHeight: minHeight,
      maxHeight: maxHeight,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
    );
    
    final labelWidget = Text(
      showPercentage && value != null 
          ? '$label ${(value! * 100).round()}%'
          : label,
      style: labelStyle ?? typography.bodySmall,
    );
    
    if (labelPosition == AuiProgressLabelPosition.top) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          labelWidget,
          SizedBox(height: spacing),
          progressWidget,
        ],
      );
    } else if (labelPosition == AuiProgressLabelPosition.bottom) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          progressWidget,
          SizedBox(height: spacing),
          labelWidget,
        ],
      );
    } else if (labelPosition == AuiProgressLabelPosition.left) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          labelWidget,
          SizedBox(width: spacing),
          Expanded(child: progressWidget),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: progressWidget),
          SizedBox(width: spacing),
          labelWidget,
        ],
      );
    }
  }
}

/// Progress label position
enum AuiProgressLabelPosition {
  top,
  bottom,
  left,
  right,
}

/// Progress utilities
class AuiProgressUtils {
  const AuiProgressUtils._();
  
  /// Get progress size from enum
  static double getProgressSize(AuiProgressSize size) {
    switch (size) {
      case AuiProgressSize.xs:
        return 4.0;
      case AuiProgressSize.sm:
        return 6.0;
      case AuiProgressSize.md:
        return 8.0;
      case AuiProgressSize.lg:
        return 12.0;
      case AuiProgressSize.xl:
        return 16.0;
    }
  }
  
  /// Get stroke width for circular progress
  static double getStrokeWidth(AuiProgressSize size) {
    switch (size) {
      case AuiProgressSize.xs:
        return 2.0;
      case AuiProgressSize.sm:
        return 3.0;
      case AuiProgressSize.md:
        return 4.0;
      case AuiProgressSize.lg:
        return 6.0;
      case AuiProgressSize.xl:
        return 8.0;
    }
  }
  
  /// Get progress color for emphasis
  static Color getProgressColor(AuiProgressEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiProgressEmphasis.primary:
        return colors.primary;
      case AuiProgressEmphasis.secondary:
        return colors.secondary;
      case AuiProgressEmphasis.success:
        return colors.success;
      case AuiProgressEmphasis.warning:
        return colors.warning;
      case AuiProgressEmphasis.error:
        return colors.error;
      case AuiProgressEmphasis.info:
        return colors.info;
      case AuiProgressEmphasis.neutral:
        return colors.outline;
    }
  }
  
  /// Get progress background color
  static Color getProgressBackgroundColor(AuiColorScheme colors) {
    return colors.surfaceVariant;
  }
  
  /// Format percentage value
  static String formatPercentage(double value) {
    return '${(value * 100).round()}%';
  }
  
  /// Format progress value
  static String formatProgressValue(double value, {int decimals = 1}) {
    return value.toStringAsFixed(decimals);
  }
}
