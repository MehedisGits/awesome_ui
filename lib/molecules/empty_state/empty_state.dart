import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Empty state variants
enum AuiEmptyStateVariant {
  filled,
  outlined,
  tonal,
  minimal,
}

/// Empty state sizes
enum AuiEmptyStateSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Empty state types
enum AuiEmptyStateType {
  noData,
  noResults,
  error,
  loading,
  offline,
  empty,
  custom,
}

/// A comprehensive empty state component
class AuiEmptyState extends StatelessWidget {
  const AuiEmptyState({
    super.key,
    this.icon,
    this.iconData,
    this.image,
    this.title,
    this.subtitle,
    this.description,
    this.action,
    this.secondaryAction,
    this.variant = AuiEmptyStateVariant.filled,
    this.size = AuiEmptyStateSize.md,
    this.type = AuiEmptyStateType.empty,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    this.descriptionColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.alignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing,
    this.iconSize,
    this.titleStyle,
    this.subtitleStyle,
    this.descriptionStyle,
    this.maxWidth,
    this.constraints,
  });

  final Widget? icon;
  final IconData? iconData;
  final ImageProvider? image;
  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? action;
  final Widget? secondaryAction;
  final AuiEmptyStateVariant variant;
  final AuiEmptyStateSize size;
  final AuiEmptyStateType type;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? descriptionColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? spacing;
  final double? iconSize;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? descriptionStyle;
  final double? maxWidth;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    final typography = theme.typography;
    
    // Get empty state colors
    final emptyStateBackgroundColor = _getEmptyStateBackgroundColor(colors);
    final emptyStateIconColor = _getEmptyStateIconColor(colors);
    final emptyStateTitleColor = _getEmptyStateTitleColor(colors);
    final emptyStateSubtitleColor = _getEmptyStateSubtitleColor(colors);
    final emptyStateDescriptionColor = _getEmptyStateDescriptionColor(colors);
    final emptyStateBorderColor = _getEmptyStateBorderColor(colors);
    
    // Get empty state spacing
    final emptyStateSpacing = _getEmptyStateSpacing(spacing);
    final emptyStatePadding = _getEmptyStatePadding(spacing);
    
    // Get empty state border radius
    final emptyStateBorderRadius = _getEmptyStateBorderRadius(spacing);
    
    // Get empty state elevation
    final emptyStateElevation = _getEmptyStateElevation(elevation);
    
    // Get icon widget
    final iconWidget = _getIconWidget(colors, emptyStateIconColor);
    
    // Get title widget
    final titleWidget = _getTitleWidget(typography, emptyStateTitleColor);
    
    // Get subtitle widget
    final subtitleWidget = _getSubtitleWidget(typography, emptyStateSubtitleColor);
    
    // Get description widget
    final descriptionWidget = _getDescriptionWidget(typography, emptyStateDescriptionColor);
    
    // Get action widgets
    final actionWidgets = _getActionWidgets(context);
    
