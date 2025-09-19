import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Snackbar variants
enum AuiSnackbarVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Snackbar sizes
enum AuiSnackbarSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Snackbar types
enum AuiSnackbarType {
  info,
  success,
  warning,
  error,
  custom,
}

/// Snackbar states
enum AuiSnackbarState {
  enabled,
  disabled,
  loading,
  error,
}

/// Snackbar positions
enum AuiSnackbarPosition {
  top,
  bottom,
  center,
}

/// Snackbar behaviors
enum AuiSnackbarBehavior {
  fixed,
  floating,
  floatingActionButton,
}

/// A comprehensive snackbar component
class AuiSnackbar extends StatefulWidget {
  const AuiSnackbar({
    super.key,
    required this.content,
    this.title,
    this.subtitle,
    this.action,
    this.icon,
    this.image,
    this.variant = AuiSnackbarVariant.filled,
    this.size = AuiSnackbarSize.md,
    this.type = AuiSnackbarType.custom,
    this.state = AuiSnackbarState.enabled,
    this.position = AuiSnackbarPosition.bottom,
    this.behavior = AuiSnackbarBehavior.fixed,
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
    this.duration = const Duration(seconds: 4),
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.showProgressIndicator = false,
    this.progressIndicatorColor,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorValue,
    this.progressIndicatorStrokeWidth,
    this.progressIndicatorSize,
    this.clipBehavior = Clip.none,
    this.shape,
    this.border,
    this.gradient,
    this.width,
    this.height,
    this.constraints,
    this.maxWidth,
    this.maxHeight,
    this.spacing,
    this.iconSize,
    this.imageSize,
    this.titleStyle,
    this.subtitleStyle,
    this.contentStyle,
    this.actionStyle,
    this.onAction,
    this.onDismiss,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.dismissDirection = DismissDirection.down,
    this.dismissThreshold = 0.5,
    this.dismissVelocity = 0.0,
    this.dismissAnimationDuration = const Duration(milliseconds: 200),
    this.dismissAnimationCurve = Curves.easeInOut,
    this.enableDismiss = true,
    this.enableSwipeToDismiss = true,
    this.enableTapToDismiss = true,
    this.enableLongPressToDismiss = false,
    this.enableDoubleTapToDismiss = false,
  });

  final Widget content;
  final Widget? title;
  final Widget? subtitle;
  final Widget? action;
  final Widget? icon;
  final ImageProvider? image;
  final AuiSnackbarVariant variant;
  final AuiSnackbarSize size;
  final AuiSnackbarType type;
  final AuiSnackbarState state;
  final AuiSnackbarPosition position;
  final AuiSnackbarBehavior behavior;
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
  final Duration duration;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showProgressIndicator;
  final Color? progressIndicatorColor;
  final Color? progressIndicatorBackgroundColor;
  final double? progressIndicatorValue;
  final double? progressIndicatorStrokeWidth;
  final double? progressIndicatorSize;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final Border? border;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final double? maxWidth;
  final double? maxHeight;
  final double? spacing;
  final double? iconSize;
  final double? imageSize;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? contentStyle;
  final TextStyle? actionStyle;
  final VoidCallback? onAction;
  final VoidCallback? onDismiss;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final DismissDirection dismissDirection;
  final double dismissThreshold;
  final double dismissVelocity;
  final Duration dismissAnimationDuration;
  final Curve dismissAnimationCurve;
  final bool enableDismiss;
  final bool enableSwipeToDismiss;
  final bool enableTapToDismiss;
  final bool enableLongPressToDismiss;
  final bool enableDoubleTapToDismiss;

  @override
  State<AuiSnackbar> createState() => _AuiSnackbarState();

