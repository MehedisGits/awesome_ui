import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Bottom sheet variants
enum AuiBottomSheetVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Bottom sheet sizes
enum AuiBottomSheetSize {
  xs,
  sm,
  md,
  lg,
  xl,
  fullscreen,
}

/// Bottom sheet types
enum AuiBottomSheetType {
  persistent,
  modal,
  draggable,
  expandable,
  custom,
}

/// Bottom sheet states
enum AuiBottomSheetState {
  enabled,
  disabled,
  collapsed,
  expanded,
  dragging,
}

/// A comprehensive bottom sheet component
class AuiBottomSheet extends StatefulWidget {
  const AuiBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.actions,
    this.variant = AuiBottomSheetVariant.elevated,
    this.size = AuiBottomSheetSize.md,
    this.type = AuiBottomSheetType.modal,
    this.state = AuiBottomSheetState.enabled,
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
    this.showDragHandle = true,
    this.dragHandleColor,
    this.dragHandleSize,
    this.dragHandleWidth,
    this.dragHandleHeight,
    this.dragHandleBorderRadius,
    this.enableDrag = true,
    this.enableResize = false,
    this.minHeight,
    this.maxHeight,
    this.initialHeight,
    this.constraints,
    this.clipBehavior = Clip.none,
    this.shape,
    this.border,
    this.gradient,
    this.animationDuration,
    this.animationCurve,
    this.onClose,
    this.onDragStart,
    this.onDragUpdate,
    this.onDragEnd,
    this.onResize,
  });

  final Widget child;
  final Widget? title;
  final Widget? subtitle;
  final List<Widget>? actions;
  final AuiBottomSheetVariant variant;
  final AuiBottomSheetSize size;
  final AuiBottomSheetType type;
  final AuiBottomSheetState state;
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
  final bool showDragHandle;
  final Color? dragHandleColor;
  final double? dragHandleSize;
  final double? dragHandleWidth;
  final double? dragHandleHeight;
  final BorderRadius? dragHandleBorderRadius;
  final bool enableDrag;
  final bool enableResize;
  final double? minHeight;
  final double? maxHeight;
  final double? initialHeight;
  final BoxConstraints? constraints;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final Border? border;
  final Gradient? gradient;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final VoidCallback? onClose;
  final VoidCallback? onDragStart;
  final ValueChanged<double>? onDragUpdate;
  final VoidCallback? onDragEnd;
  final ValueChanged<double>? onResize;

  @override
  State<AuiBottomSheet> createState() => _AuiBottomSheetState();

  /// Show bottom sheet
  static dynamic show<T>({
    required BuildContext context,
    required AuiBottomSheet bottomSheet,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isModal = true,
    bool showDragHandle = true,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    if (isModal) {
      return showModalBottomSheet<T>(
        context: context,
        isScrollControlled: isScrollControlled,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: backgroundColor ?? bottomSheet.backgroundColor,
        elevation: elevation ?? bottomSheet.elevation,
        shape: shape ?? bottomSheet.shape,
        clipBehavior: clipBehavior ?? bottomSheet.clipBehavior,
        constraints: constraints ?? bottomSheet.constraints,
        barrierColor: barrierColor,
        builder: (context) => bottomSheet,
      );
    } else {
      return showBottomSheet(
        context: context,
        backgroundColor: backgroundColor ?? bottomSheet.backgroundColor,
        elevation: elevation ?? bottomSheet.elevation,
        shape: shape ?? bottomSheet.shape,
        clipBehavior: clipBehavior ?? bottomSheet.clipBehavior,
        constraints: constraints ?? bottomSheet.constraints,
        enableDrag: enableDrag,
        builder: (context) => bottomSheet,
      );
    }
  }
}

