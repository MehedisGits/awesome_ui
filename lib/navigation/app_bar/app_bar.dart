import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../foundation/theme.dart';

/// App bar variants
enum AuiAppBarVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// App bar sizes
enum AuiAppBarSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// App bar states
enum AuiAppBarState {
  enabled,
  disabled,
  collapsed,
  expanded,
}

/// A comprehensive app bar component
class AuiAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AuiAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.systemOverlayStyle,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.titleSpacing,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.primary = true,
    this.variant = AuiAppBarVariant.elevated,
    this.size = AuiAppBarSize.md,
    this.state = AuiAppBarState.enabled,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.semanticLabel,
    this.tooltip,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.clipBehavior = Clip.none,
    this.shape,
    this.border,
    this.gradient,
    this.badge,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
    this.animation,
    this.animationDuration,
    this.animationCurve,
  });

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final double? titleSpacing;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final bool primary;
  final AuiAppBarVariant variant;
  final AuiAppBarSize size;
  final AuiAppBarState state;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? semanticLabel;
  final String? tooltip;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final Border? border;
  final Gradient? gradient;
  final Widget? badge;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;
  final Animation<double>? animation;
  final Duration? animationDuration;
  final Curve? animationCurve;

  @override
  State<AuiAppBar> createState() => _AuiAppBarState();

  @override
  Size get preferredSize {
    final height = _getAppBarHeight();
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(height + bottomHeight);
  }

  /// Get app bar height
  double _getAppBarHeight() {
    if (toolbarHeight != null) return toolbarHeight!;
    
    switch (size) {
      case AuiAppBarSize.xs:
        return 48.0;
      case AuiAppBarSize.sm:
        return 56.0;
      case AuiAppBarSize.md:
        return 64.0;
      case AuiAppBarSize.lg:
        return 72.0;
      case AuiAppBarSize.xl:
        return 80.0;
    }
  }
}