  /// Show snackbar
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context, {
    required AuiSnackbar snackbar,
    SnackBarAction? action,
    Duration? duration,
    bool? showProgressIndicator,
    Color? backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    Animation<double>? animation,
    Clip? clipBehavior,
    DismissDirection? dismissDirection,
    bool? enableDismiss,
    bool? enableSwipeToDismiss,
    bool? enableTapToDismiss,
    bool? enableLongPressToDismiss,
    bool? enableDoubleTapToDismiss,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: snackbar,
        action: action,
        duration: duration ?? snackbar.duration,
        backgroundColor: backgroundColor ?? snackbar.backgroundColor,
        elevation: elevation ?? snackbar.elevation,
        margin: margin ?? snackbar.margin,
        padding: padding ?? snackbar.padding,
        width: width ?? snackbar.width,
        shape: shape ?? snackbar.shape,
        behavior: behavior ?? _getSnackBarBehavior(snackbar.behavior),
        animation: animation,
        clipBehavior: clipBehavior ?? snackbar.clipBehavior,
        dismissDirection: dismissDirection ?? snackbar.dismissDirection,
      ),
    );
  }

  /// Get SnackBarBehavior from AuiSnackbarBehavior
  static SnackBarBehavior _getSnackBarBehavior(AuiSnackbarBehavior behavior) {
    switch (behavior) {
      case AuiSnackbarBehavior.fixed:
        return SnackBarBehavior.fixed;
      case AuiSnackbarBehavior.floating:
        return SnackBarBehavior.floating;
      case AuiSnackbarBehavior.floatingActionButton:
        return SnackBarBehavior.floating;
    }
  }
}

