import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Stat tile variants
enum AuiStatTileVariant {
  filled,
  outlined,
  elevated,
  tonal,
}

/// Stat tile sizes
enum AuiStatTileSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Stat tile states
enum AuiStatTileState {
  enabled,
  disabled,
  pressed,
  hovered,
  focused,
  selected,
}

/// Stat tile types
enum AuiStatTileType {
  metric,
  percentage,
  currency,
  count,
  trend,
  custom,
}

/// A comprehensive stat tile component
class AuiStatTile extends StatefulWidget {
  const AuiStatTile({
    super.key,
    required this.value,
    this.label,
    this.subtitle,
    this.description,
    this.icon,
    this.iconData,
    this.trend,
    this.trendValue,
    this.trendLabel,
    this.unit,
    this.prefix,
    this.suffix,
    this.variant = AuiStatTileVariant.filled,
    this.size = AuiStatTileSize.md,
    this.state = AuiStatTileState.enabled,
    this.type = AuiStatTileType.metric,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.valueColor,
    this.labelColor,
    this.subtitleColor,
    this.descriptionColor,
    this.trendColor,
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
    this.mouseCursor,
    this.alignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing,
    this.iconSize,
    this.valueStyle,
    this.labelStyle,
    this.subtitleStyle,
    this.descriptionStyle,
    this.trendStyle,
    this.width,
    this.height,
    this.constraints,
    this.gradient,
    this.badge,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
  });

  final String value;
  final String? label;
  final String? subtitle;
  final String? description;
  final Widget? icon;
  final IconData? iconData;
  final double? trend;
  final String? trendValue;
  final String? trendLabel;
  final String? unit;
  final String? prefix;
  final String? suffix;
  final AuiStatTileVariant variant;
  final AuiStatTileSize size;
  final AuiStatTileState state;
  final AuiStatTileType type;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? valueColor;
  final Color? labelColor;
  final Color? subtitleColor;
  final Color? descriptionColor;
  final Color? trendColor;
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
  final MouseCursor? mouseCursor;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? spacing;
  final double? iconSize;
  final TextStyle? valueStyle;
  final TextStyle? labelStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? trendStyle;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Gradient? gradient;
  final Widget? badge;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;

  @override
  State<AuiStatTile> createState() => _AuiStatTileState();
}