    Widget emptyState = Container(
      constraints: constraints ?? BoxConstraints(
        maxWidth: maxWidth ?? _getMaxWidth(),
      ),
      padding: emptyStatePadding,
      decoration: BoxDecoration(
        color: emptyStateBackgroundColor,
        borderRadius: emptyStateBorderRadius,
        border: emptyStateBorderColor != null 
            ? Border.all(color: emptyStateBorderColor, width: 1.0)
            : null,
        boxShadow: _getEmptyStateShadows(colors, emptyStateElevation),
      ),
      child: Column(
        mainAxisAlignment: alignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (iconWidget != null) ...[
            iconWidget,
            SizedBox(height: emptyStateSpacing),
          ],
          if (titleWidget != null) ...[
            titleWidget,
            if (subtitleWidget != null || descriptionWidget != null)
              SizedBox(height: emptyStateSpacing * 0.5),
          ],
          if (subtitleWidget != null) ...[
            subtitleWidget,
            if (descriptionWidget != null)
              SizedBox(height: emptyStateSpacing * 0.5),
          ],
          if (descriptionWidget != null) ...[
            descriptionWidget,
            if (actionWidgets.isNotEmpty)
              SizedBox(height: emptyStateSpacing),
          ],
          if (actionWidgets.isNotEmpty) ...[
            ...actionWidgets,
          ],
        ],
      ),
    );
    
    // Add margin
    if (margin != null) {
      emptyState = Padding(
        padding: margin!,
        child: emptyState,
      );
    }
    
    // Add semantics
    if (semanticLabel != null) {
      emptyState = Semantics(
        label: semanticLabel,
        child: emptyState,
      );
    }
    
    // Add tooltip
    if (tooltip != null) {
      emptyState = Tooltip(
        message: tooltip!,
        child: emptyState,
      );
    }
    
    return emptyState;
  }
  
  /// Get empty state background color
  Color _getEmptyStateBackgroundColor(AuiColorScheme colors) {
    switch (variant) {
      case AuiEmptyStateVariant.filled:
        return backgroundColor ?? colors.surface;
      case AuiEmptyStateVariant.outlined:
        return backgroundColor ?? colors.surface;
      case AuiEmptyStateVariant.tonal:
        return backgroundColor ?? colors.surfaceVariant;
      case AuiEmptyStateVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get empty state icon color
  Color _getEmptyStateIconColor(AuiColorScheme colors) {
    switch (type) {
      case AuiEmptyStateType.noData:
        return iconColor ?? colors.onSurfaceVariant;
      case AuiEmptyStateType.noResults:
        return iconColor ?? colors.onSurfaceVariant;
      case AuiEmptyStateType.error:
        return iconColor ?? colors.error;
      case AuiEmptyStateType.loading:
        return iconColor ?? colors.primary;
      case AuiEmptyStateType.offline:
        return iconColor ?? colors.onSurfaceVariant;
      case AuiEmptyStateType.empty:
        return iconColor ?? colors.onSurfaceVariant;
      case AuiEmptyStateType.custom:
        return iconColor ?? colors.onSurfaceVariant;
    }
  }
  
  /// Get empty state title color
  Color _getEmptyStateTitleColor(AuiColorScheme colors) {
    return titleColor ?? colors.onSurface;
  }
  
  /// Get empty state subtitle color
  Color _getEmptyStateSubtitleColor(AuiColorScheme colors) {
    return subtitleColor ?? colors.onSurfaceVariant;
  }
  
  /// Get empty state description color
  Color _getEmptyStateDescriptionColor(AuiColorScheme colors) {
    return descriptionColor ?? colors.onSurfaceVariant;
  }
  
  /// Get empty state border color
  Color? _getEmptyStateBorderColor(AuiColorScheme colors) {
    switch (variant) {
      case AuiEmptyStateVariant.filled:
        return null;
      case AuiEmptyStateVariant.outlined:
        return borderColor ?? colors.outline;
      case AuiEmptyStateVariant.tonal:
        return null;
      case AuiEmptyStateVariant.minimal:
        return null;
    }
  }
  
  /// Get empty state spacing
  double _getEmptyStateSpacing(AuiSpacingScheme spacing) {
    if (this.spacing != null) return this.spacing!;
    
    switch (size) {
      case AuiEmptyStateSize.xs:
        return spacing.sm;
      case AuiEmptyStateSize.sm:
        return spacing.md;
      case AuiEmptyStateSize.md:
        return spacing.lg;
      case AuiEmptyStateSize.lg:
        return spacing.xl;
      case AuiEmptyStateSize.xl:
        return spacing.xxl;
    }
  }
  
  /// Get empty state padding
  EdgeInsets _getEmptyStatePadding(AuiSpacingScheme spacing) {
    if (padding != null) return padding!;
    
    switch (size) {
      case AuiEmptyStateSize.xs:
        return EdgeInsets.all(spacing.md);
      case AuiEmptyStateSize.sm:
        return EdgeInsets.all(spacing.lg);
      case AuiEmptyStateSize.md:
        return EdgeInsets.all(spacing.xl);
      case AuiEmptyStateSize.lg:
        return EdgeInsets.all(spacing.xxl);
      case AuiEmptyStateSize.xl:
        return EdgeInsets.all(spacing.xxxl);
    }
  }
  
  /// Get empty state border radius
  BorderRadius _getEmptyStateBorderRadius(AuiSpacingScheme spacing) {
    if (borderRadius != null) return borderRadius!;
    
    switch (size) {
      case AuiEmptyStateSize.xs:
        return BorderRadius.circular(spacing.sm);
      case AuiEmptyStateSize.sm:
        return BorderRadius.circular(spacing.md);
      case AuiEmptyStateSize.md:
        return BorderRadius.circular(spacing.lg);
      case AuiEmptyStateSize.lg:
        return BorderRadius.circular(spacing.xl);
      case AuiEmptyStateSize.xl:
        return BorderRadius.circular(spacing.xxl);
    }
  }
  
  /// Get empty state elevation
  double _getEmptyStateElevation(AuiElevationScheme elevation) {
    if (this.elevation != null) return this.elevation!;
    
    switch (variant) {
      case AuiEmptyStateVariant.filled:
        return elevation.level0;
      case AuiEmptyStateVariant.outlined:
        return elevation.level0;
      case AuiEmptyStateVariant.tonal:
        return elevation.level0;
      case AuiEmptyStateVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get max width
  double _getMaxWidth() {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return 200.0;
      case AuiEmptyStateSize.sm:
        return 300.0;
      case AuiEmptyStateSize.md:
        return 400.0;
      case AuiEmptyStateSize.lg:
        return 500.0;
      case AuiEmptyStateSize.xl:
        return 600.0;
    }
  }
  
  /// Get icon widget
  Widget? _getIconWidget(AuiColorScheme colors, Color iconColor) {
    if (icon != null) return icon;
    if (image != null) {
      return Image(
        image: image!,
        width: iconSize ?? _getIconSize(),
        height: iconSize ?? _getIconSize(),
        color: iconColor,
      );
    }
    if (iconData != null) {
      return Icon(
        iconData!,
        size: iconSize ?? _getIconSize(),
        color: iconColor,
      );
    }
    
    // Default icon based on type
    switch (type) {
      case AuiEmptyStateType.noData:
        return Icon(
          Icons.inbox_outlined,
          size: iconSize ?? _getIconSize(),
          color: iconColor,
        );
      case AuiEmptyStateType.noResults:
        return Icon(
          Icons.search_off,
          size: iconSize ?? _getIconSize(),
          color: iconColor,
        );
      case AuiEmptyStateType.error:
        return Icon(
          Icons.error_outline,
          size: iconSize ?? _getIconSize(),
          color: iconColor,
        );
      case AuiEmptyStateType.loading:
        return SizedBox(
          width: iconSize ?? _getIconSize(),
          height: iconSize ?? _getIconSize(),
          child: CircularProgressIndicator(
            color: iconColor,
            strokeWidth: 2.0,
          ),
        );
      case AuiEmptyStateType.offline:
        return Icon(
          Icons.wifi_off,
          size: iconSize ?? _getIconSize(),
          color: iconColor,
        );
      case AuiEmptyStateType.empty:
        return Icon(
          Icons.inbox_outlined,
          size: iconSize ?? _getIconSize(),
          color: iconColor,
        );
      case AuiEmptyStateType.custom:
        return null;
    }
  }
  
  /// Get title widget
  Widget? _getTitleWidget(AuiTypographyScheme typography, Color titleColor) {
    if (title == null) return null;
    
    return Text(
      title!,
      style: titleStyle ?? _getTitleTextStyle(typography, titleColor),
      textAlign: TextAlign.center,
    );
  }
  
  /// Get subtitle widget
  Widget? _getSubtitleWidget(AuiTypographyScheme typography, Color subtitleColor) {
    if (subtitle == null) return null;
    
    return Text(
      subtitle!,
      style: subtitleStyle ?? _getSubtitleTextStyle(typography, subtitleColor),
      textAlign: TextAlign.center,
    );
  }
  
  /// Get description widget
  Widget? _getDescriptionWidget(AuiTypographyScheme typography, Color descriptionColor) {
    if (description == null) return null;
    
    return Text(
      description!,
      style: descriptionStyle ?? _getDescriptionTextStyle(typography, descriptionColor),
      textAlign: TextAlign.center,
    );
  }
  
  /// Get action widgets
  List<Widget> _getActionWidgets(BuildContext context) {
    final widgets = <Widget>[];
    
    if (action != null) {
      widgets.add(action!);
    }
    
    if (secondaryAction != null) {
      if (action != null) {
        widgets.add(SizedBox(height: _getEmptyStateSpacing(context.auiTheme.spacing) * 0.5));
      }
      widgets.add(secondaryAction!);
    }
    
    return widgets;
  }
  
  /// Get title text style
  TextStyle _getTitleTextStyle(AuiTypographyScheme typography, Color titleColor) {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return typography.titleSmall.copyWith(color: titleColor);
      case AuiEmptyStateSize.sm:
        return typography.titleMedium.copyWith(color: titleColor);
      case AuiEmptyStateSize.md:
        return typography.titleLarge.copyWith(color: titleColor);
      case AuiEmptyStateSize.lg:
        return typography.headlineSmall.copyWith(color: titleColor);
      case AuiEmptyStateSize.xl:
        return typography.headlineMedium.copyWith(color: titleColor);
    }
  }
  
  /// Get subtitle text style
  TextStyle _getSubtitleTextStyle(AuiTypographyScheme typography, Color subtitleColor) {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return typography.bodySmall.copyWith(color: subtitleColor);
      case AuiEmptyStateSize.sm:
        return typography.bodyMedium.copyWith(color: subtitleColor);
      case AuiEmptyStateSize.md:
        return typography.bodyLarge.copyWith(color: subtitleColor);
      case AuiEmptyStateSize.lg:
        return typography.titleSmall.copyWith(color: subtitleColor);
      case AuiEmptyStateSize.xl:
        return typography.titleMedium.copyWith(color: subtitleColor);
    }
  }
  
  /// Get description text style
  TextStyle _getDescriptionTextStyle(AuiTypographyScheme typography, Color descriptionColor) {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return typography.bodySmall.copyWith(color: descriptionColor);
      case AuiEmptyStateSize.sm:
        return typography.bodyMedium.copyWith(color: descriptionColor);
      case AuiEmptyStateSize.md:
        return typography.bodyLarge.copyWith(color: descriptionColor);
      case AuiEmptyStateSize.lg:
        return typography.titleSmall.copyWith(color: descriptionColor);
      case AuiEmptyStateSize.xl:
        return typography.titleMedium.copyWith(color: descriptionColor);
    }
  }
  
  /// Get icon size
  double _getIconSize() {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return 32.0;
      case AuiEmptyStateSize.sm:
        return 48.0;
      case AuiEmptyStateSize.md:
        return 64.0;
      case AuiEmptyStateSize.lg:
        return 80.0;
      case AuiEmptyStateSize.xl:
        return 96.0;
    }
  }
  
  /// Get empty state shadows
  List<BoxShadow> _getEmptyStateShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}

