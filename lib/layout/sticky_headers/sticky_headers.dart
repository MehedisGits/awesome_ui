import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../foundation/theme.dart';

/// Sticky header variants
enum AuiStickyHeaderVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Sticky header positions
enum AuiStickyHeaderPosition {
  top,
  bottom,
  left,
  right,
}

/// Sticky header behaviors
enum AuiStickyHeaderBehavior {
  snap,
  pin,
  floating,
  overlay,
}

/// Sticky header configuration
class AuiStickyHeaderItem {
  const AuiStickyHeaderItem({
    required this.header,
    required this.content,
    this.height,
    this.minHeight,
    this.maxHeight,
    this.width,
    this.minWidth,
    this.maxWidth,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.semanticLabel,
    this.tooltip,
    this.key,
  });

  final Widget header;
  final Widget content;
  final double? height;
  final double? minHeight;
  final double? maxHeight;
  final double? width;
  final double? minWidth;
  final double? maxWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final String? semanticLabel;
  final String? tooltip;
  final Key? key;
}

/// A comprehensive sticky headers component
class AuiStickyHeaders extends StatefulWidget {
  const AuiStickyHeaders({
    super.key,
    required this.children,
    this.variant = AuiStickyHeaderVariant.elevated,
    this.position = AuiStickyHeaderPosition.top,
    this.behavior = AuiStickyHeaderBehavior.snap,
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
    this.stickyThreshold = 0.0,
    this.stickyOffset = 0.0,
    this.stickyDuration = const Duration(milliseconds: 200),
    this.stickyCurve = Curves.easeInOut,
    this.enableSticky = true,
    this.enableSnap = true,
    this.enableFloating = false,
    this.enableOverlay = false,
    this.onStickyChanged,
    this.onSnapChanged,
  });

  final List<AuiStickyHeaderItem> children;
  final AuiStickyHeaderVariant variant;
  final AuiStickyHeaderPosition position;
  final AuiStickyHeaderBehavior behavior;
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
  final double stickyThreshold;
  final double stickyOffset;
  final Duration stickyDuration;
  final Curve stickyCurve;
  final bool enableSticky;
  final bool enableSnap;
  final bool enableFloating;
  final bool enableOverlay;
  final ValueChanged<int>? onStickyChanged;
  final ValueChanged<int>? onSnapChanged;

  @override
  State<AuiStickyHeaders> createState() => _AuiStickyHeadersState();
}