class _AuiStatTileState extends State<AuiStatTile> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    final typography = theme.typography;
    
    // Get stat tile colors
    final statTileBackgroundColor = _getStatTileBackgroundColor(colors);
    final statTileBorderColor = _getStatTileBorderColor(colors);
    final statTileIconColor = _getStatTileIconColor(colors);
    final statTileValueColor = _getStatTileValueColor(colors);
    final statTileLabelColor = _getStatTileLabelColor(colors);
    final statTileSubtitleColor = _getStatTileSubtitleColor(colors);
    final statTileDescriptionColor = _getStatTileDescriptionColor(colors);
    final statTileTrendColor = _getStatTileTrendColor(colors);
    
    // Get stat tile spacing
    final statTileSpacing = _getStatTileSpacing(spacing);
    final statTilePadding = _getStatTilePadding(spacing);
    
    // Get stat tile border radius
    final statTileBorderRadius = _getStatTileBorderRadius(spacing);
    
    // Get stat tile elevation
    final statTileElevation = _getStatTileElevation(elevation);
    
    // Get icon widget
    final iconWidget = _getIconWidget(statTileIconColor);
    
    // Get value widget
    final valueWidget = _getValueWidget(typography, statTileValueColor);
    
    // Get label widget
    final labelWidget = _getLabelWidget(typography, statTileLabelColor);
    
    // Get subtitle widget
    final subtitleWidget = _getSubtitleWidget(typography, statTileSubtitleColor);
    
    // Get description widget
    final descriptionWidget = _getDescriptionWidget(typography, statTileDescriptionColor);
    
    // Get trend widget
    final trendWidget = _getTrendWidget(typography, statTileTrendColor);
    
    Widget statTile = Container(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      padding: statTilePadding,
      decoration: BoxDecoration(
        color: statTileBackgroundColor,
        borderRadius: statTileBorderRadius,
        border: statTileBorderColor != null 
            ? Border.all(color: statTileBorderColor, width: 1.0)
            : null,
        gradient: widget.gradient,
        boxShadow: _getStatTileShadows(colors, statTileElevation),
      ),
      child: Column(
        mainAxisAlignment: widget.alignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: [
          if (iconWidget != null) ...[
            iconWidget,
            SizedBox(height: statTileSpacing),
          ],
          valueWidget,
          if (labelWidget != null) ...[
            SizedBox(height: statTileSpacing * 0.5),
            labelWidget,
          ],
          if (subtitleWidget != null) ...[
            SizedBox(height: statTileSpacing * 0.25),
            subtitleWidget,
          ],
          if (descriptionWidget != null) ...[
            SizedBox(height: statTileSpacing * 0.25),
            descriptionWidget,
          ],
          if (trendWidget != null) ...[
            SizedBox(height: statTileSpacing * 0.5),
            trendWidget,
          ],
        ],
      ),
    );
    
    // Add badge if provided
    if (widget.badge != null) {
      statTile = Stack(
        clipBehavior: Clip.none,
        children: [
          statTile,
          Positioned(
            right: widget.badgeOffset?.dx ?? _getBadgeOffset(),
            top: widget.badgeOffset?.dy ?? _getBadgeOffset(),
            child: widget.badge!,
          ),
        ],
      );
    }
    
    // Add tap functionality
    if (widget.onTap != null || widget.onLongPress != null || widget.onDoubleTap != null) {
      statTile = GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onDoubleTap,
        child: statTile,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      statTile = Padding(
        padding: widget.margin!,
        child: statTile,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      statTile = Semantics(
        label: widget.semanticLabel,
        child: statTile,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      statTile = Tooltip(
        message: widget.tooltip!,
        child: statTile,
      );
    }
    
    return statTile;
  }
  
  /// Get stat tile background color
  Color _getStatTileBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiStatTileVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiStatTileVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiStatTileVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiStatTileVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
    }
  }
  
  /// Get stat tile border color
  Color? _getStatTileBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiStatTileVariant.filled:
        return null;
      case AuiStatTileVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiStatTileVariant.elevated:
        return null;
      case AuiStatTileVariant.tonal:
        return null;
    }
  }
  
  /// Get stat tile icon color
  Color _getStatTileIconColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.iconColor ?? colors.primary;
  }
  
  /// Get stat tile value color
  Color _getStatTileValueColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.valueColor ?? colors.onSurface;
  }
  
  /// Get stat tile label color
  Color _getStatTileLabelColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.labelColor ?? colors.onSurfaceVariant;
  }
  
  /// Get stat tile subtitle color
  Color _getStatTileSubtitleColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.subtitleColor ?? colors.onSurfaceVariant;
  }
  
  /// Get stat tile description color
  Color _getStatTileDescriptionColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.descriptionColor ?? colors.onSurfaceVariant;
  }
  
  /// Get stat tile trend color
  Color _getStatTileTrendColor(AuiColorScheme colors) {
    if (widget.state == AuiStatTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    if (widget.trend != null) {
      if (widget.trend! > 0) {
        return widget.trendColor ?? colors.success;
      } else if (widget.trend! < 0) {
        return widget.trendColor ?? colors.error;
      }
    }
    
    return widget.trendColor ?? colors.onSurfaceVariant;
  }
  
  /// Get stat tile spacing
  double _getStatTileSpacing(AuiSpacingScheme spacing) {
    if (widget.spacing != null) return widget.spacing!;
    
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return spacing.xs;
      case AuiStatTileSize.sm:
        return spacing.sm;
      case AuiStatTileSize.md:
        return spacing.md;
      case AuiStatTileSize.lg:
        return spacing.lg;
      case AuiStatTileSize.xl:
        return spacing.xl;
    }
  }
  
  /// Get stat tile padding
  EdgeInsets _getStatTilePadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return EdgeInsets.all(spacing.sm);
      case AuiStatTileSize.sm:
        return EdgeInsets.all(spacing.md);
      case AuiStatTileSize.md:
        return EdgeInsets.all(spacing.lg);
      case AuiStatTileSize.lg:
        return EdgeInsets.all(spacing.xl);
      case AuiStatTileSize.xl:
        return EdgeInsets.all(spacing.xxl);
    }
  }
  
  /// Get stat tile border radius
  BorderRadius _getStatTileBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return BorderRadius.circular(spacing.sm);
      case AuiStatTileSize.sm:
        return BorderRadius.circular(spacing.md);
      case AuiStatTileSize.md:
        return BorderRadius.circular(spacing.lg);
      case AuiStatTileSize.lg:
        return BorderRadius.circular(spacing.xl);
      case AuiStatTileSize.xl:
        return BorderRadius.circular(spacing.xxl);
    }
  }
  
  /// Get stat tile elevation
  double _getStatTileElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiStatTileVariant.filled:
        return elevation.level0;
      case AuiStatTileVariant.outlined:
        return elevation.level0;
      case AuiStatTileVariant.elevated:
        return elevation.level1;
      case AuiStatTileVariant.tonal:
        return elevation.level0;
    }
  }
  
  /// Get icon widget
  Widget? _getIconWidget(Color iconColor) {
    if (widget.icon != null) return widget.icon;
    if (widget.iconData != null) {
      return Icon(
        widget.iconData!,
        size: widget.iconSize ?? _getIconSize(),
        color: iconColor,
      );
    }
    return null;
  }
  
  /// Get value widget
  Widget _getValueWidget(AuiTypographyScheme typography, Color valueColor) {
    return Text(
      widget.value,
      style: widget.valueStyle ?? _getValueTextStyle(typography, valueColor),
      textAlign: TextAlign.center,
    );
  }
  
  /// Get label widget
  Widget? _getLabelWidget(AuiTypographyScheme typography, Color labelColor) {
    if (widget.label == null) return null;
    
    return Text(
      widget.label!,
      style: widget.labelStyle ?? _getLabelTextStyle(typography, labelColor),
      textAlign: TextAlign.center,
    );
  }
  
  /// Get subtitle widget
  Widget? _getSubtitleWidget(AuiTypographyScheme typography, Color subtitleColor) {
    if (widget.subtitle == null) return null;
    
    return Text(
      widget.subtitle!,
      style: widget.subtitleStyle ?? _getSubtitleTextStyle(typography, subtitleColor),
      textAlign: TextAlign.center,
    );
  }
  
  /// Get description widget
  Widget? _getDescriptionWidget(AuiTypographyScheme typography, Color descriptionColor) {
    if (widget.description == null) return null;
    
    return Text(
      widget.description!,
      style: widget.descriptionStyle ?? _getDescriptionTextStyle(typography, descriptionColor),
      textAlign: TextAlign.center,
    );
  }
  
  /// Get trend widget
  Widget? _getTrendWidget(AuiTypographyScheme typography, Color trendColor) {
    if (widget.trend == null && widget.trendValue == null) return null;
    
    final trendIcon = widget.trend != null
        ? (widget.trend! > 0 ? Icons.trending_up : Icons.trending_down)
        : null;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (trendIcon != null) ...[
          Icon(
            trendIcon,
            size: _getTrendIconSize(),
            color: trendColor,
          ),
          SizedBox(width: _getStatTileSpacing(context.auiTheme.spacing) * 0.25),
        ],
        Text(
          widget.trendValue ?? '${widget.trend!.abs().toStringAsFixed(1)}%',
          style: widget.trendStyle ?? _getTrendTextStyle(typography, trendColor),
        ),
        if (widget.trendLabel != null) ...[
          SizedBox(width: _getStatTileSpacing(context.auiTheme.spacing) * 0.25),
          Text(
            widget.trendLabel!,
            style: widget.trendStyle ?? _getTrendTextStyle(typography, trendColor),
          ),
        ],
      ],
    );
  }
  
  /// Get value text style
  TextStyle _getValueTextStyle(AuiTypographyScheme typography, Color valueColor) {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return typography.titleMedium.copyWith(color: valueColor);
      case AuiStatTileSize.sm:
        return typography.titleLarge.copyWith(color: valueColor);
      case AuiStatTileSize.md:
        return typography.headlineSmall.copyWith(color: valueColor);
      case AuiStatTileSize.lg:
        return typography.headlineMedium.copyWith(color: valueColor);
      case AuiStatTileSize.xl:
        return typography.headlineLarge.copyWith(color: valueColor);
    }
  }
  
  /// Get label text style
  TextStyle _getLabelTextStyle(AuiTypographyScheme typography, Color labelColor) {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return typography.bodySmall.copyWith(color: labelColor);
      case AuiStatTileSize.sm:
        return typography.bodyMedium.copyWith(color: labelColor);
      case AuiStatTileSize.md:
        return typography.bodyLarge.copyWith(color: labelColor);
      case AuiStatTileSize.lg:
        return typography.titleSmall.copyWith(color: labelColor);
      case AuiStatTileSize.xl:
        return typography.titleMedium.copyWith(color: labelColor);
    }
  }
  
  /// Get subtitle text style
  TextStyle _getSubtitleTextStyle(AuiTypographyScheme typography, Color subtitleColor) {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return typography.bodySmall.copyWith(color: subtitleColor);
      case AuiStatTileSize.sm:
        return typography.bodyMedium.copyWith(color: subtitleColor);
      case AuiStatTileSize.md:
        return typography.bodyLarge.copyWith(color: subtitleColor);
      case AuiStatTileSize.lg:
        return typography.titleSmall.copyWith(color: subtitleColor);
      case AuiStatTileSize.xl:
        return typography.titleMedium.copyWith(color: subtitleColor);
    }
  }
  
  /// Get description text style
  TextStyle _getDescriptionTextStyle(AuiTypographyScheme typography, Color descriptionColor) {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return typography.bodySmall.copyWith(color: descriptionColor);
      case AuiStatTileSize.sm:
        return typography.bodyMedium.copyWith(color: descriptionColor);
      case AuiStatTileSize.md:
        return typography.bodyLarge.copyWith(color: descriptionColor);
      case AuiStatTileSize.lg:
        return typography.titleSmall.copyWith(color: descriptionColor);
      case AuiStatTileSize.xl:
        return typography.titleMedium.copyWith(color: descriptionColor);
    }
  }
  
  /// Get trend text style
  TextStyle _getTrendTextStyle(AuiTypographyScheme typography, Color trendColor) {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return typography.bodySmall.copyWith(color: trendColor);
      case AuiStatTileSize.sm:
        return typography.bodyMedium.copyWith(color: trendColor);
      case AuiStatTileSize.md:
        return typography.bodyLarge.copyWith(color: trendColor);
      case AuiStatTileSize.lg:
        return typography.titleSmall.copyWith(color: trendColor);
      case AuiStatTileSize.xl:
        return typography.titleMedium.copyWith(color: trendColor);
    }
  }
  
  /// Get icon size
  double _getIconSize() {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return 16.0;
      case AuiStatTileSize.sm:
        return 20.0;
      case AuiStatTileSize.md:
        return 24.0;
      case AuiStatTileSize.lg:
        return 28.0;
      case AuiStatTileSize.xl:
        return 32.0;
    }
  }
  
  /// Get trend icon size
  double _getTrendIconSize() {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return 12.0;
      case AuiStatTileSize.sm:
        return 14.0;
      case AuiStatTileSize.md:
        return 16.0;
      case AuiStatTileSize.lg:
        return 18.0;
      case AuiStatTileSize.xl:
        return 20.0;
    }
  }
  
  /// Get badge offset
  double _getBadgeOffset() {
    switch (widget.size) {
      case AuiStatTileSize.xs:
        return -4.0;
      case AuiStatTileSize.sm:
        return -6.0;
      case AuiStatTileSize.md:
        return -8.0;
      case AuiStatTileSize.lg:
        return -10.0;
      case AuiStatTileSize.xl:
        return -12.0;
    }
  }
  
  /// Get stat tile shadows
  List<BoxShadow> _getStatTileShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}

