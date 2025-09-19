import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../foundation/theme.dart';

/// Timeline variants
enum AuiTimelineVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Timeline sizes
enum AuiTimelineSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Timeline types
enum AuiTimelineType {
  vertical,
  horizontal,
  alternating,
  centered,
}

/// Timeline states
enum AuiTimelineState {
  enabled,
  disabled,
  loading,
  error,
}

/// Timeline item types
enum AuiTimelineItemType {
  start,
  middle,
  end,
  single,
}

/// Timeline item configuration
class AuiTimelineItem {
  const AuiTimelineItem({
    required this.content,
    this.title,
    this.subtitle,
    this.icon,
    this.image,
    this.color,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.margin,
    this.semanticLabel,
    this.tooltip,
    this.timestamp,
    this.duration,
    this.status,
    this.type = AuiTimelineItemType.middle,
    this.key,
  });

  final Widget content;
  final Widget? title;
  final Widget? subtitle;
  final Widget? icon;
  final ImageProvider? image;
  final Color? color;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? semanticLabel;
  final String? tooltip;
  final DateTime? timestamp;
  final Duration? duration;
  final String? status;
  final AuiTimelineItemType type;
  final Key? key;
}

/// A comprehensive timeline component
class AuiTimeline extends StatefulWidget {
  const AuiTimeline({
    super.key,
    required this.children,
    this.variant = AuiTimelineVariant.outlined,
    this.size = AuiTimelineSize.md,
    this.type = AuiTimelineType.vertical,
    this.state = AuiTimelineState.enabled,
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
    this.lineColor,
    this.lineThickness = 2.0,
    this.lineStyle = AuiTimelineLineStyle.solid,
    this.lineDashPattern,
    this.lineGradient,
    this.showConnectors = true,
    this.showTimestamps = true,
    this.showDurations = false,
    this.showStatus = false,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.staggerAnimation = false,
    this.staggerDelay = const Duration(milliseconds: 100),
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
    this.onItemTap,
    this.onItemDoubleTap,
    this.onItemLongPress,
    this.constraints,
    this.gradient,
    this.border,
    this.shape,
  });

  final List<AuiTimelineItem> children;
  final AuiTimelineVariant variant;
  final AuiTimelineSize size;
  final AuiTimelineType type;
  final AuiTimelineState state;
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
  final Color? lineColor;
  final double lineThickness;
  final AuiTimelineLineStyle lineStyle;
  final List<double>? lineDashPattern;
  final Gradient? lineGradient;
  final bool showConnectors;
  final bool showTimestamps;
  final bool showDurations;
  final bool showStatus;
  final bool animate;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool staggerAnimation;
  final Duration staggerDelay;
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
  final ValueChanged<int>? onItemTap;
  final ValueChanged<int>? onItemDoubleTap;
  final ValueChanged<int>? onItemLongPress;
  final BoxConstraints? constraints;
  final Gradient? gradient;
  final Border? border;
  final ShapeBorder? shape;

  @override
  State<AuiTimeline> createState() => _AuiTimelineState();
}