class _AuiSnackbarState extends State<AuiSnackbar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _progressController;
  late Animation<double> _animation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _progressController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );
    _progressAnimation = CurvedAnimation(
      parent: _progressController,
      curve: Curves.linear,
    );
    
    _animationController.forward();
    _progressController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get snackbar colors
    final snackbarBackgroundColor = _getSnackbarBackgroundColor(colors);
    final snackbarBorderColor = _getSnackbarBorderColor(colors);
    
    // Get snackbar elevation
    final snackbarElevation = _getSnackbarElevation(elevation);
    
    // Get snackbar border radius
    final snackbarBorderRadius = _getSnackbarBorderRadius(spacing);
    
    // Get snackbar padding
    final snackbarPadding = _getSnackbarPadding(spacing);
    
    // Get snackbar constraints
    final snackbarConstraints = _getSnackbarConstraints();
    
    // Get snackbar spacing
    final snackbarSpacing = _getSnackbarSpacing(spacing);
    
    // Get icon widget
    final iconWidget = _getIconWidget(colors);
    
    // Get title widget
    final titleWidget = _getTitleWidget(colors);
    
    // Get subtitle widget
    final subtitleWidget = _getSubtitleWidget(colors);
    
    // Get content widget
    final contentWidget = _getContentWidget(colors);
    
    // Get action widget
    final actionWidget = _getActionWidget(colors);
    
    // Get progress indicator widget
    final progressIndicatorWidget = _getProgressIndicatorWidget(colors);
    
    Widget snackbar = AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - _animation.value) * _getSlideOffset()),
          child: Opacity(
            opacity: _animation.value,
            child: Container(
              width: widget.width,
              height: widget.height,
              constraints: snackbarConstraints,
              padding: snackbarPadding,
              decoration: BoxDecoration(
                color: snackbarBackgroundColor,
                borderRadius: snackbarBorderRadius,
                border: snackbarBorderColor != null 
                    ? Border.all(color: snackbarBorderColor, width: 1.0)
                    : null,
                gradient: widget.gradient,
                boxShadow: _getSnackbarShadows(colors, snackbarElevation),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (progressIndicatorWidget != null) ...[
                    progressIndicatorWidget,
                    SizedBox(height: snackbarSpacing),
                  ],
                  Row(
                    children: [
                      if (iconWidget != null) ...[
                        iconWidget,
                        SizedBox(width: snackbarSpacing),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (titleWidget != null) ...[
                              titleWidget,
                              if (subtitleWidget != null)
                                SizedBox(height: snackbarSpacing * 0.5),
                            ],
                            if (subtitleWidget != null) ...[
                              subtitleWidget,
                              SizedBox(height: snackbarSpacing * 0.5),
                            ],
                            ...[
                            contentWidget,
                          ],
                          ],
                        ),
                      ),
                      if (actionWidget != null) ...[
                        SizedBox(width: snackbarSpacing),
                        actionWidget,
                      ],
                    ],
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
      snackbar = ClipPath(
        clipper: _ShapeClipper(widget.shape!),
        child: snackbar,
      );
    }
    
    // Add border if needed
    if (widget.border != null) {
      snackbar = Container(
        decoration: BoxDecoration(
          border: widget.border,
        ),
        child: snackbar,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      snackbar = Padding(
        padding: widget.margin!,
        child: snackbar,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      snackbar = Semantics(
        label: widget.semanticLabel,
        child: snackbar,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      snackbar = Tooltip(
        message: widget.tooltip!,
        child: snackbar,
      );
    }
    
    // Add dismiss functionality
    if (widget.enableDismiss) {
      snackbar = Dismissible(
        key: Key('snackbar_${DateTime.now().millisecondsSinceEpoch}'),
        direction: widget.dismissDirection,
        dismissThresholds: {widget.dismissDirection: widget.dismissThreshold},
        onDismissed: (direction) {
          if (widget.onDismiss != null) {
            widget.onDismiss!();
          }
        },
        child: snackbar,
      );
    }
    
    // Add tap functionality
    if (widget.onTap != null || widget.onLongPress != null || widget.onDoubleTap != null) {
      snackbar = GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onDoubleTap,
        child: snackbar,
      );
    }
    
    return snackbar;
  }
  
  /// Get snackbar background color
  Color _getSnackbarBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiSnackbarState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.type) {
      case AuiSnackbarType.info:
        return widget.backgroundColor ?? colors.infoContainer;
      case AuiSnackbarType.success:
        return widget.backgroundColor ?? colors.successContainer;
      case AuiSnackbarType.warning:
        return widget.backgroundColor ?? colors.warningContainer;
      case AuiSnackbarType.error:
        return widget.backgroundColor ?? colors.errorContainer;
      case AuiSnackbarType.custom:
        switch (widget.variant) {
          case AuiSnackbarVariant.filled:
            return widget.backgroundColor ?? colors.surface;
          case AuiSnackbarVariant.outlined:
            return widget.backgroundColor ?? colors.surface;
          case AuiSnackbarVariant.elevated:
            return widget.backgroundColor ?? colors.surface;
          case AuiSnackbarVariant.tonal:
            return widget.backgroundColor ?? colors.surfaceVariant;
          case AuiSnackbarVariant.minimal:
            return Colors.transparent;
        }
    }
  }
  
  /// Get snackbar foreground color
  Color _getSnackbarForegroundColor(AuiColorScheme colors) {
    if (widget.state == AuiSnackbarState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.type) {
      case AuiSnackbarType.info:
        return widget.foregroundColor ?? colors.onInfoContainer;
      case AuiSnackbarType.success:
        return widget.foregroundColor ?? colors.onSuccessContainer;
      case AuiSnackbarType.warning:
        return widget.foregroundColor ?? colors.onWarningContainer;
      case AuiSnackbarType.error:
        return widget.foregroundColor ?? colors.onErrorContainer;
      case AuiSnackbarType.custom:
        return widget.foregroundColor ?? colors.onSurface;
    }
  }
  
  /// Get snackbar border color
  Color? _getSnackbarBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiSnackbarState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiSnackbarVariant.filled:
        return null;
      case AuiSnackbarVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiSnackbarVariant.elevated:
        return null;
      case AuiSnackbarVariant.tonal:
        return null;
      case AuiSnackbarVariant.minimal:
        return null;
    }
  }
  
  /// Get snackbar elevation
  double _getSnackbarElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiSnackbarVariant.filled:
        return elevation.level0;
      case AuiSnackbarVariant.outlined:
        return elevation.level0;
      case AuiSnackbarVariant.elevated:
        return elevation.level2;
      case AuiSnackbarVariant.tonal:
        return elevation.level0;
      case AuiSnackbarVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get snackbar border radius
  BorderRadius _getSnackbarBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiSnackbarSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiSnackbarSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiSnackbarSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiSnackbarSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get snackbar padding
  EdgeInsets _getSnackbarPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return EdgeInsets.all(spacing.sm);
      case AuiSnackbarSize.sm:
        return EdgeInsets.all(spacing.md);
      case AuiSnackbarSize.md:
        return EdgeInsets.all(spacing.lg);
      case AuiSnackbarSize.lg:
        return EdgeInsets.all(spacing.xl);
      case AuiSnackbarSize.xl:
        return EdgeInsets.all(spacing.xxl);
    }
  }
  
  /// Get snackbar constraints
  BoxConstraints _getSnackbarConstraints() {
    if (widget.constraints != null) return widget.constraints!;
    
    return BoxConstraints(
      maxWidth: widget.maxWidth ?? double.infinity,
      maxHeight: widget.maxHeight ?? double.infinity,
    );
  }
  
  /// Get snackbar spacing
  double _getSnackbarSpacing(AuiSpacingScheme spacing) {
    if (widget.spacing != null) return widget.spacing!;
    
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return spacing.xs;
      case AuiSnackbarSize.sm:
        return spacing.sm;
      case AuiSnackbarSize.md:
        return spacing.md;
      case AuiSnackbarSize.lg:
        return spacing.lg;
      case AuiSnackbarSize.xl:
        return spacing.xl;
    }
  }
  
  /// Get icon widget
  Widget? _getIconWidget(AuiColorScheme colors) {
    if (widget.icon != null) return widget.icon;
    if (widget.image != null) {
      return Image(
        image: widget.image!,
        width: widget.imageSize ?? _getImageSize(),
        height: widget.imageSize ?? _getImageSize(),
      );
    }
    
    // Default icon based on type
    switch (widget.type) {
      case AuiSnackbarType.info:
        return Icon(
          Icons.info_outline,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.info,
        );
      case AuiSnackbarType.success:
        return Icon(
          Icons.check_circle_outline,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.success,
        );
      case AuiSnackbarType.warning:
        return Icon(
          Icons.warning_outlined,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.warning,
        );
      case AuiSnackbarType.error:
        return Icon(
          Icons.error_outline,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.error,
        );
      case AuiSnackbarType.custom:
        return null;
    }
  }
  
  /// Get title widget
  Widget? _getTitleWidget(AuiColorScheme colors) {
    if (widget.title == null) return null;
    
    return DefaultTextStyle(
      style: widget.titleStyle ?? _getTitleTextStyle(colors),
      child: widget.title!,
    );
  }
  
  /// Get subtitle widget
  Widget? _getSubtitleWidget(AuiColorScheme colors) {
    if (widget.subtitle == null) return null;
    
    return DefaultTextStyle(
      style: widget.subtitleStyle ?? _getSubtitleTextStyle(colors),
      child: widget.subtitle!,
    );
  }
  
  /// Get content widget
  Widget _getContentWidget(AuiColorScheme colors) {
    return DefaultTextStyle(
      style: widget.contentStyle ?? _getContentTextStyle(colors),
      child: widget.content,
    );
  }
  
  /// Get action widget
  Widget? _getActionWidget(AuiColorScheme colors) {
    if (widget.action == null) return null;
    
    return DefaultTextStyle(
      style: widget.actionStyle ?? _getActionTextStyle(colors),
      child: GestureDetector(
        onTap: widget.onAction,
        child: widget.action!,
      ),
    );
  }
  
  /// Get progress indicator widget
  Widget? _getProgressIndicatorWidget(AuiColorScheme colors) {
    if (!widget.showProgressIndicator) return null;
    
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: widget.progressIndicatorValue ?? _progressAnimation.value,
          backgroundColor: widget.progressIndicatorBackgroundColor ?? colors.surfaceVariant,
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.progressIndicatorColor ?? colors.primary,
          ),
          minHeight: widget.progressIndicatorStrokeWidth ?? 2.0,
        );
      },
    );
  }
  
  /// Get title text style
  TextStyle _getTitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getSnackbarForegroundColor(colors),
      fontSize: _getTitleFontSize(),
      fontWeight: FontWeight.w600,
    );
  }
  
  /// Get subtitle text style
  TextStyle _getSubtitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getSnackbarForegroundColor(colors).withValues(alpha:0.8),
      fontSize: _getSubtitleFontSize(),
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get content text style
  TextStyle _getContentTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getSnackbarForegroundColor(colors),
      fontSize: _getContentFontSize(),
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get action text style
  TextStyle _getActionTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getSnackbarForegroundColor(colors),
      fontSize: _getActionFontSize(),
      fontWeight: FontWeight.w600,
    );
  }
  
  /// Get title font size
  double _getTitleFontSize() {
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return 12.0;
      case AuiSnackbarSize.sm:
        return 14.0;
      case AuiSnackbarSize.md:
        return 16.0;
      case AuiSnackbarSize.lg:
        return 18.0;
      case AuiSnackbarSize.xl:
        return 20.0;
    }
  }
  
  /// Get subtitle font size
  double _getSubtitleFontSize() {
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return 10.0;
      case AuiSnackbarSize.sm:
        return 12.0;
      case AuiSnackbarSize.md:
        return 14.0;
      case AuiSnackbarSize.lg:
        return 16.0;
      case AuiSnackbarSize.xl:
        return 18.0;
    }
  }
  
  /// Get content font size
  double _getContentFontSize() {
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return 12.0;
      case AuiSnackbarSize.sm:
        return 14.0;
      case AuiSnackbarSize.md:
        return 16.0;
      case AuiSnackbarSize.lg:
        return 18.0;
      case AuiSnackbarSize.xl:
        return 20.0;
    }
  }
  
  /// Get action font size
  double _getActionFontSize() {
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return 12.0;
      case AuiSnackbarSize.sm:
        return 14.0;
      case AuiSnackbarSize.md:
        return 16.0;
      case AuiSnackbarSize.lg:
        return 18.0;
      case AuiSnackbarSize.xl:
        return 20.0;
    }
  }
  
  /// Get icon size
  double _getIconSize() {
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return 16.0;
      case AuiSnackbarSize.sm:
        return 20.0;
      case AuiSnackbarSize.md:
        return 24.0;
      case AuiSnackbarSize.lg:
        return 28.0;
      case AuiSnackbarSize.xl:
        return 32.0;
    }
  }
  
  /// Get image size
  double _getImageSize() {
    switch (widget.size) {
      case AuiSnackbarSize.xs:
        return 24.0;
      case AuiSnackbarSize.sm:
        return 32.0;
      case AuiSnackbarSize.md:
        return 40.0;
      case AuiSnackbarSize.lg:
        return 48.0;
      case AuiSnackbarSize.xl:
        return 56.0;
    }
  }
  
  /// Get slide offset
  double _getSlideOffset() {
    switch (widget.position) {
      case AuiSnackbarPosition.top:
        return -100.0;
      case AuiSnackbarPosition.bottom:
        return 100.0;
      case AuiSnackbarPosition.center:
        return 0.0;
    }
  }
  
  /// Get snackbar shadows
  List<BoxShadow> _getSnackbarShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.2),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}