/// Stat tile utilities
class AuiStatTileUtils {
  const AuiStatTileUtils._();
  
  /// Get icon size for size
  static double getIconSize(AuiStatTileSize size) {
    switch (size) {
      case AuiStatTileSize.xs:
        return 16.0;
      case AuiStatTileSize.sm:
        return 20.0;
      case AuiStatTileSize.md:
        return 24.0;
      case AuiStatTileSize.lg:
        return 28.0;
      case AuiStatTileSize.xl:
        return 32.0;
    }
  }
  
  /// Get trend icon size for size
  static double getTrendIconSize(AuiStatTileSize size) {
    switch (size) {
      case AuiStatTileSize.xs:
        return 12.0;
      case AuiStatTileSize.sm:
        return 14.0;
      case AuiStatTileSize.md:
        return 16.0;
      case AuiStatTileSize.lg:
        return 18.0;
      case AuiStatTileSize.xl:
        return 20.0;
    }
  }
  
  /// Get spacing for size
  static double getSpacing(AuiStatTileSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiStatTileSize.xs:
        return spacing.xs;
      case AuiStatTileSize.sm:
        return spacing.sm;
      case AuiStatTileSize.md:
        return spacing.md;
      case AuiStatTileSize.lg:
        return spacing.lg;
      case AuiStatTileSize.xl:
        return spacing.xl;
    }
  }
}
