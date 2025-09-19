import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// List tile variants
enum AuiListTileVariant {
  filled,
  outlined,
  elevated,
  tonal,
}

/// List tile sizes
enum AuiListTileSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// List tile states
enum AuiListTileState {
  enabled,
  disabled,
  pressed,
  hovered,
  focused,
  selected,
}

/// A comprehensive list tile component
class AuiListTile extends StatefulWidget {
  const AuiListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense = false,
    this.visualDensity,
    this.shape,
    this.selectedTileColor,
    this.hoverColor,
    this.focusColor,
    this.splashColor,
    this.mouseCursor,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.tileColor,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.contentPadding,
    this.minLeadingWidth,
    this.minVerticalPadding,
    this.minHeight,
    this.titleAlignment,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.horizontalTitleGap,
    this.verticalTitleGap,
    this.variant = AuiListTileVariant.filled,
    this.size = AuiListTileSize.md,
    this.state = AuiListTileState.enabled,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isThreeLine;
  final bool dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Color? selectedTileColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? splashColor;
  final MouseCursor? mouseCursor;
  final bool enabled;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? tileColor;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? minLeadingWidth;
  final double? minVerticalPadding;
  final double? minHeight;
  final ListTileTitleAlignment? titleAlignment;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? leadingAndTrailingTextStyle;
  final double? horizontalTitleGap;
  final double? verticalTitleGap;
  final AuiListTileVariant variant;
  final AuiListTileSize size;
  final AuiListTileState state;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;

  @override
  State<AuiListTile> createState() => _AuiListTileState();
}

