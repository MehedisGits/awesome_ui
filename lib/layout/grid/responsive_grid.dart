import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Grid breakpoints
enum AuiGridBreakpoint {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Grid alignment
enum AuiGridAlignment {
  start,
  center,
  end,
  stretch,
  spaceAround,
  spaceBetween,
  spaceEvenly,
}

/// Grid item sizing
enum AuiGridItemSize {
  auto,
  fill,
  fit,
}

/// Grid item configuration
class AuiGridItem {
  const AuiGridItem({
    required this.child,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.span = 1,
    this.offset = 0,
    this.order = 0,
    this.align = AuiGridAlignment.stretch,
    this.justify = AuiGridAlignment.stretch,
    this.size = AuiGridItemSize.auto,
    this.minHeight,
    this.maxHeight,
    this.minWidth,
    this.maxWidth,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.semanticLabel,
    this.tooltip,
    this.key,
  });

  final Widget child;
  final int? xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final int span;
  final int offset;
  final int order;
  final AuiGridAlignment align;
  final AuiGridAlignment justify;
  final AuiGridItemSize size;
  final double? minHeight;
  final double? maxHeight;
  final double? minWidth;
  final double? maxWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final String? semanticLabel;
  final String? tooltip;
  final Key? key;
}

/// A comprehensive responsive grid component
class AuiResponsiveGrid extends StatelessWidget {
  const AuiResponsiveGrid({
    super.key,
    required this.children,
    this.columns = 12,
    this.gap = 16.0,
    this.rowGap,
    this.columnGap,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.semanticLabel,
    this.tooltip,
    this.align = AuiGridAlignment.stretch,
    this.justify = AuiGridAlignment.stretch,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisCount,
    this.childAspectRatio,
    this.aspectRatio,
    this.maxCrossAxisExtent,
    this.minCrossAxisExtent,
    this.maxMainAxisExtent,
    this.minMainAxisExtent,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.physics,
    this.shrinkWrap = false,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.primary = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.none,
    this.anchor = 0.0,
    this.center,
    this.scrollBehavior,
  });

  final List<AuiGridItem> children;
  final int columns;
  final double gap;
  final double? rowGap;
  final double? columnGap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final String? semanticLabel;
  final String? tooltip;
  final AuiGridAlignment align;
  final AuiGridAlignment justify;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final int? crossAxisCount;
  final double? childAspectRatio;
  final double? aspectRatio;
  final double? maxCrossAxisExtent;
  final double? minCrossAxisExtent;
  final double? maxMainAxisExtent;
  final double? minMainAxisExtent;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool reverse;
  final Axis scrollDirection;
  final ScrollController? controller;
  final bool primary;
  final double? cacheExtent;
  final int? semanticChildCount;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final double anchor;
  final Key? center;
  final ScrollBehavior? scrollBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get grid colors
    final gridBackgroundColor = _getGridBackgroundColor(colors);
    final gridBorderColor = _getGridBorderColor(colors);
    
    // Get grid elevation
    final gridElevation = _getGridElevation(elevation);
    
    // Get grid border radius
    final gridBorderRadius = _getGridBorderRadius(spacing);
    
    // Get grid padding
    final gridPadding = _getGridPadding(spacing);
    
    // Get grid gaps
    final gridRowGap = _getGridRowGap();
    final gridColumnGap = _getGridColumnGap();
    
    // Get grid constraints
    final gridConstraints = _getGridConstraints();
    
    // Build grid items
    final gridItems = _buildGridItems(colors, spacing, gridRowGap, gridColumnGap);
    
    Widget grid = Container(
      constraints: gridConstraints,
      padding: gridPadding,
      decoration: BoxDecoration(
        color: gridBackgroundColor,
        borderRadius: gridBorderRadius,
        border: gridBorderColor != null 
            ? Border.all(color: gridBorderColor, width: 1.0)
            : null,
        boxShadow: _getGridShadows(colors, gridElevation),
      ),
      child: _buildGridLayout(gridItems, gridRowGap, gridColumnGap),
    );
    
    // Add margin
    if (margin != null) {
      grid = Padding(
        padding: margin!,
        child: grid,
      );
    }
    
    // Add semantics
    if (semanticLabel != null) {
      grid = Semantics(
        label: semanticLabel,
        child: grid,
      );
    }
    
    // Add tooltip
    if (tooltip != null) {
      grid = Tooltip(
        message: tooltip!,
        child: grid,
      );
    }
    
    return grid;
  }
  