class _AuiBottomSheetState extends State<AuiBottomSheet> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late DraggableScrollableController _draggableController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    _draggableController = DraggableScrollableController();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve ?? Curves.easeInOut,
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _draggableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get bottom sheet colors
    final bottomSheetBackgroundColor = _getBottomSheetBackgroundColor(colors);
    final bottomSheetBorderColor = _getBottomSheetBorderColor(colors);
    
    // Get bottom sheet elevation
    final bottomSheetElevation = _getBottomSheetElevation(elevation);
    
    // Get bottom sheet border radius
    final bottomSheetBorderRadius = _getBottomSheetBorderRadius(spacing);
    
    // Get bottom sheet padding
    final bottomSheetPadding = _getBottomSheetPadding(spacing);
    
    // Get bottom sheet constraints
    final bottomSheetConstraints = _getBottomSheetConstraints();
    
    // Get drag handle widget
    final dragHandleWidget = _getDragHandleWidget(colors);
    
    // Get title widget
    final titleWidget = _getTitleWidget(colors);
    
    // Get subtitle widget
    final subtitleWidget = _getSubtitleWidget(colors);
    
    // Get actions widget
    final actionsWidget = _getActionsWidget(colors, spacing);
    
    Widget bottomSheet = AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - _animation.value) * 100),
          child: Opacity(
            opacity: _animation.value,
            child: Container(
              constraints: bottomSheetConstraints,
              padding: bottomSheetPadding,
              decoration: BoxDecoration(
                color: bottomSheetBackgroundColor,
                borderRadius: bottomSheetBorderRadius,
                border: bottomSheetBorderColor != null 
                    ? Border.all(color: bottomSheetBorderColor, width: 1.0)
                    : null,
                gradient: widget.gradient,
                boxShadow: _getBottomSheetShadows(colors, bottomSheetElevation),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (dragHandleWidget != null) ...[
                    dragHandleWidget,
                    SizedBox(height: spacing.md),
                  ],
                  if (titleWidget != null) ...[
                    titleWidget,
                    if (subtitleWidget != null || actionsWidget != null)
                      SizedBox(height: spacing.sm),
                  ],
                  if (subtitleWidget != null) ...[
                    subtitleWidget,
                    if (actionsWidget != null)
                      SizedBox(height: spacing.sm),
                  ],
                  if (actionsWidget != null) ...[
                    actionsWidget,
                    SizedBox(height: spacing.md),
                  ],
                  Flexible(
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    
    // Add shape if needed
    if (widget.shape != null) {
      bottomSheet = ClipPath(
        clipper: _ShapeClipper(widget.shape!),
        child: bottomSheet,
      );
    }
    
    // Add border if needed
    if (widget.border != null) {
      bottomSheet = Container(
        decoration: BoxDecoration(
          border: widget.border,
        ),
        child: bottomSheet,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      bottomSheet = Padding(
        padding: widget.margin!,
        child: bottomSheet,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      bottomSheet = Semantics(
        label: widget.semanticLabel,
        child: bottomSheet,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      bottomSheet = Tooltip(
        message: widget.tooltip!,
        child: bottomSheet,
      );
    }
    
    // Wrap with draggable if enabled
    if (widget.enableDrag && widget.type == AuiBottomSheetType.draggable) {
      bottomSheet = DraggableScrollableSheet(
        controller: _draggableController,
        initialChildSize: _getInitialChildSize(),
        minChildSize: _getMinChildSize(),
        maxChildSize: _getMaxChildSize(),
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: bottomSheet,
          );
        },
      );
    }
    
    return bottomSheet;
  }
  
  /// Get bottom sheet background color
  Color _getBottomSheetBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiBottomSheetState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiBottomSheetVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiBottomSheetVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiBottomSheetVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiBottomSheetVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
      case AuiBottomSheetVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get bottom sheet foreground color
  Color _getBottomSheetForegroundColor(AuiColorScheme colors) {
    if (widget.state == AuiBottomSheetState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.foregroundColor ?? colors.onSurface;
  }
  
  /// Get bottom sheet border color
  Color? _getBottomSheetBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiBottomSheetState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiBottomSheetVariant.filled:
        return null;
      case AuiBottomSheetVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiBottomSheetVariant.elevated:
        return null;
      case AuiBottomSheetVariant.tonal:
        return null;
      case AuiBottomSheetVariant.minimal:
        return null;
    }
  }
  
  /// Get bottom sheet elevation
  double _getBottomSheetElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiBottomSheetVariant.filled:
        return elevation.level0;
      case AuiBottomSheetVariant.outlined:
        return elevation.level0;
      case AuiBottomSheetVariant.elevated:
        return elevation.level2;
      case AuiBottomSheetVariant.tonal:
        return elevation.level0;
      case AuiBottomSheetVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get bottom sheet border radius
  BorderRadius _getBottomSheetBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return BorderRadius.vertical(top: Radius.circular(spacing.sm));
      case AuiBottomSheetSize.sm:
        return BorderRadius.vertical(top: Radius.circular(spacing.md));
      case AuiBottomSheetSize.md:
        return BorderRadius.vertical(top: Radius.circular(spacing.lg));
      case AuiBottomSheetSize.lg:
        return BorderRadius.vertical(top: Radius.circular(spacing.xl));
      case AuiBottomSheetSize.xl:
        return BorderRadius.vertical(top: Radius.circular(spacing.xxl));
      case AuiBottomSheetSize.fullscreen:
        return BorderRadius.zero;
    }
  }
  
  /// Get bottom sheet padding
  EdgeInsets _getBottomSheetPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return EdgeInsets.all(spacing.md);
      case AuiBottomSheetSize.sm:
        return EdgeInsets.all(spacing.lg);
      case AuiBottomSheetSize.md:
        return EdgeInsets.all(spacing.xl);
      case AuiBottomSheetSize.lg:
        return EdgeInsets.all(spacing.xxl);
      case AuiBottomSheetSize.xl:
        return EdgeInsets.all(spacing.xxxl);
      case AuiBottomSheetSize.fullscreen:
        return EdgeInsets.zero;
    }
  }
  
  /// Get bottom sheet constraints
  BoxConstraints _getBottomSheetConstraints() {
    if (widget.constraints != null) return widget.constraints!;
    
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return BoxConstraints(
          minHeight: widget.minHeight ?? 200.0,
          maxHeight: widget.maxHeight ?? 300.0,
        );
      case AuiBottomSheetSize.sm:
        return BoxConstraints(
          minHeight: widget.minHeight ?? 300.0,
          maxHeight: widget.maxHeight ?? 400.0,
        );
      case AuiBottomSheetSize.md:
        return BoxConstraints(
          minHeight: widget.minHeight ?? 400.0,
          maxHeight: widget.maxHeight ?? 500.0,
        );
      case AuiBottomSheetSize.lg:
        return BoxConstraints(
          minHeight: widget.minHeight ?? 500.0,
          maxHeight: widget.maxHeight ?? 600.0,
        );
      case AuiBottomSheetSize.xl:
        return BoxConstraints(
          minHeight: widget.minHeight ?? 600.0,
          maxHeight: widget.maxHeight ?? 700.0,
        );
      case AuiBottomSheetSize.fullscreen:
        return BoxConstraints(
          minHeight: double.infinity,
          maxHeight: double.infinity,
        );
    }
  }
  
  /// Get drag handle widget
  Widget? _getDragHandleWidget(AuiColorScheme colors) {
    if (!widget.showDragHandle) return null;
    
    return Container(
      width: widget.dragHandleWidth ?? _getDragHandleWidth(),
      height: widget.dragHandleHeight ?? _getDragHandleHeight(),
      decoration: BoxDecoration(
        color: widget.dragHandleColor ?? colors.onSurfaceVariant.withValues(alpha:0.4),
        borderRadius: widget.dragHandleBorderRadius ?? BorderRadius.circular(2.0),
      ),
    );
  }
  
  /// Get title widget
  Widget? _getTitleWidget(AuiColorScheme colors) {
    if (widget.title == null) return null;
    
    return DefaultTextStyle(
      style: _getTitleTextStyle(colors),
      child: widget.title!,
    );
  }
  
  /// Get subtitle widget
  Widget? _getSubtitleWidget(AuiColorScheme colors) {
    if (widget.subtitle == null) return null;
    
    return DefaultTextStyle(
      style: _getSubtitleTextStyle(colors),
      child: widget.subtitle!,
    );
  }
  
  /// Get actions widget
  Widget? _getActionsWidget(AuiColorScheme colors, AuiSpacingScheme spacing) {
    if (widget.actions == null || widget.actions!.isEmpty) return null;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: widget.actions!.map((action) {
        return Padding(
          padding: EdgeInsets.only(
            left: action == widget.actions!.first ? 0 : spacing.sm,
          ),
          child: action,
        );
      }).toList(),
    );
  }
  
  /// Get title text style
  TextStyle _getTitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getBottomSheetForegroundColor(colors),
      fontSize: _getTitleFontSize(),
      fontWeight: FontWeight.w600,
    );
  }
  
  /// Get subtitle text style
  TextStyle _getSubtitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getBottomSheetForegroundColor(colors).withValues(alpha:0.8),
      fontSize: _getSubtitleFontSize(),
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get title font size
  double _getTitleFontSize() {
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return 16.0;
      case AuiBottomSheetSize.sm:
        return 18.0;
      case AuiBottomSheetSize.md:
        return 20.0;
      case AuiBottomSheetSize.lg:
        return 22.0;
      case AuiBottomSheetSize.xl:
        return 24.0;
      case AuiBottomSheetSize.fullscreen:
        return 28.0;
    }
  }
  
  /// Get subtitle font size
  double _getSubtitleFontSize() {
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return 12.0;
      case AuiBottomSheetSize.sm:
        return 14.0;
      case AuiBottomSheetSize.md:
        return 16.0;
      case AuiBottomSheetSize.lg:
        return 18.0;
      case AuiBottomSheetSize.xl:
        return 20.0;
      case AuiBottomSheetSize.fullscreen:
        return 22.0;
    }
  }
  
  /// Get drag handle width
  double _getDragHandleWidth() {
    return widget.dragHandleSize ?? 40.0;
  }
  
  /// Get drag handle height
  double _getDragHandleHeight() {
    return widget.dragHandleSize ?? 4.0;
  }
  
  /// Get initial child size
  double _getInitialChildSize() {
    if (widget.initialHeight != null) return widget.initialHeight!;
    
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return 0.3;
      case AuiBottomSheetSize.sm:
        return 0.4;
      case AuiBottomSheetSize.md:
        return 0.5;
      case AuiBottomSheetSize.lg:
        return 0.6;
      case AuiBottomSheetSize.xl:
        return 0.7;
      case AuiBottomSheetSize.fullscreen:
        return 1.0;
    }
  }
  
  /// Get min child size
  double _getMinChildSize() {
    if (widget.minHeight != null) return widget.minHeight! / MediaQuery.of(context).size.height;
    
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return 0.2;
      case AuiBottomSheetSize.sm:
        return 0.3;
      case AuiBottomSheetSize.md:
        return 0.4;
      case AuiBottomSheetSize.lg:
        return 0.5;
      case AuiBottomSheetSize.xl:
        return 0.6;
      case AuiBottomSheetSize.fullscreen:
        return 1.0;
    }
  }
  
  /// Get max child size
  double _getMaxChildSize() {
    if (widget.maxHeight != null) return widget.maxHeight! / MediaQuery.of(context).size.height;
    
    switch (widget.size) {
      case AuiBottomSheetSize.xs:
        return 0.5;
      case AuiBottomSheetSize.sm:
        return 0.6;
      case AuiBottomSheetSize.md:
        return 0.7;
      case AuiBottomSheetSize.lg:
        return 0.8;
      case AuiBottomSheetSize.xl:
        return 0.9;
      case AuiBottomSheetSize.fullscreen:
        return 1.0;
    }
  }
  
  /// Get bottom sheet shadows
  List<BoxShadow> _getBottomSheetShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.2),
        offset: Offset(0, -elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, -elevation * 0.25),
        blurRadius: elevation,
        spreadRadius: 0,
      ),
    ];
  }
}