class _AuiAppBarState extends State<AuiAppBar> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    
    if (widget.animation != null) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get app bar colors
    final appBarBackgroundColor = _getAppBarBackgroundColor(colors);
    final appBarForegroundColor = _getAppBarForegroundColor(colors);
    final appBarBorderColor = _getAppBarBorderColor(colors);
    
    // Get app bar elevation
    final appBarElevation = _getAppBarElevation(elevation);
    
    // Get app bar border radius
    final appBarBorderRadius = _getAppBarBorderRadius(spacing);
    
    
    Widget appBar = AppBar(
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: widget.title,
      actions: widget.actions,
      flexibleSpace: widget.flexibleSpace,
      bottom: widget.bottom,
      elevation: appBarElevation,
      scrolledUnderElevation: widget.scrolledUnderElevation,
      shadowColor: widget.shadowColor ?? colors.shadow,
      surfaceTintColor: widget.surfaceTintColor,
      backgroundColor: appBarBackgroundColor,
      foregroundColor: appBarForegroundColor,
      iconTheme: widget.iconTheme ?? _getIconTheme(colors),
      actionsIconTheme: widget.actionsIconTheme ?? _getActionsIconTheme(colors),
      systemOverlayStyle: widget.systemOverlayStyle,
      toolbarOpacity: widget.toolbarOpacity,
      bottomOpacity: widget.bottomOpacity,
      toolbarHeight: widget.toolbarHeight ?? _getAppBarHeight(),
      leadingWidth: widget.leadingWidth ?? _getLeadingWidth(),
      titleSpacing: widget.titleSpacing ?? _getTitleSpacing(),
      toolbarTextStyle: widget.toolbarTextStyle ?? _getToolbarTextStyle(colors),
      titleTextStyle: widget.titleTextStyle ?? _getTitleTextStyle(colors),
      centerTitle: widget.centerTitle ?? _getCenterTitle(),
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      primary: widget.primary,
      shape: widget.shape ?? _getAppBarShape(appBarBorderRadius),
    );
    
    // Add border if needed
    if (appBarBorderColor != null) {
      appBar = Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: appBarBorderColor,
              width: 1.0,
            ),
          ),
        ),
        child: appBar,
      );
    }
    
    // Add gradient if needed
    if (widget.gradient != null) {
      appBar = Container(
        decoration: BoxDecoration(
          gradient: widget.gradient,
        ),
        child: appBar,
      );
    }
    
    // Add badge if provided
    if (widget.badge != null) {
      appBar = Stack(
        clipBehavior: Clip.none,
        children: [
          appBar,
          Positioned(
            right: widget.badgeOffset?.dx ?? _getBadgeOffset(),
            top: widget.badgeOffset?.dy ?? _getBadgeOffset(),
            child: widget.badge!,
          ),
        ],
      );
    }
    
    // Add tap functionality
    if (widget.onTap != null || widget.onLongPress != null || widget.onDoubleTap != null) {
      appBar = GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onDoubleTap,
        child: appBar,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      appBar = Padding(
        padding: widget.margin!,
        child: appBar,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      appBar = Semantics(
        label: widget.semanticLabel,
        child: appBar,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      appBar = Tooltip(
        message: widget.tooltip!,
        child: appBar,
      );
    }
    
    return appBar;
  }
  
  /// Get app bar background color
  Color _getAppBarBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiAppBarState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiAppBarVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiAppBarVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiAppBarVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiAppBarVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
      case AuiAppBarVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get app bar foreground color
  Color _getAppBarForegroundColor(AuiColorScheme colors) {
    if (widget.state == AuiAppBarState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.foregroundColor ?? colors.onSurface;
  }
  
  /// Get app bar border color
  Color? _getAppBarBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiAppBarState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiAppBarVariant.filled:
        return null;
      case AuiAppBarVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiAppBarVariant.elevated:
        return null;
      case AuiAppBarVariant.tonal:
        return null;
      case AuiAppBarVariant.minimal:
        return null;
    }
  }
  
  /// Get app bar elevation
  double _getAppBarElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiAppBarVariant.filled:
        return elevation.level0;
      case AuiAppBarVariant.outlined:
        return elevation.level0;
      case AuiAppBarVariant.elevated:
        return elevation.level2;
      case AuiAppBarVariant.tonal:
        return elevation.level0;
      case AuiAppBarVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get app bar border radius
  BorderRadius _getAppBarBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiAppBarSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiAppBarSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiAppBarSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiAppBarSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get app bar padding
  
  /// Get app bar height
  double _getAppBarHeight() {
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return 48.0;
      case AuiAppBarSize.sm:
        return 56.0;
      case AuiAppBarSize.md:
        return 64.0;
      case AuiAppBarSize.lg:
        return 72.0;
      case AuiAppBarSize.xl:
        return 80.0;
    }
  }
  
  /// Get leading width
  double _getLeadingWidth() {
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return 40.0;
      case AuiAppBarSize.sm:
        return 48.0;
      case AuiAppBarSize.md:
        return 56.0;
      case AuiAppBarSize.lg:
        return 64.0;
      case AuiAppBarSize.xl:
        return 72.0;
    }
  }
  
  /// Get title spacing
  double _getTitleSpacing() {
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return 8.0;
      case AuiAppBarSize.sm:
        return 12.0;
      case AuiAppBarSize.md:
        return 16.0;
      case AuiAppBarSize.lg:
        return 20.0;
      case AuiAppBarSize.xl:
        return 24.0;
    }
  }
  
  /// Get center title
  bool _getCenterTitle() {
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return false;
      case AuiAppBarSize.sm:
        return false;
      case AuiAppBarSize.md:
        return true;
      case AuiAppBarSize.lg:
        return true;
      case AuiAppBarSize.xl:
        return true;
    }
  }
  
  /// Get icon theme
  IconThemeData _getIconTheme(AuiColorScheme colors) {
    return IconThemeData(
      color: _getAppBarForegroundColor(colors),
      size: _getIconSize(),
    );
  }
  
  /// Get actions icon theme
  IconThemeData _getActionsIconTheme(AuiColorScheme colors) {
    return IconThemeData(
      color: _getAppBarForegroundColor(colors),
      size: _getIconSize(),
    );
  }
  
  /// Get toolbar text style
  TextStyle _getToolbarTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getAppBarForegroundColor(colors),
      fontSize: _getFontSize(),
    );
  }
  
  /// Get title text style
  TextStyle _getTitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getAppBarForegroundColor(colors),
      fontSize: _getFontSize(),
      fontWeight: FontWeight.w600,
    );
  }
  
  /// Get icon size
  double _getIconSize() {
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return 20.0;
      case AuiAppBarSize.sm:
        return 24.0;
      case AuiAppBarSize.md:
        return 24.0;
      case AuiAppBarSize.lg:
        return 28.0;
      case AuiAppBarSize.xl:
        return 32.0;
    }
  }
  
  /// Get font size
  double _getFontSize() {
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return 16.0;
      case AuiAppBarSize.sm:
        return 18.0;
      case AuiAppBarSize.md:
        return 20.0;
      case AuiAppBarSize.lg:
        return 22.0;
      case AuiAppBarSize.xl:
        return 24.0;
    }
  }
  
  /// Get app bar shape
  ShapeBorder _getAppBarShape(BorderRadius borderRadius) {
    return RoundedRectangleBorder(
      borderRadius: borderRadius,
    );
  }
  
  /// Get badge offset
  double _getBadgeOffset() {
    switch (widget.size) {
      case AuiAppBarSize.xs:
        return -4.0;
      case AuiAppBarSize.sm:
        return -6.0;
      case AuiAppBarSize.md:
        return -8.0;
      case AuiAppBarSize.lg:
        return -10.0;
      case AuiAppBarSize.xl:
        return -12.0;
    }
  }
}

/// App bar utilities
class AuiAppBarUtils {
  const AuiAppBarUtils._();
  
  /// Get app bar height for size
  static double getAppBarHeight(AuiAppBarSize size) {
    switch (size) {
      case AuiAppBarSize.xs:
        return 48.0;
      case AuiAppBarSize.sm:
        return 56.0;
      case AuiAppBarSize.md:
        return 64.0;
      case AuiAppBarSize.lg:
        return 72.0;
      case AuiAppBarSize.xl:
        return 80.0;
    }
  }
  
  /// Get icon size for size
  static double getIconSize(AuiAppBarSize size) {
    switch (size) {
      case AuiAppBarSize.xs:
        return 20.0;
      case AuiAppBarSize.sm:
        return 24.0;
      case AuiAppBarSize.md:
        return 24.0;
      case AuiAppBarSize.lg:
        return 28.0;
      case AuiAppBarSize.xl:
        return 32.0;
    }
  }
  
  /// Get font size for size
  static double getFontSize(AuiAppBarSize size) {
    switch (size) {
      case AuiAppBarSize.xs:
        return 16.0;
      case AuiAppBarSize.sm:
        return 18.0;
      case AuiAppBarSize.md:
        return 20.0;
      case AuiAppBarSize.lg:
        return 22.0;
      case AuiAppBarSize.xl:
        return 24.0;
    }
  }
}
