import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Card variants
enum AuiCardVariant {
  filled,
  outlined,
  elevated,
  tonal,
}

/// Card sizes
enum AuiCardSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Card states
enum AuiCardState {
  enabled,
  disabled,
  pressed,
  hovered,
  focused,
  selected,
}

/// A comprehensive card component
class AuiCard extends StatefulWidget {
  const AuiCard({
    super.key,
    required this.child,
    this.variant = AuiCardVariant.elevated,
    this.size = AuiCardSize.md,
    this.state = AuiCardState.enabled,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onTertiaryTap,
    this.mouseCursor,
    this.clipBehavior = Clip.none,
    this.border,
    this.semantics,
    this.width,
    this.height,
    this.constraints,
    this.alignment,
    this.transform,
    this.transformAlignment,
  });

  final Widget child;
  final AuiCardVariant variant;
  final AuiCardSize size;
  final AuiCardState state;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onSecondaryTap;
  final VoidCallback? onTertiaryTap;
  final MouseCursor? mouseCursor;
  final Clip clipBehavior;
  final Border? border;
  final Semantics? semantics;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;

  @override
  State<AuiCard> createState() => _AuiCardState();
}

class _AuiCardState extends State<AuiCard> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get card colors
    final cardBackgroundColor = _getCardBackgroundColor(colors);
    final cardBorderColor = _getCardBorderColor(colors);
    
    // Get card elevation
    final cardElevation = _getCardElevation(elevation);
    
    // Get card border radius
    final cardBorderRadius = _getCardBorderRadius(spacing);
    
    // Get card padding
    final cardPadding = _getCardPadding(spacing);
    
    Widget card = Container(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      alignment: widget.alignment,
      transform: widget.transform,
      transformAlignment: widget.transformAlignment,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: cardBorderRadius,
        border: widget.border ?? (cardBorderColor != null 
            ? Border.all(color: cardBorderColor, width: 1.0)
            : null),
        boxShadow: _getCardShadows(colors, cardElevation),
      ),
      clipBehavior: widget.clipBehavior,
      child: Padding(
        padding: cardPadding,
        child: widget.child,
      ),
    );
    
    // Add tap functionality
    if (widget.onTap != null || 
        widget.onLongPress != null || 
        widget.onDoubleTap != null ||
        widget.onSecondaryTap != null) {
      card = GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onDoubleTap,
        onSecondaryTap: widget.onSecondaryTap,
        child: card,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      card = Padding(
        padding: widget.margin!,
        child: card,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      card = Semantics(
        label: widget.semanticLabel,
        child: card,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      card = Tooltip(
        message: widget.tooltip!,
        child: card,
      );
    }
    
    return card;
  }
  
  /// Get card color
  
  /// Get card background color
  Color _getCardBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiCardState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiCardVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiCardVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiCardVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiCardVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
    }
  }
  
  /// Get card border color
  Color? _getCardBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiCardState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiCardVariant.filled:
        return null;
      case AuiCardVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiCardVariant.elevated:
        return null;
      case AuiCardVariant.tonal:
        return null;
    }
  }
  
  /// Get card elevation
  double _getCardElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiCardVariant.filled:
        return elevation.level0;
      case AuiCardVariant.outlined:
        return elevation.level0;
      case AuiCardVariant.elevated:
        return elevation.level1;
      case AuiCardVariant.tonal:
        return elevation.level0;
    }
  }
  
  /// Get card border radius
  BorderRadius _getCardBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiCardSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiCardSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiCardSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiCardSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiCardSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get card padding
  EdgeInsets _getCardPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiCardSize.xs:
        return EdgeInsets.all(spacing.sm);
      case AuiCardSize.sm:
        return EdgeInsets.all(spacing.md);
      case AuiCardSize.md:
        return EdgeInsets.all(spacing.lg);
      case AuiCardSize.lg:
        return EdgeInsets.all(spacing.xl);
      case AuiCardSize.xl:
        return EdgeInsets.all(spacing.xxl);
    }
  }
  
  /// Get card shadows
  List<BoxShadow> _getCardShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.05),
        offset: Offset(0, elevation * 0.25),
        blurRadius: elevation,
        spreadRadius: 0,
      ),
    ];
  }
}

/// Card utilities
class AuiCardUtils {
  const AuiCardUtils._();
  
  /// Get card padding for size
  static EdgeInsets getCardPadding(AuiCardSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiCardSize.xs:
        return EdgeInsets.all(spacing.sm);
      case AuiCardSize.sm:
        return EdgeInsets.all(spacing.md);
      case AuiCardSize.md:
        return EdgeInsets.all(spacing.lg);
      case AuiCardSize.lg:
        return EdgeInsets.all(spacing.xl);
      case AuiCardSize.xl:
        return EdgeInsets.all(spacing.xxl);
    }
  }
  
  /// Get card border radius for size
  static double getCardBorderRadius(AuiCardSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiCardSize.xs:
        return spacing.xs;
      case AuiCardSize.sm:
        return spacing.sm;
      case AuiCardSize.md:
        return spacing.md;
      case AuiCardSize.lg:
        return spacing.lg;
      case AuiCardSize.xl:
        return spacing.xl;
    }
  }
  
  /// Get card elevation for variant
  static double getCardElevation(AuiCardVariant variant, AuiElevationScheme elevation) {
    switch (variant) {
      case AuiCardVariant.filled:
        return elevation.level0;
      case AuiCardVariant.outlined:
        return elevation.level0;
      case AuiCardVariant.elevated:
        return elevation.level1;
      case AuiCardVariant.tonal:
        return elevation.level0;
    }
  }
  
  /// Get card background color for variant
  static Color getCardBackgroundColor(AuiCardVariant variant, AuiColorScheme colors) {
    switch (variant) {
      case AuiCardVariant.filled:
        return colors.surface;
      case AuiCardVariant.outlined:
        return colors.surface;
      case AuiCardVariant.elevated:
        return colors.surface;
      case AuiCardVariant.tonal:
        return colors.surfaceVariant;
    }
  }
  
  /// Get card border color for variant
  static Color? getCardBorderColor(AuiCardVariant variant, AuiColorScheme colors) {
    switch (variant) {
      case AuiCardVariant.filled:
        return null;
      case AuiCardVariant.outlined:
        return colors.outline;
      case AuiCardVariant.elevated:
        return null;
      case AuiCardVariant.tonal:
        return null;
    }
  }
}