/// Shape clipper for custom snackbar shapes
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

/// Snackbar utilities
class AuiSnackbarUtils {
  const AuiSnackbarUtils._();
  
  /// Get icon size for size
  static double getIconSize(AuiSnackbarSize size) {
    switch (size) {
      case AuiSnackbarSize.xs:
        return 16.0;
      case AuiSnackbarSize.sm:
        return 20.0;
      case AuiSnackbarSize.md:
        return 24.0;
      case AuiSnackbarSize.lg:
        return 28.0;
      case AuiSnackbarSize.xl:
        return 32.0;
    }
  }
  
  /// Get content font size for size
  static double getContentFontSize(AuiSnackbarSize size) {
    switch (size) {
      case AuiSnackbarSize.xs:
        return 12.0;
      case AuiSnackbarSize.sm:
        return 14.0;
      case AuiSnackbarSize.md:
        return 16.0;
      case AuiSnackbarSize.lg:
        return 18.0;
      case AuiSnackbarSize.xl:
        return 20.0;
    }
  }
  
  /// Get spacing for size
  static double getSpacing(AuiSnackbarSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiSnackbarSize.xs:
        return spacing.xs;
      case AuiSnackbarSize.sm:
        return spacing.sm;
      case AuiSnackbarSize.md:
        return spacing.md;
      case AuiSnackbarSize.lg:
        return spacing.lg;
      case AuiSnackbarSize.xl:
        return spacing.xl;
    }
  }
}
