import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Split view orientation
enum AuiSplitOrientation {
  horizontal,
  vertical,
}

/// Split view alignment
enum AuiSplitAlignment {
  start,
  center,
  end,
  stretch,
}

/// Split view resize behavior
enum AuiSplitResizeBehavior {
  proportional,
  fixed,
  flexible,
}

/// Split view configuration
class AuiSplitPane {
  const AuiSplitPane({
    required this.child,
    this.minSize = 100.0,
    this.maxSize,
    this.initialSize,
    this.flex = 1,
    this.align = AuiSplitAlignment.stretch,
    this.resizeBehavior = AuiSplitResizeBehavior.flexible,
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
  final double minSize;
  final double? maxSize;
  final double? initialSize;
  final int flex;
  final AuiSplitAlignment align;
  final AuiSplitResizeBehavior resizeBehavior;
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

/// A comprehensive split view component
class AuiSplitView extends StatefulWidget {
  const AuiSplitView({
    super.key,
    required this.children,
    this.orientation = AuiSplitOrientation.horizontal,
    this.dividerSize = 8.0,
    this.dividerColor,
    this.dividerThickness = 1.0,
    this.dividerStyle = DividerStyle.solid,
    this.resizeBehavior = AuiSplitResizeBehavior.flexible,
    this.initialSizes,
    this.minSizes,
    this.maxSizes,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.semanticLabel,
    this.tooltip,
    this.onResize,
    this.onResizeStart,
    this.onResizeEnd,
    this.enableResize = true,
    this.enableDrag = true,
    this.enableKeyboardResize = true,
    this.resizeThreshold = 0.1,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.constraints,
    this.clipBehavior = Clip.none,
  });

  final List<AuiSplitPane> children;
  final AuiSplitOrientation orientation;
  final double dividerSize;
  final Color? dividerColor;
  final double dividerThickness;
  final DividerStyle dividerStyle;
  final AuiSplitResizeBehavior resizeBehavior;
  final List<double>? initialSizes;
  final List<double>? minSizes;
  final List<double>? maxSizes;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final String? semanticLabel;
  final String? tooltip;
  final ValueChanged<List<double>>? onResize;
  final VoidCallback? onResizeStart;
  final VoidCallback? onResizeEnd;
  final bool enableResize;
  final bool enableDrag;
  final bool enableKeyboardResize;
  final double resizeThreshold;
  final Duration animationDuration;
  final Curve animationCurve;
  final BoxConstraints? constraints;
  final Clip clipBehavior;

  @override
  State<AuiSplitView> createState() => _AuiSplitViewState();
}

class _AuiSplitViewState extends State<AuiSplitView> with TickerProviderStateMixin {
  late List<double> _sizes;
  late List<double> _minSizes;
  late List<double> _maxSizes;
  late AnimationController _animationController;
  bool _isResizing = false;
  int? _resizingIndex;

  @override
  void initState() {
    super.initState();
    _initializeSizes();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializeSizes() {
    final childCount = widget.children.length;
    _sizes = List.filled(childCount, 0.0);
    _minSizes = List.filled(childCount, 0.0);
    _maxSizes = List.filled(childCount, double.infinity);
    
    // Initialize sizes
    for (int i = 0; i < childCount; i++) {
      final child = widget.children[i];
      _sizes[i] = child.initialSize ?? (1.0 / childCount);
      _minSizes[i] = widget.minSizes?[i] ?? child.minSize;
      _maxSizes[i] = widget.maxSizes?[i] ?? child.maxSize ?? double.infinity;
    }
    
    // Apply initial sizes if provided
    if (widget.initialSizes != null) {
      for (int i = 0; i < widget.initialSizes!.length && i < childCount; i++) {
        _sizes[i] = widget.initialSizes![i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get split view colors
    final splitViewBackgroundColor = _getSplitViewBackgroundColor(colors);
    final splitViewBorderColor = _getSplitViewBorderColor(colors);
    
    // Get split view elevation
    final splitViewElevation = _getSplitViewElevation(elevation);
    
    // Get split view border radius
    final splitViewBorderRadius = _getSplitViewBorderRadius(spacing);
    
    // Get split view padding
    final splitViewPadding = _getSplitViewPadding(spacing);
    
    // Build split view layout
    final splitViewLayout = _buildSplitViewLayout(colors, spacing);
    
    Widget splitView = Container(
      constraints: widget.constraints,
      padding: splitViewPadding,
      decoration: BoxDecoration(
        color: splitViewBackgroundColor,
        borderRadius: splitViewBorderRadius,
        border: splitViewBorderColor != null 
            ? Border.all(color: splitViewBorderColor, width: 1.0)
            : null,
        boxShadow: _getSplitViewShadows(colors, splitViewElevation),
      ),
      clipBehavior: widget.clipBehavior,
      child: splitViewLayout,
    );
    
    // Add margin
    if (widget.margin != null) {
      splitView = Padding(
        padding: widget.margin!,
        child: splitView,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      splitView = Semantics(
        label: widget.semanticLabel,
        child: splitView,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      splitView = Tooltip(
        message: widget.tooltip!,
        child: splitView,
      );
    }
    
    return splitView;
  }
  
  /// Get split view background color
  Color? _getSplitViewBackgroundColor(AuiColorScheme colors) {
    return widget.backgroundColor ?? Colors.transparent;
  }
  
  /// Get split view border color
  Color? _getSplitViewBorderColor(AuiColorScheme colors) {
    return widget.border?.top.color;
  }
  
  /// Get split view elevation
  double _getSplitViewElevation(AuiElevationScheme elevation) {
    return widget.elevation ?? elevation.level0;
  }
  
  /// Get split view border radius
  BorderRadius? _getSplitViewBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius;
    return null;
  }
  
  /// Get split view padding
  EdgeInsets _getSplitViewPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    return EdgeInsets.zero;
  }
  
  /// Build split view layout
  Widget _buildSplitViewLayout(AuiColorScheme colors, AuiSpacingScheme spacing) {
    if (widget.children.isEmpty) return const SizedBox.shrink();
    if (widget.children.length == 1) return _buildPane(0);
    
    final children = <Widget>[];
    
    for (int i = 0; i < widget.children.length; i++) {
      // Add pane
      children.add(_buildPane(i));
      
      // Add divider (except for last pane)
      if (i < widget.children.length - 1) {
        children.add(_buildDivider(i, colors));
      }
    }
    
    if (widget.orientation == AuiSplitOrientation.horizontal) {
      return Row(
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }
  
  /// Build individual pane
  Widget _buildPane(int index) {
    final child = widget.children[index];
    final size = _sizes[index];
    
    Widget pane = Container(
      key: child.key,
      padding: child.padding,
      decoration: BoxDecoration(
        color: child.backgroundColor,
        borderRadius: child.borderRadius,
        border: child.border,
        boxShadow: _getPaneShadows(child.elevation ?? 0.0),
      ),
      child: child.child,
    );
    
    // Add margin
    if (child.margin != null) {
      pane = Padding(
        padding: child.margin!,
        child: pane,
      );
    }
    
    // Add semantics
    if (child.semanticLabel != null) {
      pane = Semantics(
        label: child.semanticLabel,
        child: pane,
      );
    }
    
    // Add tooltip
    if (child.tooltip != null) {
      pane = Tooltip(
        message: child.tooltip!,
        child: pane,
      );
    }
    
    // Wrap with size constraints
    if (widget.orientation == AuiSplitOrientation.horizontal) {
      return SizedBox(
        width: size,
        child: pane,
      );
    } else {
      return SizedBox(
        height: size,
        child: pane,
      );
    }
  }
  
  /// Build divider
  Widget _buildDivider(int index, AuiColorScheme colors) {
    final dividerColor = widget.dividerColor ?? colors.outline.withValues(alpha:0.3);
    
    Widget divider = Container(
      color: dividerColor,
      child: widget.orientation == AuiSplitOrientation.horizontal
          ? SizedBox(
              width: widget.dividerThickness,
              height: widget.dividerSize,
            )
          : SizedBox(
              height: widget.dividerThickness,
              width: widget.dividerSize,
            ),
    );
    
    // Add resize functionality
    if (widget.enableResize) {
      divider = GestureDetector(
        onPanStart: (details) => _onResizeStart(index),
        onPanUpdate: (details) => _onResizeUpdate(details, index),
        onPanEnd: (details) => _onResizeEnd(),
        child: MouseRegion(
          cursor: widget.orientation == AuiSplitOrientation.horizontal
              ? SystemMouseCursors.resizeColumn
              : SystemMouseCursors.resizeRow,
          child: divider,
        ),
      );
    }
    
    return divider;
  }
  
  /// Handle resize start
  void _onResizeStart(int index) {
    if (!widget.enableResize) return;
    
    setState(() {
      _isResizing = true;
      _resizingIndex = index;
    });
    
    if (widget.onResizeStart != null) {
      widget.onResizeStart!();
    }
  }
  
  /// Handle resize update
  void _onResizeUpdate(DragUpdateDetails details, int index) {
    if (!widget.enableResize || !_isResizing || _resizingIndex != index) return;
    
    final delta = widget.orientation == AuiSplitOrientation.horizontal
        ? details.delta.dx
        : details.delta.dy;
    
    if (delta.abs() < widget.resizeThreshold) return;
    
    setState(() {
      final newSizes = List<double>.from(_sizes);
      
      // Update current pane size
      newSizes[index] = (_sizes[index] + delta).clamp(
        _minSizes[index],
        _maxSizes[index],
      );
      
      // Update next pane size
      if (index + 1 < newSizes.length) {
        newSizes[index + 1] = (_sizes[index + 1] - delta).clamp(
          _minSizes[index + 1],
          _maxSizes[index + 1],
        );
      }
      
      _sizes = newSizes;
    });
    
    if (widget.onResize != null) {
      widget.onResize!(_sizes);
    }
  }
  
  /// Handle resize end
  void _onResizeEnd() {
    if (!_isResizing) return;
    
    setState(() {
      _isResizing = false;
      _resizingIndex = null;
    });
    
    if (widget.onResizeEnd != null) {
      widget.onResizeEnd!();
    }
  }
  
  /// Get pane shadows
  List<BoxShadow> _getPaneShadows(double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
  
  /// Get split view shadows
  List<BoxShadow> _getSplitViewShadows(AuiColorScheme colors, double elevation) {
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

/// Divider style enum
enum DividerStyle {
  solid,
  dashed,
  dotted,
}

/// Split view utilities
class AuiSplitViewUtils {
  const AuiSplitViewUtils._();
  
  /// Calculate proportional sizes
  static List<double> calculateProportionalSizes(
    List<double> weights,
    double totalSize,
  ) {
    final totalWeight = weights.reduce((a, b) => a + b);
    return weights.map((weight) => (weight / totalWeight) * totalSize).toList();
  }
  
  /// Calculate flexible sizes
  static List<double> calculateFlexibleSizes(
    List<int> flexValues,
    double totalSize,
    List<double> minSizes,
    List<double> maxSizes,
  ) {
    final totalFlex = flexValues.reduce((a, b) => a + b);
    final baseSize = totalSize / totalFlex;
    
    return flexValues.map((flex) {
      final size = baseSize * flex;
      return size.clamp(minSizes[flexValues.indexOf(flex)], maxSizes[flexValues.indexOf(flex)]);
    }).toList();
  }
  
  /// Validate sizes
  static bool validateSizes(
    List<double> sizes,
    List<double> minSizes,
    List<double> maxSizes,
  ) {
    for (int i = 0; i < sizes.length; i++) {
      if (sizes[i] < minSizes[i] || sizes[i] > maxSizes[i]) {
        return false;
      }
    }
    return true;
  }
  
  /// Normalize sizes
  static List<double> normalizeSizes(List<double> sizes) {
    final total = sizes.reduce((a, b) => a + b);
    if (total == 0) return sizes;
    return sizes.map((size) => size / total).toList();
  }
}