class _AuiListTileState extends State<AuiListTile> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    
    // Get list tile colors
    final listTileColor = _getListTileColor(colors);
    final listTileSelectedColor = _getListTileSelectedColor(colors);
    final listTileHoverColor = _getListTileHoverColor(colors);
    final listTileFocusColor = _getListTileFocusColor(colors);
    final listTileSplashColor = _getListTileSplashColor(colors);
    final listTileIconColor = _getListTileIconColor(colors);
    final listTileTextColor = _getListTileTextColor(colors);
    
    // Get list tile content padding
    final listTileContentPadding = _getListTileContentPadding(spacing);
    
    // Get list tile shape
    final listTileShape = _getListTileShape(spacing);
    
    // Get list tile visual density
    final listTileVisualDensity = _getListTileVisualDensity();
    
    Widget listTile = ListTile(
      leading: widget.leading,
      title: widget.title,
      subtitle: widget.subtitle,
      trailing: widget.trailing,
      isThreeLine: widget.isThreeLine,
      dense: widget.dense,
      visualDensity: listTileVisualDensity,
      shape: listTileShape,
      selectedTileColor: listTileSelectedColor,
      hoverColor: listTileHoverColor,
      focusColor: listTileFocusColor,
      splashColor: listTileSplashColor,
      mouseCursor: widget.mouseCursor,
      enabled: widget.enabled && widget.state != AuiListTileState.disabled,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onFocusChange: widget.onFocusChange,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      tileColor: listTileColor,
      selectedColor: listTileSelectedColor,
      iconColor: listTileIconColor,
      textColor: listTileTextColor,
      contentPadding: listTileContentPadding,
      minLeadingWidth: widget.minLeadingWidth ?? _getMinLeadingWidth(),
      minVerticalPadding: widget.minVerticalPadding ?? _getMinVerticalPadding(),
      titleAlignment: widget.titleAlignment ?? ListTileTitleAlignment.titleHeight,
      titleTextStyle: widget.titleTextStyle ?? _getTitleTextStyle(colors),
      subtitleTextStyle: widget.subtitleTextStyle ?? _getSubtitleTextStyle(colors),
      leadingAndTrailingTextStyle: widget.leadingAndTrailingTextStyle ?? _getLeadingAndTrailingTextStyle(colors),
      horizontalTitleGap: widget.horizontalTitleGap ?? _getHorizontalTitleGap(),
    );
    
    // Add margin
    if (widget.margin != null) {
      listTile = Padding(
        padding: widget.margin!,
        child: listTile,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      listTile = Semantics(
        label: widget.semanticLabel,
        child: listTile,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      listTile = Tooltip(
        message: widget.tooltip!,
        child: listTile,
      );
    }
    
    return listTile;
  }
  
  /// Get list tile color
  Color? _getListTileColor(AuiColorScheme colors) {
    if (widget.state == AuiListTileState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiListTileVariant.filled:
        return widget.tileColor ?? colors.surface;
      case AuiListTileVariant.outlined:
        return widget.tileColor ?? colors.surface;
      case AuiListTileVariant.elevated:
        return widget.tileColor ?? colors.surface;
      case AuiListTileVariant.tonal:
        return widget.tileColor ?? colors.surfaceVariant;
    }
  }
  
  /// Get list tile selected color
  Color? _getListTileSelectedColor(AuiColorScheme colors) {
    if (widget.state == AuiListTileState.disabled) {
      return colors.surfaceVariant;
    }
    
    return widget.selectedTileColor ?? colors.primary.withValues(alpha:0.12);
  }
  
  /// Get list tile hover color
  Color? _getListTileHoverColor(AuiColorScheme colors) {
    if (widget.state == AuiListTileState.disabled) {
      return null;
    }
    
    return widget.hoverColor ?? colors.primary.withValues(alpha:0.08);
  }
  
  /// Get list tile focus color
  Color? _getListTileFocusColor(AuiColorScheme colors) {
    if (widget.state == AuiListTileState.disabled) {
      return null;
    }
    
    return widget.focusColor ?? colors.primary.withValues(alpha:0.12);
  }
  
  /// Get list tile splash color
  Color? _getListTileSplashColor(AuiColorScheme colors) {
    if (widget.state == AuiListTileState.disabled) {
      return null;
    }
    
    return widget.splashColor ?? colors.primary.withValues(alpha:0.16);
  }
  
  /// Get list tile icon color
  Color? _getListTileIconColor(AuiColorScheme colors) {
    if (widget.state == AuiListTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.iconColor ?? colors.onSurfaceVariant;
  }
  
  /// Get list tile text color
  Color? _getListTileTextColor(AuiColorScheme colors) {
    if (widget.state == AuiListTileState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.textColor ?? colors.onSurface;
  }
  
  /// Get list tile content padding
  EdgeInsetsGeometry _getListTileContentPadding(AuiSpacingScheme spacing) {
    if (widget.contentPadding != null) return widget.contentPadding!;
    
    switch (widget.size) {
      case AuiListTileSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiListTileSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiListTileSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.md);
      case AuiListTileSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.xl, vertical: spacing.lg);
      case AuiListTileSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.xxl, vertical: spacing.xl);
    }
  }
  
  /// Get list tile shape
  ShapeBorder? _getListTileShape(AuiSpacingScheme spacing) {
    if (widget.shape != null) return widget.shape;
    
    switch (widget.variant) {
      case AuiListTileVariant.filled:
        return RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(_getBorderRadius(spacing)),
        );
      case AuiListTileVariant.outlined:
        return RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(_getBorderRadius(spacing)),
        );
      case AuiListTileVariant.elevated:
        return RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(_getBorderRadius(spacing)),
        );
      case AuiListTileVariant.tonal:
        return RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(_getBorderRadius(spacing)),
        );
    }
  }
  
  /// Get list tile visual density
  VisualDensity _getListTileVisualDensity() {
    if (widget.visualDensity != null) return widget.visualDensity!;
    
    switch (widget.size) {
      case AuiListTileSize.xs:
        return VisualDensity.compact;
      case AuiListTileSize.sm:
        return VisualDensity.standard;
      case AuiListTileSize.md:
        return VisualDensity.standard;
      case AuiListTileSize.lg:
        return VisualDensity.comfortable;
      case AuiListTileSize.xl:
        return VisualDensity.comfortable;
    }
  }
  
  /// Get min leading width
  double _getMinLeadingWidth() {
    switch (widget.size) {
      case AuiListTileSize.xs:
        return 32.0;
      case AuiListTileSize.sm:
        return 36.0;
      case AuiListTileSize.md:
        return 40.0;
      case AuiListTileSize.lg:
        return 44.0;
      case AuiListTileSize.xl:
        return 48.0;
    }
  }
  
  /// Get min vertical padding
  double _getMinVerticalPadding() {
    switch (widget.size) {
      case AuiListTileSize.xs:
        return 4.0;
      case AuiListTileSize.sm:
        return 8.0;
      case AuiListTileSize.md:
        return 12.0;
      case AuiListTileSize.lg:
        return 16.0;
      case AuiListTileSize.xl:
        return 20.0;
    }
  }
  
  /// Get min height
  
  /// Get title text style
  TextStyle _getTitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getListTileTextColor(colors),
      fontSize: _getFontSize(),
      fontWeight: FontWeight.w500,
    );
  }
  
  /// Get subtitle text style
  TextStyle _getSubtitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getListTileTextColor(colors)?.withValues(alpha:0.7),
      fontSize: _getFontSize() * 0.875,
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get leading and trailing text style
  TextStyle _getLeadingAndTrailingTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getListTileIconColor(colors),
      fontSize: _getFontSize(),
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get horizontal title gap
  double _getHorizontalTitleGap() {
    switch (widget.size) {
      case AuiListTileSize.xs:
        return 8.0;
      case AuiListTileSize.sm:
        return 12.0;
      case AuiListTileSize.md:
        return 16.0;
      case AuiListTileSize.lg:
        return 20.0;
      case AuiListTileSize.xl:
        return 24.0;
    }
  }
  
  /// Get vertical title gap
  
  /// Get font size
  double _getFontSize() {
    switch (widget.size) {
      case AuiListTileSize.xs:
        return 12.0;
      case AuiListTileSize.sm:
        return 14.0;
      case AuiListTileSize.md:
        return 16.0;
      case AuiListTileSize.lg:
        return 18.0;
      case AuiListTileSize.xl:
        return 20.0;
    }
  }
  
  /// Get border radius
  double _getBorderRadius(AuiSpacingScheme spacing) {
    switch (widget.size) {
      case AuiListTileSize.xs:
        return spacing.xs;
      case AuiListTileSize.sm:
        return spacing.sm;
      case AuiListTileSize.md:
        return spacing.md;
      case AuiListTileSize.lg:
        return spacing.lg;
      case AuiListTileSize.xl:
        return spacing.xl;
    }
  }
}

