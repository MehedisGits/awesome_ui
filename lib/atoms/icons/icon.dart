import 'package:flutter/material.dart';
import '../../foundation/theme.dart';
import '../../foundation/typography.dart';
import '../text/text.dart';

/// Icon variants for different use cases
enum AuiIconVariant {
  filled,
  outlined,
  rounded,
  sharp,
  twoTone,
}

/// Icon sizes
enum AuiIconSize {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

/// Icon emphasis levels
enum AuiIconEmphasis {
  high,
  medium,
  low,
  disabled,
}

/// A comprehensive icon component with multiple variants and responsive sizing
class AuiIcon extends StatelessWidget {
  const AuiIcon(
    this.icon, {
    super.key,
    this.variant = AuiIconVariant.filled,
    this.size = AuiIconSize.md,
    this.emphasis = AuiIconEmphasis.high,
    this.color,
    this.semanticLabel,
    this.textDirection,
    this.shadows,
    this.gradient,
  });

  final IconData icon;
  final AuiIconVariant variant;
  final AuiIconSize size;
  final AuiIconEmphasis emphasis;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Shadow>? shadows;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    
    // Get icon size
    final iconSize = _getIconSize(size);
    
    // Get icon color
    final iconColor = _getIconColor(emphasis, colors);
    
    // Apply responsive sizing
    final responsiveSize = _applyResponsiveSizing(iconSize, context);
    
    Widget iconWidget = Icon(
      icon,
      size: responsiveSize,
      color: color ?? iconColor,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      shadows: shadows,
    );
    
    // Apply gradient if provided
    if (gradient != null) {
      iconWidget = ShaderMask(
        shaderCallback: (bounds) => gradient!.createShader(bounds),
        child: iconWidget,
      );
    }
    
    return iconWidget;
  }
  
  /// Get icon size from enum
  double _getIconSize(AuiIconSize size) {
    switch (size) {
      case AuiIconSize.xs:
        return 12.0;
      case AuiIconSize.sm:
        return 16.0;
      case AuiIconSize.md:
        return 24.0;
      case AuiIconSize.lg:
        return 32.0;
      case AuiIconSize.xl:
        return 40.0;
      case AuiIconSize.xxl:
        return 48.0;
    }
  }
  
  /// Get icon color based on emphasis
  Color _getIconColor(AuiIconEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiIconEmphasis.high:
        return colors.onSurface;
      case AuiIconEmphasis.medium:
        return colors.onSurfaceVariant;
      case AuiIconEmphasis.low:
        return colors.outline;
      case AuiIconEmphasis.disabled:
        return colors.outline.withValues(alpha: 0.38);
    }
  }
  
  /// Apply responsive sizing
  double _applyResponsiveSizing(double baseSize, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AuiResponsiveTypography.getResponsiveFontSize(baseSize, screenWidth);
  }
}

/// Icon button component
class AuiIconButton extends StatefulWidget {
  const AuiIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AuiIconVariant.filled,
    this.size = AuiIconSize.md,
    this.emphasis = AuiIconEmphasis.high,
    this.color,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.tooltip,
    this.semanticLabel,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.focusColor,
    this.disabledColor,
    this.splashRadius,
    this.constraints,
    this.style,
    this.isSelected,
    this.selectedIcon,
    this.iconSize,
    this.visualDensity,
    this.animationDuration,
    this.enableFeedback = true,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final AuiIconVariant variant;
  final AuiIconSize size;
  final AuiIconEmphasis emphasis;
  final Color? color;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final String? tooltip;
  final String? semanticLabel;
  final bool autofocus;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? disabledColor;
  final double? splashRadius;
  final BoxConstraints? constraints;
  final ButtonStyle? style;
  final bool? isSelected;
  final IconData? selectedIcon;
  final double? iconSize;
  final VisualDensity? visualDensity;
  final Duration? animationDuration;
  final bool enableFeedback;

  @override
  State<AuiIconButton> createState() => _AuiIconButtonState();
}

