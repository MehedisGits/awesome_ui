import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../foundation/theme.dart';

/// Masonry grid alignment
enum AuiMasonryAlignment {
  start,
  center,
  end,
  spaceAround,
  spaceBetween,
  spaceEvenly,
}

/// Masonry item sizing
enum AuiMasonryItemSize {
  auto,
  fill,
  fit,
}

/// Masonry item configuration
class AuiMasonryItem {
  const AuiMasonryItem({
    required this.child,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.aspectRatio,
    this.flex = 1,
    this.align = AuiMasonryAlignment.center,
    this.justify = AuiMasonryAlignment.center,
    this.size = AuiMasonryItemSize.auto,
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
  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  final double? aspectRatio;
  final int flex;
  final AuiMasonryAlignment align;
  final AuiMasonryAlignment justify;
  final AuiMasonryItemSize size;
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

/// A comprehensive masonry grid component
class AuiMasonryGrid extends StatefulWidget {
  const AuiMasonryGrid({
    super.key,
    required this.children,
    this.columns = 2,
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
    this.align = AuiMasonryAlignment.center,
    this.justify = AuiMasonryAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.physics,
    this.shrinkWrap = false,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.primary = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.none,
    this.anchor = 0.0,
    this.center,
    this.cacheExtentStyle = CacheExtentStyle.pixel,
    this.scrollBehavior,
    this.autoFit = true,
    this.autoFitMinWidth = 200.0,
    this.autoFitMaxWidth = 400.0,
    this.autoFitAspectRatio = 0.75,
    this.autoFitMinAspectRatio = 0.5,
    this.autoFitMaxAspectRatio = 2.0,
  });

  final List<AuiMasonryItem> children;
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
  final AuiMasonryAlignment align;
  final AuiMasonryAlignment justify;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool reverse;
  final Axis scrollDirection;
  final ScrollController? controller;
  final bool primary;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final double anchor;
  final Key? center;
  final CacheExtentStyle cacheExtentStyle;
  final ScrollBehavior? scrollBehavior;
  final bool autoFit;
  final double autoFitMinWidth;
  final double autoFitMaxWidth;
  final double autoFitAspectRatio;
  final double autoFitMinAspectRatio;
  final double autoFitMaxAspectRatio;

  @override
  State<AuiMasonryGrid> createState() => _AuiMasonryGridState();
}

class _AuiMasonryGridState extends State<AuiMasonryGrid> {
  late ScrollController _scrollController;
  final List<double> _columnHeights = [];
  final List<List<Widget>> _columnWidgets = [];

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _initializeColumns();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(AuiMasonryGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.children.length != widget.children.length ||
        oldWidget.columns != widget.columns) {
      _initializeColumns();
    }
  }

  void _initializeColumns() {
    _columnHeights.clear();
    _columnWidgets.clear();
    
    for (int i = 0; i < widget.columns; i++) {
      _columnHeights.add(0.0);
      _columnWidgets.add([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get masonry colors
    final masonryBackgroundColor = _getMasonryBackgroundColor(colors);
    final masonryBorderColor = _getMasonryBorderColor(colors);
    
    // Get masonry elevation
    final masonryElevation = _getMasonryElevation(elevation);
    
    // Get masonry border radius
    final masonryBorderRadius = _getMasonryBorderRadius(spacing);
    
    // Get masonry padding
    final masonryPadding = _getMasonryPadding(spacing);
    
    // Get masonry gaps
    final masonryRowGap = _getMasonryRowGap();
    final masonryColumnGap = _getMasonryColumnGap();
    
    // Build masonry items
    final masonryItems = _buildMasonryItems(colors, spacing, masonryRowGap, masonryColumnGap);
    
    Widget masonry = Container(
      padding: masonryPadding,
      decoration: BoxDecoration(
        color: masonryBackgroundColor,
        borderRadius: masonryBorderRadius,
        border: masonryBorderColor != null 
            ? Border.all(color: masonryBorderColor, width: 1.0)
            : null,
        boxShadow: _getMasonryShadows(colors, masonryElevation),
      ),
      child: _buildMasonryLayout(masonryItems, masonryRowGap, masonryColumnGap),
    );
    
    // Add margin
    if (widget.margin != null) {
      masonry = Padding(
        padding: widget.margin!,
        child: masonry,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      masonry = Semantics(
        label: widget.semanticLabel,
        child: masonry,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      masonry = Tooltip(
        message: widget.tooltip!,
        child: masonry,
      );
    }
    
    return masonry;
  }
  
  /// Get masonry background color
  Color? _getMasonryBackgroundColor(AuiColorScheme colors) {
    return widget.backgroundColor ?? Colors.transparent;
  }
  
  /// Get masonry border color
  Color? _getMasonryBorderColor(AuiColorScheme colors) {
    return widget.border?.top.color;
  }
  
  /// Get masonry elevation
  double _getMasonryElevation(AuiElevationScheme elevation) {
    return widget.elevation ?? elevation.level0;
  }
  
  /// Get masonry border radius
  BorderRadius? _getMasonryBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius;
    return null;
  }
  
  /// Get masonry padding
  EdgeInsets _getMasonryPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    return EdgeInsets.zero;
  }
  
  /// Get masonry row gap
  double _getMasonryRowGap() {
    return widget.rowGap ?? widget.gap;
  }
  
  /// Get masonry column gap
  double _getMasonryColumnGap() {
    return widget.columnGap ?? widget.gap;
  }
  
  /// Build masonry items
  List<Widget> _buildMasonryItems(AuiColorScheme colors, AuiSpacingScheme spacing, double rowGap, double columnGap) {
    return widget.children.map((item) {
      return _AuiMasonryItemWidget(
        item: item,
        colors: colors,
        spacing: spacing,
        rowGap: rowGap,
        columnGap: columnGap,
        autoFit: widget.autoFit,
        autoFitMinWidth: widget.autoFitMinWidth,
        autoFitMaxWidth: widget.autoFitMaxWidth,
        autoFitAspectRatio: widget.autoFitAspectRatio,
        autoFitMinAspectRatio: widget.autoFitMinAspectRatio,
        autoFitMaxAspectRatio: widget.autoFitMaxAspectRatio,
      );
    }).toList();
  }
  
  /// Build masonry layout
  Widget _buildMasonryLayout(List<Widget> items, double rowGap, double columnGap) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final columnWidth = (availableWidth - (columnGap * (widget.columns - 1))) / widget.columns;
        
        // Reset column heights
        _initializeColumns();
        
        // Distribute items to columns
        for (int i = 0; i < items.length; i++) {
          final item = widget.children[i];
          final itemWidget = items[i];
          
          // Find shortest column
          int shortestColumn = 0;
          for (int j = 1; j < widget.columns; j++) {
            if (_columnHeights[j] < _columnHeights[shortestColumn]) {
              shortestColumn = j;
            }
          }
          
          // Add item to shortest column
          _columnWidgets[shortestColumn].add(itemWidget);
          
          // Update column height
          final itemHeight = _calculateItemHeight(item, columnWidth);
          _columnHeights[shortestColumn] += itemHeight + rowGap;
        }
        
        // Build columns
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(widget.columns, (index) {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _columnWidgets[index],
              ),
            );
          }),
        );
      },
    );
  }
  
  /// Calculate item height
  double _calculateItemHeight(AuiMasonryItem item, double columnWidth) {
    if (item.height != null) return item.height!;
    
    if (item.aspectRatio != null) {
      return columnWidth / item.aspectRatio!;
    }
    
    if (widget.autoFit) {
      final aspectRatio = _calculateAutoFitAspectRatio(item);
      return columnWidth / aspectRatio;
    }
    
    return 200.0; // Default height
  }
  
  /// Calculate auto-fit aspect ratio
  double _calculateAutoFitAspectRatio(AuiMasonryItem item) {
    if (item.aspectRatio != null) {
      return item.aspectRatio!.clamp(
        widget.autoFitMinAspectRatio,
        widget.autoFitMaxAspectRatio,
      );
    }
    
    return widget.autoFitAspectRatio;
  }
  
  /// Get masonry shadows
  List<BoxShadow> _getMasonryShadows(AuiColorScheme colors, double elevation) {
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

/// Individual masonry item widget
class _AuiMasonryItemWidget extends StatelessWidget {
  const _AuiMasonryItemWidget({
    required this.item,
    required this.colors,
    required this.spacing,
    required this.rowGap,
    required this.columnGap,
    required this.autoFit,
    required this.autoFitMinWidth,
    required this.autoFitMaxWidth,
    required this.autoFitAspectRatio,
    required this.autoFitMinAspectRatio,
    required this.autoFitMaxAspectRatio,
  });

  final AuiMasonryItem item;
  final AuiColorScheme colors;
  final AuiSpacingScheme spacing;
  final double rowGap;
  final double columnGap;
  final bool autoFit;
  final double autoFitMinWidth;
  final double autoFitMaxWidth;
  final double autoFitAspectRatio;
  final double autoFitMinAspectRatio;
  final double autoFitMaxAspectRatio;

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

/// Masonry utilities
class AuiMasonryUtils {
  const AuiMasonryUtils._();
  
  /// Calculate optimal columns for container width
  static int calculateOptimalColumns(double containerWidth, double minItemWidth, double gap) {
    final availableWidth = containerWidth + gap;
    final itemWidth = minItemWidth + gap;
    return (availableWidth / itemWidth).floor().clamp(1, 12);
  }
  
  /// Calculate item width for columns
  static double calculateItemWidth(double containerWidth, int columns, double gap) {
    return (containerWidth - (gap * (columns - 1))) / columns;
  }
  
  /// Calculate item height with aspect ratio
  static double calculateItemHeight(double width, double aspectRatio) {
    return width / aspectRatio;
  }
  
  /// Calculate auto-fit aspect ratio
  static double calculateAutoFitAspectRatio(double baseAspectRatio, double minAspectRatio, double maxAspectRatio) {
    return baseAspectRatio.clamp(minAspectRatio, maxAspectRatio);
  }
  
  /// Distribute items to columns
  static List<List<int>> distributeItemsToColumns(int itemCount, int columns) {
    final List<List<int>> columnItems = List.generate(columns, (_) => []);
    final List<double> columnHeights = List.filled(columns, 0.0);
    
    for (int i = 0; i < itemCount; i++) {
      // Find shortest column
      int shortestColumn = 0;
      for (int j = 1; j < columns; j++) {
        if (columnHeights[j] < columnHeights[shortestColumn]) {
          shortestColumn = j;
        }
      }
      
      // Add item to shortest column
      columnItems[shortestColumn].add(i);
      
      // Update column height (simplified)
      columnHeights[shortestColumn] += 1.0;
    }
    
    return columnItems;
  }
}