/// Shape clipper for custom bottom sheet shapes
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

/// Bottom sheet utilities
class AuiBottomSheetUtils {
  const AuiBottomSheetUtils._();
  
  /// Get bottom sheet constraints for size
  static BoxConstraints getBottomSheetConstraints(AuiBottomSheetSize size, {double? minHeight, double? maxHeight}) {
    switch (size) {
      case AuiBottomSheetSize.xs:
        return BoxConstraints(
          minHeight: minHeight ?? 200.0,
          maxHeight: maxHeight ?? 300.0,
        );
      case AuiBottomSheetSize.sm:
        return BoxConstraints(
          minHeight: minHeight ?? 300.0,
          maxHeight: maxHeight ?? 400.0,
        );
      case AuiBottomSheetSize.md:
        return BoxConstraints(
          minHeight: minHeight ?? 400.0,
          maxHeight: maxHeight ?? 500.0,
        );
      case AuiBottomSheetSize.lg:
        return BoxConstraints(
          minHeight: minHeight ?? 500.0,
          maxHeight: maxHeight ?? 600.0,
        );
      case AuiBottomSheetSize.xl:
        return BoxConstraints(
          minHeight: minHeight ?? 600.0,
          maxHeight: maxHeight ?? 700.0,
        );
      case AuiBottomSheetSize.fullscreen:
        return BoxConstraints(
          minHeight: double.infinity,
          maxHeight: double.infinity,
        );
    }
  }
  
  /// Get title font size for size
  static double getTitleFontSize(AuiBottomSheetSize size) {
    switch (size) {
      case AuiBottomSheetSize.xs:
        return 16.0;
      case AuiBottomSheetSize.sm:
        return 18.0;
      case AuiBottomSheetSize.md:
        return 20.0;
      case AuiBottomSheetSize.lg:
        return 22.0;
      case AuiBottomSheetSize.xl:
        return 24.0;
      case AuiBottomSheetSize.fullscreen:
        return 28.0;
    }
  }
  
  /// Get subtitle font size for size
  static double getSubtitleFontSize(AuiBottomSheetSize size) {
    switch (size) {
      case AuiBottomSheetSize.xs:
        return 12.0;
      case AuiBottomSheetSize.sm:
        return 14.0;
      case AuiBottomSheetSize.md:
        return 16.0;
      case AuiBottomSheetSize.lg:
        return 18.0;
      case AuiBottomSheetSize.xl:
        return 20.0;
      case AuiBottomSheetSize.fullscreen:
        return 22.0;
    }
  }
}
