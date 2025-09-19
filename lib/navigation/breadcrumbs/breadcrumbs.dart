import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Breadcrumb variants
enum AuiBreadcrumbVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Breadcrumb sizes
enum AuiBreadcrumbSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Breadcrumb states
enum AuiBreadcrumbState {
  enabled,
  disabled,
  collapsed,
  expanded,
}

/// Breadcrumb item data
class AuiBreadcrumbItem {
  const AuiBreadcrumbItem({
    required this.label,
    this.icon,
    this.tooltip,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.enabled = true,
    this.visible = true,
    this.selected = false,
    this.backgroundColor,
    this.foregroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.iconSize,
    this.labelStyle,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.gradient,
  });

  final String label;
  final Widget? icon;
  final String? tooltip;
  final String? semanticLabel;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final bool enabled;
  final bool visible;
  final bool selected;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? iconSize;
  final TextStyle? labelStyle;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Gradient? gradient;
}

/// A comprehensive breadcrumbs component
class AuiBreadcrumbs extends StatefulWidget {
  const AuiBreadcrumbs({
    super.key,
    required this.items,
    this.separator,
    this.variant = AuiBreadcrumbVariant.filled,
    this.size = AuiBreadcrumbSize.md,
    this.state = AuiBreadcrumbState.enabled,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.alignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing,
    this.separatorSpacing,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.textDirection,
    this.clipBehavior = Clip.none,
    this.gradient,
    this.border,
    this.shape,
  });

  final List<AuiBreadcrumbItem> items;
  final Widget? separator;
  final AuiBreadcrumbVariant variant;
  final AuiBreadcrumbSize size;
  final AuiBreadcrumbState state;
  final Color? backgroundColor;
  final Color? foregroundColor;
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
  final double? separatorSpacing;
  final TextOverflow overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  final Clip clipBehavior;
  final Gradient? gradient;
  final Border? border;
  final ShapeBorder? shape;

  @override
  State<AuiBreadcrumbs> createState() => _AuiBreadcrumbsState();
}