  /// Get grid background color
  Color? _getGridBackgroundColor(AuiColorScheme colors) {
    return backgroundColor ?? Colors.transparent;
  }
  
  /// Get grid border color
  Color? _getGridBorderColor(AuiColorScheme colors) {
    return border?.top.color;
  }
  
  /// Get grid elevation
  double _getGridElevation(AuiElevationScheme elevation) {
    return this.elevation ?? elevation.level0;
  }
  
  /// Get grid border radius
  BorderRadius? _getGridBorderRadius(AuiSpacingScheme spacing) {
    if (borderRadius != null) return borderRadius;
    return null;
  }
  
  /// Get grid padding
  EdgeInsets _getGridPadding(AuiSpacingScheme spacing) {
    if (padding != null) return padding!;
    return EdgeInsets.zero;
  }
  
  /// Get grid row gap
  double _getGridRowGap() {
    return rowGap ?? gap;
  }
  
  /// Get grid column gap
  double _getGridColumnGap() {
    return columnGap ?? gap;
  }
  
  /// Get grid constraints
  BoxConstraints _getGridConstraints() {
    return BoxConstraints(
      minWidth: minCrossAxisExtent ?? 0.0,
      maxWidth: maxCrossAxisExtent ?? double.infinity,
      minHeight: minMainAxisExtent ?? 0.0,
      maxHeight: maxMainAxisExtent ?? double.infinity,
    );
  }
  
  /// Build grid items
  List<Widget> _buildGridItems(AuiColorScheme colors, AuiSpacingScheme spacing, double rowGap, double columnGap) {
    return children.map((item) {
      return _AuiGridItemWidget(
        item: item,
        colors: colors,
        spacing: spacing,
        columns: columns,
        rowGap: rowGap,
        columnGap: columnGap,
      );
    }).toList();
  }
  
  /// Build grid layout
  Widget _buildGridLayout(List<Widget> items, double rowGap, double columnGap) {
    if (crossAxisCount != null) {
      return GridView.count(
        crossAxisCount: crossAxisCount!,
        childAspectRatio: childAspectRatio ?? 1.0,
        crossAxisSpacing: columnGap,
        mainAxisSpacing: rowGap,
        physics: physics,
        shrinkWrap: shrinkWrap,
        reverse: reverse,
        scrollDirection: scrollDirection,
        controller: controller,
        primary: primary,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        children: items,
      );
    } else if (maxCrossAxisExtent != null) {
      return GridView.extent(
        maxCrossAxisExtent: maxCrossAxisExtent!,
        childAspectRatio: childAspectRatio ?? 1.0,
        crossAxisSpacing: columnGap,
        mainAxisSpacing: rowGap,
        physics: physics,
        shrinkWrap: shrinkWrap,
        reverse: reverse,
        scrollDirection: scrollDirection,
        controller: controller,
        primary: primary,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        children: items,
      );
    } else {
      return _AuiCustomGrid(
        columns: columns,
        rowGap: rowGap,
        columnGap: columnGap,
        align: align,
        justify: justify,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: items,
      );
    }
  }
  