class _AuiIconButtonState extends State<AuiIconButton> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    
    // Get icon size
    final iconSize = widget.iconSize ?? _getIconSize(widget.size);
    
    // Get icon color
    final iconColor = _getIconColor(widget.emphasis, colors);
    
    // Get button style
    final buttonStyle = _getButtonStyle(colors, spacing);
    
    Widget iconWidget = AuiIcon(
      widget.isSelected == true && widget.selectedIcon != null 
          ? widget.selectedIcon! 
          : widget.icon,
      variant: widget.variant,
      size: widget.size,
      emphasis: widget.emphasis,
      color: widget.color ?? iconColor,
      semanticLabel: widget.semanticLabel,
    );
    
    if (widget.tooltip != null) {
      iconWidget = Tooltip(
        message: widget.tooltip!,
        child: iconWidget,
      );
    }
    
    return IconButton(
      onPressed: widget.onPressed,
      icon: iconWidget,
      iconSize: iconSize,
      color: widget.color ?? iconColor,
      tooltip: widget.tooltip,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      mouseCursor: widget.mouseCursor,
      splashColor: widget.splashColor,
      highlightColor: widget.highlightColor,
      hoverColor: widget.hoverColor,
      focusColor: widget.focusColor,
      disabledColor: widget.disabledColor,
      splashRadius: widget.splashRadius,
      constraints: widget.constraints,
      style: buttonStyle,
      isSelected: widget.isSelected,
      visualDensity: widget.visualDensity,
      enableFeedback: widget.enableFeedback,
    );
  }
  
  /// Get icon size from enum
  double _getIconSize(AuiIconSize size) {
    switch (size) {
      case AuiIconSize.xs:
        return 12.0;
      case AuiIconSize.sm:
        return 16.0;
      case AuiIconSize.md:
        return 24.0;
      case AuiIconSize.lg:
        return 32.0;
      case AuiIconSize.xl:
        return 40.0;
      case AuiIconSize.xxl:
        return 48.0;
    }
  }
  
  /// Get icon color based on emphasis
  Color _getIconColor(AuiIconEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiIconEmphasis.high:
        return colors.onSurface;
      case AuiIconEmphasis.medium:
        return colors.onSurfaceVariant;
      case AuiIconEmphasis.low:
        return colors.outline;
      case AuiIconEmphasis.disabled:
        return colors.outline.withValues(alpha: 0.38);
    }
  }
  
  /// Get button style
  ButtonStyle _getButtonStyle(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return IconButton.styleFrom(
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.color ?? colors.onSurface,
      disabledBackgroundColor: colors.surfaceVariant,
      disabledForegroundColor: colors.outline.withValues(alpha: 0.38),
      padding: widget.padding ?? EdgeInsets.all(spacing.sm),
      shape: RoundedRectangleBorder(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(spacing.sm),
      ),
      side: BorderSide.none,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }
}

/// Icon with text component
class AuiIconWithText extends StatelessWidget {
  const AuiIconWithText({
    super.key,
    required this.icon,
    required this.text,
    this.iconPosition = AuiIconPosition.start,
    this.spacing = 8.0,
    this.iconSize = AuiIconSize.md,
    this.textVariant = AuiTextVariant.bodyMedium,
    this.iconEmphasis = AuiIconEmphasis.high,
    this.textEmphasis = AuiTextEmphasis.high,
    this.color,
    this.iconColor,
    this.textColor,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.tooltip,
  });

  final IconData icon;
  final String text;
  final AuiIconPosition iconPosition;
  final double spacing;
  final AuiIconSize iconSize;
  final AuiTextVariant textVariant;
  final AuiIconEmphasis iconEmphasis;
  final AuiTextEmphasis textEmphasis;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;
  final AuiTextAlign? textAlign;
  final AuiTextOverflow? overflow;
  final int? maxLines;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final iconWidget = AuiIcon(
      icon,
      size: iconSize,
      emphasis: iconEmphasis,
      color: iconColor ?? color,
    );
    
    final textWidget = AuiText(
      text,
      variant: textVariant,
      emphasis: textEmphasis,
      color: textColor ?? color,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
    
    Widget content;
    if (iconPosition == AuiIconPosition.start) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          SizedBox(width: spacing),
          textWidget,
        ],
      );
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          textWidget,
          SizedBox(width: spacing),
          iconWidget,
        ],
      );
    }
    
    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: content,
      );
    }
    
    return content;
  }
}

/// Icon position for icon with text
enum AuiIconPosition {
  start,
  end,
}

/// Icon utilities
class AuiIconUtils {
  const AuiIconUtils._();
  
  /// Get icon size from enum
  static double getIconSize(AuiIconSize size) {
    switch (size) {
      case AuiIconSize.xs:
        return 12.0;
      case AuiIconSize.sm:
        return 16.0;
      case AuiIconSize.md:
        return 24.0;
      case AuiIconSize.lg:
        return 32.0;
      case AuiIconSize.xl:
        return 40.0;
      case AuiIconSize.xxl:
        return 48.0;
    }
  }
  
  /// Get icon color for emphasis
  static Color getIconColor(AuiIconEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiIconEmphasis.high:
        return colors.onSurface;
      case AuiIconEmphasis.medium:
        return colors.onSurfaceVariant;
      case AuiIconEmphasis.low:
        return colors.outline;
      case AuiIconEmphasis.disabled:
        return colors.outline.withValues(alpha: 0.38);
    }
  }
  
  /// Get responsive icon size
  static double getResponsiveIconSize(AuiIconSize size, BuildContext context) {
    final baseSize = getIconSize(size);
    final screenWidth = MediaQuery.of(context).size.width;
    return AuiResponsiveTypography.getResponsiveFontSize(baseSize, screenWidth);
  }
}