/// Empty state utilities
class AuiEmptyStateUtils {
  const AuiEmptyStateUtils._();
  
  /// Get icon size for size
  static double getIconSize(AuiEmptyStateSize size) {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return 32.0;
      case AuiEmptyStateSize.sm:
        return 48.0;
      case AuiEmptyStateSize.md:
        return 64.0;
      case AuiEmptyStateSize.lg:
        return 80.0;
      case AuiEmptyStateSize.xl:
        return 96.0;
    }
  }
  
  /// Get max width for size
  static double getMaxWidth(AuiEmptyStateSize size) {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return 200.0;
      case AuiEmptyStateSize.sm:
        return 300.0;
      case AuiEmptyStateSize.md:
        return 400.0;
      case AuiEmptyStateSize.lg:
        return 500.0;
      case AuiEmptyStateSize.xl:
        return 600.0;
    }
  }
  
  /// Get spacing for size
  static double getSpacing(AuiEmptyStateSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiEmptyStateSize.xs:
        return spacing.sm;
      case AuiEmptyStateSize.sm:
        return spacing.md;
      case AuiEmptyStateSize.md:
        return spacing.lg;
      case AuiEmptyStateSize.lg:
        return spacing.xl;
      case AuiEmptyStateSize.xl:
        return spacing.xxl;
    }
  }
}