/// List tile utilities
class AuiListTileUtils {
  const AuiListTileUtils._();
  
  /// Get font size for size
  static double getFontSize(AuiListTileSize size) {
    switch (size) {
      case AuiListTileSize.xs:
        return 12.0;
      case AuiListTileSize.sm:
        return 14.0;
      case AuiListTileSize.md:
        return 16.0;
      case AuiListTileSize.lg:
        return 18.0;
      case AuiListTileSize.xl:
        return 20.0;
    }
  }
  
  /// Get min height for size
  static double getMinHeight(AuiListTileSize size) {
    switch (size) {
      case AuiListTileSize.xs:
        return 40.0;
      case AuiListTileSize.sm:
        return 48.0;
      case AuiListTileSize.md:
        return 56.0;
      case AuiListTileSize.lg:
        return 64.0;
      case AuiListTileSize.xl:
        return 72.0;
    }
  }
  
  /// Get border radius for size
  static double getBorderRadius(AuiListTileSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiListTileSize.xs:
        return spacing.xs;
      case AuiListTileSize.sm:
        return spacing.sm;
      case AuiListTileSize.md:
        return spacing.md;
      case AuiListTileSize.lg:
        return spacing.lg;
      case AuiListTileSize.xl:
        return spacing.xl;
    }
  }
}