class _AuiStickyHeadersState extends State<AuiStickyHeaders> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;
  final List<GlobalKey> _headerKeys = [];
  final List<double> _headerHeights = [];
  final List<double> _headerPositions = [];
  final int _currentStickyIndex = -1;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _initializeAnimations();
    _initializeHeaders();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    for (final controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _initializeAnimations() {
    _animationControllers = List.generate(
      widget.children.length,
      (index) => AnimationController(
        duration: widget.stickyDuration,
        vsync: this,
      ),
    );
    
    _animations = _animationControllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: widget.stickyCurve,
      );
    }).toList();
  }

  void _initializeHeaders() {
    _headerKeys.clear();
    _headerHeights.clear();
    _headerPositions.clear();
    
    for (int i = 0; i < widget.children.length; i++) {
      _headerKeys.add(GlobalKey());
      _headerHeights.add(0.0);
      _headerPositions.add(0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get sticky header colors
    final stickyHeaderBackgroundColor = _getStickyHeaderBackgroundColor(colors);
    final stickyHeaderForegroundColor = _getStickyHeaderForegroundColor(colors);
    final stickyHeaderBorderColor = _getStickyHeaderBorderColor(colors);
    
    // Get sticky header elevation
    final stickyHeaderElevation = _getStickyHeaderElevation(elevation);
    
    // Get sticky header border radius
    final stickyHeaderBorderRadius = _getStickyHeaderBorderRadius(spacing);
    
    // Get sticky header padding
    final stickyHeaderPadding = _getStickyHeaderPadding(spacing);
    
    // Build sticky headers
    final stickyHeaders = _buildStickyHeaders(colors, spacing, stickyHeaderBackgroundColor!, stickyHeaderForegroundColor, stickyHeaderBorderColor, stickyHeaderElevation, stickyHeaderBorderRadius, stickyHeaderPadding);
    
    Widget stickyHeadersWidget = Container(
      padding: stickyHeaderPadding,
      decoration: BoxDecoration(
        color: stickyHeaderBackgroundColor,
        borderRadius: stickyHeaderBorderRadius,
        border: stickyHeaderBorderColor != null 
            ? Border.all(color: stickyHeaderBorderColor, width: 1.0)
            : null,
        boxShadow: _getStickyHeaderShadows(colors, stickyHeaderElevation),
      ),
      child: stickyHeaders,
    );
    
    // Add margin
    if (widget.margin != null) {
      stickyHeadersWidget = Padding(
        padding: widget.margin!,
        child: stickyHeadersWidget,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      stickyHeadersWidget = Semantics(
        label: widget.semanticLabel,
        child: stickyHeadersWidget,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      stickyHeadersWidget = Tooltip(
        message: widget.tooltip!,
        child: stickyHeadersWidget,
      );
    }
    
    return stickyHeadersWidget;
  }
  
  /// Build sticky headers
  Widget _buildStickyHeaders(
    AuiColorScheme colors,
    AuiSpacingScheme spacing,
    Color backgroundColor,
    Color foregroundColor,
    Color? borderColor,
    double elevation,
    BorderRadius? borderRadius,
    EdgeInsets padding,
  ) {
    return ListView.builder(
      controller: _scrollController,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
      primary: widget.primary,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,

      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        return _buildStickyHeaderItem(index, colors, spacing);
      },
    );
  }
  
  /// Build individual sticky header item
  Widget _buildStickyHeaderItem(int index, AuiColorScheme colors, AuiSpacingScheme spacing) {
    final item = widget.children[index];
    
    // Get item colors
    final itemBackgroundColor = _getItemBackgroundColor(item, colors);
    final itemBorderColor = _getItemBorderColor(item, colors);
    
    // Get item elevation
    final itemElevation = _getItemElevation(item);
    
    // Get item border radius
    final itemBorderRadius = _getItemBorderRadius(item, spacing);
    
    // Get item padding
    final itemPadding = _getItemPadding(item, spacing);
    
    // Get item constraints
    final itemConstraints = _getItemConstraints(item);
    
    Widget headerItem = Container(
      key: _headerKeys[index],
      constraints: itemConstraints,
      padding: itemPadding,
      decoration: BoxDecoration(
        color: itemBackgroundColor,
        borderRadius: itemBorderRadius,
        border: itemBorderColor != null 
            ? Border.all(color: itemBorderColor, width: 1.0)
            : null,
        boxShadow: _getItemShadows(item, itemElevation),
      ),
      child: Column(
        children: [
          item.header,
          item.content,
        ],
      ),
    );
    
    // Add margin
    if (item.margin != null) {
      headerItem = Padding(
        padding: item.margin!,
        child: headerItem,
      );
    }
    
    // Add semantics
    if (item.semanticLabel != null) {
      headerItem = Semantics(
        label: item.semanticLabel,
        child: headerItem,
      );
    }
    
    // Add tooltip
    if (item.tooltip != null) {
      headerItem = Tooltip(
        message: item.tooltip!,
        child: headerItem,
      );
    }
    
    // Add sticky behavior
    if (widget.enableSticky) {
      headerItem = _buildStickyBehavior(headerItem, index);
    }
    
    return headerItem;
  }
  
  /// Build sticky behavior
  Widget _buildStickyBehavior(Widget child, int index) {
    return AnimatedBuilder(
      animation: _animations[index],
      builder: (context, snapshot) {
        return Transform.translate(
          offset: _getStickyOffset(index),
          child: child,
        );
      },
    );
  }
  
  /// Get sticky offset
  Offset _getStickyOffset(int index) {
    if (!widget.enableSticky || _currentStickyIndex != index) {
      return Offset.zero;
    }
    
    final scrollOffset = _scrollController.offset;
    final headerPosition = _headerPositions[index];
    
    if (scrollOffset >= headerPosition - widget.stickyThreshold) {
      return Offset(0, widget.stickyOffset);
    }
    
    return Offset.zero;
  }
  
  /// Get item background color
  Color? _getItemBackgroundColor(AuiStickyHeaderItem item, AuiColorScheme colors) {
    if (item.backgroundColor != null) return item.backgroundColor;
    
    switch (widget.variant) {
      case AuiStickyHeaderVariant.filled:
        return colors.surface;
      case AuiStickyHeaderVariant.outlined:
        return colors.surface;
      case AuiStickyHeaderVariant.elevated:
        return colors.surface;
      case AuiStickyHeaderVariant.tonal:
        return colors.surfaceVariant;
      case AuiStickyHeaderVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get item foreground color
  
  /// Get item border color
  Color? _getItemBorderColor(AuiStickyHeaderItem item, AuiColorScheme colors) {
    if (item.borderColor != null) return item.borderColor;
    
    switch (widget.variant) {
      case AuiStickyHeaderVariant.filled:
        return null;
      case AuiStickyHeaderVariant.outlined:
        return colors.outline;
      case AuiStickyHeaderVariant.elevated:
        return null;
      case AuiStickyHeaderVariant.tonal:
        return null;
      case AuiStickyHeaderVariant.minimal:
        return null;
    }
  }
  
  /// Get item elevation
  double _getItemElevation(AuiStickyHeaderItem item) {
    if (item.elevation != null) return item.elevation!;
    
    switch (widget.variant) {
      case AuiStickyHeaderVariant.filled:
        return 0.0;
      case AuiStickyHeaderVariant.outlined:
        return 0.0;
      case AuiStickyHeaderVariant.elevated:
        return 2.0;
      case AuiStickyHeaderVariant.tonal:
        return 0.0;
      case AuiStickyHeaderVariant.minimal:
        return 0.0;
    }
  }
  
  /// Get item border radius
  BorderRadius? _getItemBorderRadius(AuiStickyHeaderItem item, AuiSpacingScheme spacing) {
    if (item.borderRadius != null) return item.borderRadius;
    
    switch (widget.variant) {
      case AuiStickyHeaderVariant.filled:
        return BorderRadius.circular(spacing.sm);
      case AuiStickyHeaderVariant.outlined:
        return BorderRadius.circular(spacing.sm);
      case AuiStickyHeaderVariant.elevated:
        return BorderRadius.circular(spacing.sm);
      case AuiStickyHeaderVariant.tonal:
        return BorderRadius.circular(spacing.sm);
      case AuiStickyHeaderVariant.minimal:
        return null;
    }
  }
  
  /// Get item padding
  EdgeInsets _getItemPadding(AuiStickyHeaderItem item, AuiSpacingScheme spacing) {
    if (item.padding != null) return item.padding!;
    return EdgeInsets.all(spacing.md);
  }
  
  /// Get item constraints
  BoxConstraints _getItemConstraints(AuiStickyHeaderItem item) {
    return BoxConstraints(
      minWidth: item.minWidth ?? 0.0,
      maxWidth: item.maxWidth ?? double.infinity,
      minHeight: item.minHeight ?? 0.0,
      maxHeight: item.maxHeight ?? double.infinity,
    );
  }
  
  /// Get item shadows
  List<BoxShadow> _getItemShadows(AuiStickyHeaderItem item, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: item.shadowColor ?? Colors.black.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
  
  /// Get sticky header background color
  Color? _getStickyHeaderBackgroundColor(AuiColorScheme colors) {
    return widget.backgroundColor ?? Colors.transparent;
  }
  
  /// Get sticky header foreground color
  Color _getStickyHeaderForegroundColor(AuiColorScheme colors) {
    return widget.foregroundColor ?? colors.onSurface;
  }
  
  /// Get sticky header border color
  Color? _getStickyHeaderBorderColor(AuiColorScheme colors) {
    return widget.borderColor;
  }
  
  /// Get sticky header elevation
  double _getStickyHeaderElevation(AuiElevationScheme elevation) {
    return widget.elevation ?? elevation.level0;
  }
  
  /// Get sticky header border radius
  BorderRadius? _getStickyHeaderBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius;
    return null;
  }
  
  /// Get sticky header padding
  EdgeInsets _getStickyHeaderPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    return EdgeInsets.zero;
  }
  
  /// Get sticky header shadows
  List<BoxShadow> _getStickyHeaderShadows(AuiColorScheme colors, double elevation) {
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

/// Sticky headers utilities
class AuiStickyHeadersUtils {
  const AuiStickyHeadersUtils._();
  
  /// Calculate sticky threshold
  static double calculateStickyThreshold(double headerHeight, double threshold) {
    return headerHeight * threshold;
  }
  
  /// Calculate sticky offset
  static double calculateStickyOffset(double scrollOffset, double headerPosition, double threshold) {
    if (scrollOffset >= headerPosition - threshold) {
      return scrollOffset - headerPosition + threshold;
    }
    return 0.0;
  }
  
  /// Check if header should be sticky
  static bool shouldBeSticky(double scrollOffset, double headerPosition, double threshold) {
    return scrollOffset >= headerPosition - threshold;
  }
  
  /// Calculate header position
  static double calculateHeaderPosition(int index, List<double> headerHeights) {
    double position = 0.0;
    for (int i = 0; i < index; i++) {
      position += headerHeights[i];
    }
    return position;
  }
  
  /// Calculate header height
  static double calculateHeaderHeight(GlobalKey key) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 0.0;
  }
}