class _AuiTimelineState extends State<AuiTimeline> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _initializeAnimations();
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
        duration: widget.animationDuration,
        vsync: this,
      ),
    );
    
    _animations = _animationControllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: widget.animationCurve,
      );
    }).toList();
    
    if (widget.animate) {
      _startAnimations();
    }
  }

  void _startAnimations() {
    for (int i = 0; i < _animationControllers.length; i++) {
      if (widget.staggerAnimation) {
        Future.delayed(widget.staggerDelay * i, () {
          if (mounted) {
            _animationControllers[i].forward();
          }
        });
      } else {
        _animationControllers[i].forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get timeline colors
    final timelineBackgroundColor = _getTimelineBackgroundColor(colors);
    final timelineForegroundColor = _getTimelineForegroundColor(colors);
    final timelineBorderColor = _getTimelineBorderColor(colors);
    
    // Get timeline elevation
    final timelineElevation = _getTimelineElevation(elevation);
    
    // Get timeline border radius
    final timelineBorderRadius = _getTimelineBorderRadius(spacing);
    
    // Get timeline padding
    final timelinePadding = _getTimelinePadding(spacing);
    
    // Build timeline
    final timeline = _buildTimeline(colors, spacing, timelineBackgroundColor ?? colors.surface, timelineForegroundColor, timelineBorderColor, timelineElevation, timelineBorderRadius, timelinePadding);
    
    Widget timelineWidget = Container(
      constraints: widget.constraints,
      padding: timelinePadding,
      decoration: BoxDecoration(
        color: timelineBackgroundColor,
        borderRadius: timelineBorderRadius,
        border: timelineBorderColor != null 
            ? Border.all(color: timelineBorderColor, width: 1.0)
            : null,
        gradient: widget.gradient,
        boxShadow: _getTimelineShadows(colors, timelineElevation),
      ),
      clipBehavior: widget.clipBehavior,
      child: timeline,
    );
    
    // Add margin
    if (widget.margin != null) {
      timelineWidget = Padding(
        padding: widget.margin!,
        child: timelineWidget,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      timelineWidget = Semantics(
        label: widget.semanticLabel,
        child: timelineWidget,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      timelineWidget = Tooltip(
        message: widget.tooltip!,
        child: timelineWidget,
      );
    }
    
    return timelineWidget;
  }
  
  /// Build timeline
  Widget _buildTimeline(
    AuiColorScheme colors,
    AuiSpacingScheme spacing,
    Color backgroundColor,
    Color foregroundColor,
    Color? borderColor,
    double elevation,
    BorderRadius? borderRadius,
    EdgeInsets padding,
  ) {
    if (widget.type == AuiTimelineType.horizontal) {
      return _buildHorizontalTimeline(colors, spacing);
    } else {
      return _buildVerticalTimeline(colors, spacing);
    }
  }
  
  /// Build vertical timeline
  Widget _buildVerticalTimeline(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return ListView.builder(
      controller: _scrollController,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
      primary: widget.primary,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        return _buildVerticalTimelineItem(index, colors, spacing);
      },
    );
  }
  
  /// Build horizontal timeline
  Widget _buildHorizontalTimeline(AuiColorScheme colors, AuiSpacingScheme spacing) {
    return ListView.builder(
      controller: _scrollController,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      reverse: widget.reverse,
      scrollDirection: Axis.horizontal,
      primary: widget.primary,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        return _buildHorizontalTimelineItem(index, colors, spacing);
      },
    );
  }
  
  /// Build vertical timeline item
  Widget _buildVerticalTimelineItem(int index, AuiColorScheme colors, AuiSpacingScheme spacing) {
    final item = widget.children[index];
    final isLast = index == widget.children.length - 1;
    
    return AnimatedBuilder(
      animation: _animations[index],
      builder: (context, child) {
        return Opacity(
          opacity: _animations[index].value,
          child: Transform.translate(
            offset: Offset(0, (1 - _animations[index].value) * 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimelineConnector(index, colors, spacing, isLast),
                SizedBox(width: spacing.md),
                Expanded(
                  child: _buildTimelineContent(item, index, colors, spacing),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  /// Build horizontal timeline item
  Widget _buildHorizontalTimelineItem(int index, AuiColorScheme colors, AuiSpacingScheme spacing) {
    final item = widget.children[index];
    final isLast = index == widget.children.length - 1;
    
    return AnimatedBuilder(
      animation: _animations[index],
      builder: (context, child) {
        return Opacity(
          opacity: _animations[index].value,
          child: Transform.translate(
            offset: Offset((1 - _animations[index].value) * 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimelineContent(item, index, colors, spacing),
                SizedBox(height: spacing.md),
                _buildTimelineConnector(index, colors, spacing, isLast),
              ],
            ),
          ),
        );
      },
    );
  }
  
  /// Build timeline connector
  Widget _buildTimelineConnector(int index, AuiColorScheme colors, AuiSpacingScheme spacing, bool isLast) {
    if (!widget.showConnectors) return const SizedBox.shrink();
    
    final item = widget.children[index];
    final connectorColor = item.color ?? widget.lineColor ?? colors.primary;
    
    Widget connector = Container(
      width: widget.type == AuiTimelineType.horizontal ? 100.0 : widget.lineThickness,
      height: widget.type == AuiTimelineType.horizontal ? widget.lineThickness : 100.0,
      decoration: BoxDecoration(
        color: connectorColor,
        borderRadius: BorderRadius.circular(widget.lineThickness / 2),
      ),
    );
    
    // Add gradient if specified
    if (widget.lineGradient != null) {
      connector = Container(
        width: widget.type == AuiTimelineType.horizontal ? 100.0 : widget.lineThickness,
        height: widget.type == AuiTimelineType.horizontal ? widget.lineThickness : 100.0,
        decoration: BoxDecoration(
          gradient: widget.lineGradient,
          borderRadius: BorderRadius.circular(widget.lineThickness / 2),
        ),
      );
    }
    
    // Add dash pattern if specified
    if (widget.lineStyle == AuiTimelineLineStyle.dashed && widget.lineDashPattern != null) {
      connector = CustomPaint(
        painter: _DashedLinePainter(
          color: connectorColor,
          thickness: widget.lineThickness,
          dashPattern: widget.lineDashPattern!,
        ),
        child: connector,
      );
    }
    
    return connector;
  }
  
  /// Build timeline content
  Widget _buildTimelineContent(AuiTimelineItem item, int index, AuiColorScheme colors, AuiSpacingScheme spacing) {
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
    
    Widget content = Container(
      key: item.key,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.title != null) ...[
            item.title!,
            SizedBox(height: spacing.sm),
          ],
          if (item.subtitle != null) ...[
            item.subtitle!,
            SizedBox(height: spacing.sm),
          ],
          item.content,
          if (widget.showTimestamps && item.timestamp != null) ...[
            SizedBox(height: spacing.sm),
            _buildTimestamp(item.timestamp!, colors, spacing),
          ],
          if (widget.showDurations && item.duration != null) ...[
            SizedBox(height: spacing.sm),
            _buildDuration(item.duration!, colors, spacing),
          ],
          if (widget.showStatus && item.status != null) ...[
            SizedBox(height: spacing.sm),
            _buildStatus(item.status!, colors, spacing),
          ],
        ],
      ),
    );
    
    // Add margin
    if (item.margin != null) {
      content = Padding(
        padding: item.margin!,
        child: content,
      );
    }
    
    // Add semantics
    if (item.semanticLabel != null) {
      content = Semantics(
        label: item.semanticLabel,
        child: content,
      );
    }
    
    // Add tooltip
    if (item.tooltip != null) {
      content = Tooltip(
        message: item.tooltip!,
        child: content,
      );
    }
    
    // Add tap functionality
    if (widget.onItemTap != null || widget.onItemDoubleTap != null || widget.onItemLongPress != null) {
      content = GestureDetector(
        onTap: () => widget.onItemTap?.call(index),
        onDoubleTap: () => widget.onItemDoubleTap?.call(index),
        onLongPress: () => widget.onItemLongPress?.call(index),
        child: content,
      );
    }
    
    return content;
  }
  
  /// Build timestamp
  Widget _buildTimestamp(DateTime timestamp, AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Text(
      _formatTimestamp(timestamp),
      style: TextStyle(
        color: colors.onSurfaceVariant,
        fontSize: _getTimestampFontSize(),
      ),
    );
  }
  
  /// Build duration
  Widget _buildDuration(Duration duration, AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Text(
      _formatDuration(duration),
      style: TextStyle(
        color: colors.onSurfaceVariant,
        fontSize: _getDurationFontSize(),
      ),
    );
  }
  
  /// Build status
  Widget _buildStatus(String status, AuiColorScheme colors, AuiSpacingScheme spacing) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(spacing.xs),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: colors.onPrimaryContainer,
          fontSize: _getStatusFontSize(),
        ),
      ),
    );
  }
  
  /// Format timestamp
  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
  
  /// Format duration
  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }
  
  /// Get item background color
  Color? _getItemBackgroundColor(AuiTimelineItem item, AuiColorScheme colors) {
    if (item.backgroundColor != null) return item.backgroundColor;
    
    switch (widget.variant) {
      case AuiTimelineVariant.filled:
        return colors.surface;
      case AuiTimelineVariant.outlined:
        return colors.surface;
      case AuiTimelineVariant.elevated:
        return colors.surface;
      case AuiTimelineVariant.tonal:
        return colors.surfaceVariant;
      case AuiTimelineVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get item foreground color
  
  /// Get item border color
  Color? _getItemBorderColor(AuiTimelineItem item, AuiColorScheme colors) {
    if (item.borderColor != null) return item.borderColor;
    
    switch (widget.variant) {
      case AuiTimelineVariant.filled:
        return null;
      case AuiTimelineVariant.outlined:
        return colors.outline;
      case AuiTimelineVariant.elevated:
        return null;
      case AuiTimelineVariant.tonal:
        return null;
      case AuiTimelineVariant.minimal:
        return null;
    }
  }
  
  /// Get item elevation
  double _getItemElevation(AuiTimelineItem item) {
    if (item.elevation != null) return item.elevation!;
    
    switch (widget.variant) {
      case AuiTimelineVariant.filled:
        return 0.0;
      case AuiTimelineVariant.outlined:
        return 0.0;
      case AuiTimelineVariant.elevated:
        return 2.0;
      case AuiTimelineVariant.tonal:
        return 0.0;
      case AuiTimelineVariant.minimal:
        return 0.0;
    }
  }
  
  /// Get item border radius
  BorderRadius? _getItemBorderRadius(AuiTimelineItem item, AuiSpacingScheme spacing) {
    if (item.borderRadius != null) return item.borderRadius;
    
    switch (widget.size) {
      case AuiTimelineSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiTimelineSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiTimelineSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiTimelineSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiTimelineSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get item padding
  EdgeInsets _getItemPadding(AuiTimelineItem item, AuiSpacingScheme spacing) {
    if (item.padding != null) return item.padding!;
    
    switch (widget.size) {
      case AuiTimelineSize.xs:
        return EdgeInsets.all(spacing.xs);
      case AuiTimelineSize.sm:
        return EdgeInsets.all(spacing.sm);
      case AuiTimelineSize.md:
        return EdgeInsets.all(spacing.md);
      case AuiTimelineSize.lg:
        return EdgeInsets.all(spacing.lg);
      case AuiTimelineSize.xl:
        return EdgeInsets.all(spacing.xl);
    }
  }
  
  /// Get item constraints
  BoxConstraints _getItemConstraints(AuiTimelineItem item) {
    return BoxConstraints(
      minWidth: 0.0,
      maxWidth: double.infinity,
      minHeight: 0.0,
      maxHeight: double.infinity,
    );
  }
  
  /// Get item shadows
  List<BoxShadow> _getItemShadows(AuiTimelineItem item, double elevation) {
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
  
  /// Get timeline background color
  Color? _getTimelineBackgroundColor(AuiColorScheme colors) {
    return widget.backgroundColor ?? Colors.transparent;
  }
  
  /// Get timeline foreground color
  Color _getTimelineForegroundColor(AuiColorScheme colors) {
    return widget.foregroundColor ?? colors.onSurface;
  }
  
  /// Get timeline border color
  Color? _getTimelineBorderColor(AuiColorScheme colors) {
    return widget.borderColor;
  }
  
  /// Get timeline elevation
  double _getTimelineElevation(AuiElevationScheme elevation) {
    return widget.elevation ?? elevation.level0;
  }
  
  /// Get timeline border radius
  BorderRadius? _getTimelineBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius;
    return null;
  }
  
  /// Get timeline padding
  EdgeInsets _getTimelinePadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiTimelineSize.xs:
        return EdgeInsets.all(spacing.xs);
      case AuiTimelineSize.sm:
        return EdgeInsets.all(spacing.sm);
      case AuiTimelineSize.md:
        return EdgeInsets.all(spacing.md);
      case AuiTimelineSize.lg:
        return EdgeInsets.all(spacing.lg);
      case AuiTimelineSize.xl:
        return EdgeInsets.all(spacing.xl);
    }
  }
  
  /// Get timestamp font size
  double _getTimestampFontSize() {
    switch (widget.size) {
      case AuiTimelineSize.xs:
        return 10.0;
      case AuiTimelineSize.sm:
        return 12.0;
      case AuiTimelineSize.md:
        return 14.0;
      case AuiTimelineSize.lg:
        return 16.0;
      case AuiTimelineSize.xl:
        return 18.0;
    }
  }
  
  /// Get duration font size
  double _getDurationFontSize() {
    switch (widget.size) {
      case AuiTimelineSize.xs:
        return 10.0;
      case AuiTimelineSize.sm:
        return 12.0;
      case AuiTimelineSize.md:
        return 14.0;
      case AuiTimelineSize.lg:
        return 16.0;
      case AuiTimelineSize.xl:
        return 18.0;
    }
  }
  
  /// Get status font size
  double _getStatusFontSize() {
    switch (widget.size) {
      case AuiTimelineSize.xs:
        return 10.0;
      case AuiTimelineSize.sm:
        return 12.0;
      case AuiTimelineSize.md:
        return 14.0;
      case AuiTimelineSize.lg:
        return 16.0;
      case AuiTimelineSize.xl:
        return 18.0;
    }
  }
  
  /// Get timeline shadows
  List<BoxShadow> _getTimelineShadows(AuiColorScheme colors, double elevation) {
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

/// Timeline line style
enum AuiTimelineLineStyle {
  solid,
  dashed,
  dotted,
}

/// Dashed line painter
class _DashedLinePainter extends CustomPainter {
  const _DashedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashPattern,
  });

  final Color color;
  final double thickness;
  final List<double> dashPattern;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    double start = 0.0;
    while (start < size.width) {
      canvas.drawLine(
        Offset(start, size.height / 2),
        Offset(start + dashPattern[0], size.height / 2),
        paint,
      );
      start += dashPattern[0] + dashPattern[1];
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Timeline utilities
class AuiTimelineUtils {
  const AuiTimelineUtils._();
  
  /// Format timestamp
  static String formatTimestamp(DateTime timestamp) {
    return '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
  
  /// Format duration
  static String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }
  
  /// Calculate item height
  static double calculateItemHeight(AuiTimelineSize size) {
    switch (size) {
      case AuiTimelineSize.xs:
        return 60.0;
      case AuiTimelineSize.sm:
        return 80.0;
      case AuiTimelineSize.md:
        return 100.0;
      case AuiTimelineSize.lg:
        return 120.0;
      case AuiTimelineSize.xl:
        return 140.0;
    }
  }
  
  /// Calculate item width
  static double calculateItemWidth(AuiTimelineSize size) {
    switch (size) {
      case AuiTimelineSize.xs:
        return 200.0;
      case AuiTimelineSize.sm:
        return 250.0;
      case AuiTimelineSize.md:
        return 300.0;
      case AuiTimelineSize.lg:
        return 350.0;
      case AuiTimelineSize.xl:
        return 400.0;
    }
  }
}