class _AuiBreadcrumbsState extends State<AuiBreadcrumbs> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get breadcrumbs colors
    final breadcrumbsBackgroundColor = _getBreadcrumbsBackgroundColor(colors);
    final breadcrumbsBorderColor = _getBreadcrumbsBorderColor(colors);
    
    // Get breadcrumbs elevation
    final breadcrumbsElevation = _getBreadcrumbsElevation(elevation);
    
    // Get breadcrumbs border radius
    final breadcrumbsBorderRadius = _getBreadcrumbsBorderRadius(spacing);
    
    // Get breadcrumbs padding
    final breadcrumbsPadding = _getBreadcrumbsPadding(spacing);
    
    // Get breadcrumbs spacing
    final breadcrumbsSpacing = _getBreadcrumbsSpacing(spacing);
    
    // Get separator spacing
    final separatorSpacing = _getSeparatorSpacing(spacing);
    
    // Get breadcrumbs items
    final breadcrumbsItems = _getBreadcrumbsItems(colors, breadcrumbsSpacing, separatorSpacing);
    
    Widget breadcrumbs = Container(
      padding: breadcrumbsPadding,
      decoration: BoxDecoration(
        color: breadcrumbsBackgroundColor,
        borderRadius: breadcrumbsBorderRadius,
        border: breadcrumbsBorderColor != null 
            ? Border.all(color: breadcrumbsBorderColor, width: 1.0)
            : null,
        gradient: widget.gradient,
        boxShadow: _getBreadcrumbsShadows(colors, breadcrumbsElevation),
      ),
      child: Row(
        mainAxisAlignment: widget.alignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: breadcrumbsItems,
      ),
    );
    
    // Add border if needed
    if (widget.border != null) {
      breadcrumbs = Container(
        decoration: BoxDecoration(
          border: widget.border,
        ),
        child: breadcrumbs,
      );
    }
    
    // Add shape if needed
    if (widget.shape != null) {
      breadcrumbs = ClipPath(
        clipper: _ShapeClipper(widget.shape!),
        child: breadcrumbs,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      breadcrumbs = Padding(
        padding: widget.margin!,
        child: breadcrumbs,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      breadcrumbs = Semantics(
        label: widget.semanticLabel,
        child: breadcrumbs,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      breadcrumbs = Tooltip(
        message: widget.tooltip!,
        child: breadcrumbs,
      );
    }
    
    return breadcrumbs;
  }
  
  /// Get breadcrumbs background color
  Color _getBreadcrumbsBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiBreadcrumbState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiBreadcrumbVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiBreadcrumbVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiBreadcrumbVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiBreadcrumbVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
      case AuiBreadcrumbVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get breadcrumbs foreground color
  
  /// Get breadcrumbs border color
  Color? _getBreadcrumbsBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiBreadcrumbState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiBreadcrumbVariant.filled:
        return null;
      case AuiBreadcrumbVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiBreadcrumbVariant.elevated:
        return null;
      case AuiBreadcrumbVariant.tonal:
        return null;
      case AuiBreadcrumbVariant.minimal:
        return null;
    }
  }
  
  /// Get breadcrumbs elevation
  double _getBreadcrumbsElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiBreadcrumbVariant.filled:
        return elevation.level0;
      case AuiBreadcrumbVariant.outlined:
        return elevation.level0;
      case AuiBreadcrumbVariant.elevated:
        return elevation.level1;
      case AuiBreadcrumbVariant.tonal:
        return elevation.level0;
      case AuiBreadcrumbVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get breadcrumbs border radius
  BorderRadius _getBreadcrumbsBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiBreadcrumbSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiBreadcrumbSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiBreadcrumbSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiBreadcrumbSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiBreadcrumbSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get breadcrumbs padding
  EdgeInsets _getBreadcrumbsPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiBreadcrumbSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiBreadcrumbSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiBreadcrumbSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.md);
      case AuiBreadcrumbSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.xl, vertical: spacing.lg);
      case AuiBreadcrumbSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.xxl, vertical: spacing.xl);
    }
  }
  
  /// Get breadcrumbs spacing
  double _getBreadcrumbsSpacing(AuiSpacingScheme spacing) {
    if (widget.spacing != null) return widget.spacing!;
    
    switch (widget.size) {
      case AuiBreadcrumbSize.xs:
        return spacing.xs;
      case AuiBreadcrumbSize.sm:
        return spacing.sm;
      case AuiBreadcrumbSize.md:
        return spacing.md;
      case AuiBreadcrumbSize.lg:
        return spacing.lg;
      case AuiBreadcrumbSize.xl:
        return spacing.xl;
    }
  }
  
  /// Get separator spacing
  double _getSeparatorSpacing(AuiSpacingScheme spacing) {
    if (widget.separatorSpacing != null) return widget.separatorSpacing!;
    
    switch (widget.size) {
      case AuiBreadcrumbSize.xs:
        return spacing.xs;
      case AuiBreadcrumbSize.sm:
        return spacing.sm;
      case AuiBreadcrumbSize.md:
        return spacing.md;
      case AuiBreadcrumbSize.lg:
        return spacing.lg;
      case AuiBreadcrumbSize.xl:
        return spacing.xl;
    }
  }
  
  /// Get breadcrumbs items
  List<Widget> _getBreadcrumbsItems(AuiColorScheme colors, double spacing, double separatorSpacing) {
    final widgets = <Widget>[];
    
    for (int i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      
      if (item.visible) {
        widgets.add(
          _AuiBreadcrumbItem(
            item: item,
            size: widget.size,
            colors: colors,
          ),
        );
        
        if (i < widget.items.length - 1) {
          widgets.add(
            SizedBox(width: separatorSpacing),
          );
          widgets.add(
            widget.separator ?? _getDefaultSeparator(colors),
          );
          widgets.add(
            SizedBox(width: separatorSpacing),
          );
        }
      }
    }
    
    return widgets;
  }
  
  /// Get default separator
  Widget _getDefaultSeparator(AuiColorScheme colors) {
    return Icon(
      Icons.chevron_right,
      size: _getSeparatorSize(),
      color: colors.onSurfaceVariant,
    );
  }
  
  /// Get separator size
  double _getSeparatorSize() {
    switch (widget.size) {
      case AuiBreadcrumbSize.xs:
        return 16.0;
      case AuiBreadcrumbSize.sm:
        return 18.0;
      case AuiBreadcrumbSize.md:
        return 20.0;
      case AuiBreadcrumbSize.lg:
        return 22.0;
      case AuiBreadcrumbSize.xl:
        return 24.0;
    }
  }
  
  /// Get breadcrumbs shadows
  List<BoxShadow> _getBreadcrumbsShadows(AuiColorScheme colors, double elevation) {
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

/// Individual breadcrumb item widget
class _AuiBreadcrumbItem extends StatelessWidget {
  const _AuiBreadcrumbItem({
    required this.item,
    required this.size,
    required this.colors,
  });

  final AuiBreadcrumbItem item;
  final AuiBreadcrumbSize size;
  final AuiColorScheme colors;

  @override
  Widget build(BuildContext context) {
    // Get item colors
    final itemBackgroundColor = _getItemBackgroundColor();
    final itemBorderColor = _getItemBorderColor();
    
    // Get item elevation
    final itemElevation = _getItemElevation();
    
    // Get item border radius
    final itemBorderRadius = _getItemBorderRadius();
    
    // Get item padding
    final itemPadding = _getItemPadding();
    
    // Get item icon size
    final itemIconSize = _getItemIconSize();
    
    // Get item font size
    final itemFontSize = _getItemFontSize();
    
    // Get icon widget
    final iconWidget = _getIconWidget(itemIconSize);
    
    // Get label widget
    final labelWidget = _getLabelWidget(itemFontSize);
    
    Widget breadcrumbItem = Container(
      padding: itemPadding,
      decoration: BoxDecoration(
        color: itemBackgroundColor,
        borderRadius: itemBorderRadius,
        border: itemBorderColor != null 
            ? Border.all(color: itemBorderColor, width: 1.0)
            : null,
        gradient: item.gradient,
        boxShadow: _getItemShadows(itemElevation),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconWidget != null) ...[
            iconWidget,
            SizedBox(width: _getIconSpacing()),
          ],
          labelWidget,
        ],
      ),
    );
    
    // Add tap functionality
    if (item.onTap != null || item.onLongPress != null || item.onDoubleTap != null) {
      breadcrumbItem = GestureDetector(
        onTap: item.onTap,
        onLongPress: item.onLongPress,
        onDoubleTap: item.onDoubleTap,
        child: breadcrumbItem,
      );
    }
    
    // Add margin
    if (item.margin != null) {
      breadcrumbItem = Padding(
        padding: item.margin!,
        child: breadcrumbItem,
      );
    }
    
    // Add semantics
    if (item.semanticLabel != null) {
      breadcrumbItem = Semantics(
        label: item.semanticLabel,
        child: breadcrumbItem,
      );
    }
    
    // Add tooltip
    if (item.tooltip != null) {
      breadcrumbItem = Tooltip(
        message: item.tooltip!,
        child: breadcrumbItem,
      );
    }
    
    return breadcrumbItem;
  }
  
  /// Get item background color
  Color? _getItemBackgroundColor() {
    if (item.backgroundColor != null) return item.backgroundColor;
    return null;
  }
  
  /// Get item foreground color
  Color _getItemForegroundColor() {
    if (item.foregroundColor != null) return item.foregroundColor!;
    
    if (item.selected) {
      return item.selectedColor ?? colors.primary;
    } else {
      return item.unselectedColor ?? colors.onSurface;
    }
  }
  
  /// Get item border color
  Color? _getItemBorderColor() {
    if (item.border != null) return null;
    return null;
  }
  
  /// Get item elevation
  double _getItemElevation() {
    if (item.elevation != null) return item.elevation!;
    return 0.0;
  }
  
  /// Get item border radius
  BorderRadius _getItemBorderRadius() {
    if (item.borderRadius != null) return item.borderRadius!;
    
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return BorderRadius.circular(4.0);
      case AuiBreadcrumbSize.sm:
        return BorderRadius.circular(6.0);
      case AuiBreadcrumbSize.md:
        return BorderRadius.circular(8.0);
      case AuiBreadcrumbSize.lg:
        return BorderRadius.circular(10.0);
      case AuiBreadcrumbSize.xl:
        return BorderRadius.circular(12.0);
    }
  }
  
  /// Get item padding
  EdgeInsets _getItemPadding() {
    if (item.padding != null) return item.padding!;
    
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case AuiBreadcrumbSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case AuiBreadcrumbSize.md:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
      case AuiBreadcrumbSize.lg:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
      case AuiBreadcrumbSize.xl:
        return const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);
    }
  }
  
  /// Get item icon size
  double _getItemIconSize() {
    if (item.iconSize != null) return item.iconSize!;
    
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return 16.0;
      case AuiBreadcrumbSize.sm:
        return 18.0;
      case AuiBreadcrumbSize.md:
        return 20.0;
      case AuiBreadcrumbSize.lg:
        return 22.0;
      case AuiBreadcrumbSize.xl:
        return 24.0;
    }
  }
  
  /// Get item font size
  double _getItemFontSize() {
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return 12.0;
      case AuiBreadcrumbSize.sm:
        return 14.0;
      case AuiBreadcrumbSize.md:
        return 16.0;
      case AuiBreadcrumbSize.lg:
        return 18.0;
      case AuiBreadcrumbSize.xl:
        return 20.0;
    }
  }
  
  /// Get icon widget
  Widget? _getIconWidget(double iconSize) {
    if (item.icon == null) return null;
    
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: item.icon!,
    );
  }
  
  /// Get label widget
  Widget _getLabelWidget(double fontSize) {
    return Text(
      item.label,
      style: _getLabelTextStyle(fontSize),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
  
  /// Get label text style
  TextStyle _getLabelTextStyle(double fontSize) {
    if (item.selected) {
      return item.selectedLabelStyle ?? TextStyle(
        color: _getItemForegroundColor(),
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );
    } else {
      return item.unselectedLabelStyle ?? TextStyle(
        color: _getItemForegroundColor(),
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      );
    }
  }
  
  /// Get icon spacing
  double _getIconSpacing() {
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return 4.0;
      case AuiBreadcrumbSize.sm:
        return 6.0;
      case AuiBreadcrumbSize.md:
        return 8.0;
      case AuiBreadcrumbSize.lg:
        return 10.0;
      case AuiBreadcrumbSize.xl:
        return 12.0;
    }
  }
  
  /// Get item shadows
  List<BoxShadow> _getItemShadows(double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: item.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}

/// Shape clipper for custom breadcrumbs shapes
class _ShapeClipper extends CustomClipper<Path> {
  const _ShapeClipper(this.shape);
  
  final ShapeBorder shape;
  
  @override
  Path getClip(Size size) {
    return shape.getOuterPath(Rect.fromLTWH(0, 0, size.width, size.height));
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// Breadcrumbs utilities
class AuiBreadcrumbsUtils {
  const AuiBreadcrumbsUtils._();
  
  /// Get breadcrumbs padding for size
  static EdgeInsets getBreadcrumbsPadding(AuiBreadcrumbSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiBreadcrumbSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiBreadcrumbSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.md);
      case AuiBreadcrumbSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.xl, vertical: spacing.lg);
      case AuiBreadcrumbSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.xxl, vertical: spacing.xl);
    }
  }
  
  /// Get spacing for size
  static double getSpacing(AuiBreadcrumbSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return spacing.xs;
      case AuiBreadcrumbSize.sm:
        return spacing.sm;
      case AuiBreadcrumbSize.md:
        return spacing.md;
      case AuiBreadcrumbSize.lg:
        return spacing.lg;
      case AuiBreadcrumbSize.xl:
        return spacing.xl;
    }
  }
  
  /// Get icon size for size
  static double getIconSize(AuiBreadcrumbSize size) {
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return 16.0;
      case AuiBreadcrumbSize.sm:
        return 18.0;
      case AuiBreadcrumbSize.md:
        return 20.0;
      case AuiBreadcrumbSize.lg:
        return 22.0;
      case AuiBreadcrumbSize.xl:
        return 24.0;
    }
  }
  
  /// Get font size for size
  static double getFontSize(AuiBreadcrumbSize size) {
    switch (size) {
      case AuiBreadcrumbSize.xs:
        return 12.0;
      case AuiBreadcrumbSize.sm:
        return 14.0;
      case AuiBreadcrumbSize.md:
        return 16.0;
      case AuiBreadcrumbSize.lg:
        return 18.0;
      case AuiBreadcrumbSize.xl:
        return 20.0;
    }
  }
}