  /// Get grid shadows
  List<BoxShadow> _getGridShadows(AuiColorScheme colors, double elevation) {
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

/// Individual grid item widget
class _AuiGridItemWidget extends StatelessWidget {
  const _AuiGridItemWidget({
    required this.item,
    required this.colors,
    required this.spacing,
    required this.columns,
    required this.rowGap,
    required this.columnGap,
  });

  final AuiGridItem item;
  final AuiColorScheme colors;
  final AuiSpacingScheme spacing;
  final int columns;
  final double rowGap;
  final double columnGap;

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
    
    // Get item constraints
    final itemConstraints = _getItemConstraints();
    
    Widget itemWidget = Container(
      key: item.key,
      constraints: itemConstraints,
      padding: itemPadding,
      decoration: BoxDecoration(
        color: itemBackgroundColor,
        borderRadius: itemBorderRadius,
        border: itemBorderColor != null 
            ? Border.all(color: itemBorderColor, width: 1.0)
            : null,
        boxShadow: _getItemShadows(itemElevation),
      ),
      child: item.child,
    );
    
    // Add margin
    if (item.margin != null) {
      itemWidget = Padding(
        padding: item.margin!,
        child: itemWidget,
      );
    }
    
    // Add semantics
    if (item.semanticLabel != null) {
      itemWidget = Semantics(
        label: item.semanticLabel,
        child: itemWidget,
      );
    }
    
    // Add tooltip
    if (item.tooltip != null) {
      itemWidget = Tooltip(
        message: item.tooltip!,
        child: itemWidget,
      );
    }
    
    return itemWidget;
  }
  
  /// Get item background color
  Color? _getItemBackgroundColor() {
    return item.backgroundColor;
  }
  
  /// Get item border color
  Color? _getItemBorderColor() {
    return item.border?.top.color;
  }
  
  /// Get item elevation
  double _getItemElevation() {
    return item.elevation ?? 0.0;
  }
  
  /// Get item border radius
  BorderRadius? _getItemBorderRadius() {
    return item.borderRadius;
  }
  
  /// Get item padding
  EdgeInsets _getItemPadding() {
    return item.padding ?? EdgeInsets.zero;
  }
  
  /// Get item constraints
  BoxConstraints _getItemConstraints() {
    return BoxConstraints(
      minWidth: item.minWidth ?? 0.0,
      maxWidth: item.maxWidth ?? double.infinity,
      minHeight: item.minHeight ?? 0.0,
      maxHeight: item.maxHeight ?? double.infinity,
    );
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

/// Custom grid layout implementation
class _AuiCustomGrid extends StatelessWidget {
  const _AuiCustomGrid({
    required this.children,
    required this.columns,
    required this.rowGap,
    required this.columnGap,
    required this.align,
    required this.justify,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
  });

  final List<Widget> children;
  final int columns;
  final double rowGap;
  final double columnGap;
  final AuiGridAlignment align;
  final AuiGridAlignment justify;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final itemWidth = (availableWidth - (columnGap * (columns - 1))) / columns;
        
        return Wrap(
          spacing: columnGap,
          runSpacing: rowGap,
          alignment: _getWrapAlignment(align),
          runAlignment: _getWrapAlignment(justify),
          crossAxisAlignment: _getWrapCrossAxisAlignment(crossAxisAlignment),
          children: children.map((child) {
            return SizedBox(
              width: itemWidth,
              child: child,
            );
          }).toList(),
        );
      },
    );
  }
  
  /// Get WrapAlignment from AuiGridAlignment
  WrapAlignment _getWrapAlignment(AuiGridAlignment alignment) {
    switch (alignment) {
      case AuiGridAlignment.start:
        return WrapAlignment.start;
      case AuiGridAlignment.center:
        return WrapAlignment.center;
      case AuiGridAlignment.end:
        return WrapAlignment.end;
      case AuiGridAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case AuiGridAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case AuiGridAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
      case AuiGridAlignment.stretch:
        return WrapAlignment.start;
    }
  }
  
  /// Get WrapCrossAlignment from CrossAxisAlignment
  WrapCrossAlignment _getWrapCrossAxisAlignment(CrossAxisAlignment alignment) {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.center:
        return WrapCrossAlignment.center;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.stretch:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.baseline:
        return WrapCrossAlignment.start;
    }
  }
}

/// Grid utilities
class AuiGridUtils {
  const AuiGridUtils._();
  
  /// Get column span for breakpoint
  static int getColumnSpan(AuiGridItem item, AuiGridBreakpoint breakpoint) {
    switch (breakpoint) {
      case AuiGridBreakpoint.xs:
        return item.xs ?? item.span;
      case AuiGridBreakpoint.sm:
        return item.sm ?? item.xs ?? item.span;
      case AuiGridBreakpoint.md:
        return item.md ?? item.sm ?? item.xs ?? item.span;
      case AuiGridBreakpoint.lg:
        return item.lg ?? item.md ?? item.sm ?? item.xs ?? item.span;
      case AuiGridBreakpoint.xl:
        return item.xl ?? item.lg ?? item.md ?? item.sm ?? item.xs ?? item.span;
    }
  }
  
  /// Get offset for breakpoint
  static int getOffset(AuiGridItem item, AuiGridBreakpoint breakpoint) {
    return item.offset;
  }
  
  /// Get order for breakpoint
  static int getOrder(AuiGridItem item, AuiGridBreakpoint breakpoint) {
    return item.order;
  }
  
  /// Calculate item width
  static double calculateItemWidth(double containerWidth, int columns, double columnGap, int span) {
    final availableWidth = containerWidth - (columnGap * (columns - 1));
    final columnWidth = availableWidth / columns;
    return (columnWidth * span) + (columnGap * (span - 1));
  }
  
  /// Calculate item height
  static double calculateItemHeight(double containerHeight, int rows, double rowGap, int span) {
    final availableHeight = containerHeight - (rowGap * (rows - 1));
    final rowHeight = availableHeight / rows;
    return (rowHeight * span) + (rowGap * (span - 1));
  }
}
