import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Safe area scaffold variants
enum AuiSafeAreaScaffoldVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Safe area scaffold types
enum AuiSafeAreaScaffoldType {
  standard,
  fullscreen,
  immersive,
  adaptive,
}

/// Safe area scaffold states
enum AuiSafeAreaScaffoldState {
  enabled,
  disabled,
  loading,
  error,
}

/// A comprehensive safe area scaffold component
class AuiSafeAreaScaffold extends StatelessWidget {
  const AuiSafeAreaScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
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
    this.variant = AuiSafeAreaScaffoldVariant.filled,
    this.type = AuiSafeAreaScaffoldType.standard,
    this.state = AuiSafeAreaScaffoldState.enabled,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.clipBehavior = Clip.none,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
    this.constraints,
    this.gradient,
    this.border,
    this.shape,
    this.animationDuration,
    this.animationCurve,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final Widget? endDrawer;
  final ValueChanged<bool>? onDrawerChanged;
  final ValueChanged<bool>? onEndDrawerChanged;
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
  final AuiSafeAreaScaffoldVariant variant;
  final AuiSafeAreaScaffoldType type;
  final AuiSafeAreaScaffoldState state;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final Clip clipBehavior;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
  final BoxConstraints? constraints;
  final Gradient? gradient;
  final Border? border;
  final ShapeBorder? shape;
  final Duration? animationDuration;
  final Curve? animationCurve;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get scaffold colors
    final scaffoldBackgroundColor = _getScaffoldBackgroundColor(colors);
    
    // Get scaffold elevation
    
    // Get scaffold border radius
    
    // Get scaffold padding
    
    // Build safe area
    final safeArea = _buildSafeArea();
    
    // Build scaffold body
    
    Widget scaffold = Scaffold(
      appBar: appBar,
      body: safeArea,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      drawer: drawer,
      endDrawer: endDrawer,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      backgroundColor: scaffoldBackgroundColor,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
    );
    
    // Add constraints
    if (constraints != null) {
      scaffold = ConstrainedBox(
        constraints: constraints!,
        child: scaffold,
      );
    }
    
    // Add margin
    if (margin != null) {
      scaffold = Padding(
        padding: margin!,
        child: scaffold,
      );
    }
    
    // Add semantics
    if (semanticLabel != null) {
      scaffold = Semantics(
        label: semanticLabel,
        child: scaffold,
      );
    }
    
    // Add tooltip
    if (tooltip != null) {
      scaffold = Tooltip(
        message: tooltip!,
        child: scaffold,
      );
    }
    
    return scaffold;
  }
  
  /// Build safe area
  Widget _buildSafeArea() {
    return SafeArea(
      top: safeAreaTop,
      bottom: safeAreaBottom,
      left: safeAreaLeft,
      right: safeAreaRight,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: body,
    );
  }
  
  /// Build scaffold body
  
  /// Get scaffold background color
  Color _getScaffoldBackgroundColor(AuiColorScheme colors) {
    if (state == AuiSafeAreaScaffoldState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (variant) {
      case AuiSafeAreaScaffoldVariant.filled:
        return backgroundColor ?? colors.surface;
      case AuiSafeAreaScaffoldVariant.outlined:
        return backgroundColor ?? colors.surface;
      case AuiSafeAreaScaffoldVariant.elevated:
        return backgroundColor ?? colors.surface;
      case AuiSafeAreaScaffoldVariant.tonal:
        return backgroundColor ?? colors.surfaceVariant;
      case AuiSafeAreaScaffoldVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get scaffold foreground color
  Color _getScaffoldForegroundColor(AuiColorScheme colors) {
    if (state == AuiSafeAreaScaffoldState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return foregroundColor ?? colors.onSurface;
  }
  
  /// Get scaffold border color
  Color? _getScaffoldBorderColor(AuiColorScheme colors) {
    if (state == AuiSafeAreaScaffoldState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (variant) {
      case AuiSafeAreaScaffoldVariant.filled:
        return null;
      case AuiSafeAreaScaffoldVariant.outlined:
        return borderColor ?? colors.outline;
      case AuiSafeAreaScaffoldVariant.elevated:
        return null;
      case AuiSafeAreaScaffoldVariant.tonal:
        return null;
      case AuiSafeAreaScaffoldVariant.minimal:
        return null;
    }
  }
  
  /// Get scaffold elevation
  double _getScaffoldElevation(AuiElevationScheme elevation) {
    if (this.elevation != null) return this.elevation!;
    
    switch (variant) {
      case AuiSafeAreaScaffoldVariant.filled:
        return elevation.level0;
      case AuiSafeAreaScaffoldVariant.outlined:
        return elevation.level0;
      case AuiSafeAreaScaffoldVariant.elevated:
        return elevation.level1;
      case AuiSafeAreaScaffoldVariant.tonal:
        return elevation.level0;
      case AuiSafeAreaScaffoldVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get scaffold border radius
  BorderRadius? _getScaffoldBorderRadius(AuiSpacingScheme spacing) {
    if (borderRadius != null) return borderRadius;
    
    switch (type) {
      case AuiSafeAreaScaffoldType.standard:
        return null;
      case AuiSafeAreaScaffoldType.fullscreen:
        return BorderRadius.zero;
      case AuiSafeAreaScaffoldType.immersive:
        return BorderRadius.zero;
      case AuiSafeAreaScaffoldType.adaptive:
        return BorderRadius.circular(spacing.sm);
    }
  }
  
  /// Get scaffold padding
  EdgeInsets _getScaffoldPadding(AuiSpacingScheme spacing) {
    if (padding != null) return padding!;
    
    switch (type) {
      case AuiSafeAreaScaffoldType.standard:
        return EdgeInsets.all(spacing.md);
      case AuiSafeAreaScaffoldType.fullscreen:
        return EdgeInsets.zero;
      case AuiSafeAreaScaffoldType.immersive:
        return EdgeInsets.zero;
      case AuiSafeAreaScaffoldType.adaptive:
        return EdgeInsets.all(spacing.sm);
    }
  }
  
  /// Get scaffold shadows
  List<BoxShadow> _getScaffoldShadows(AuiColorScheme colors, double elevation) {
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

/// Shape clipper for custom scaffold shapes
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

/// Safe area scaffold utilities
class AuiSafeAreaScaffoldUtils {
  const AuiSafeAreaScaffoldUtils._();
  
  /// Get safe area insets
  static EdgeInsets getSafeAreaInsets(BuildContext context) {
    return MediaQuery.of(context).padding;
  }
  
  /// Get safe area insets for specific sides
  static EdgeInsets getSafeAreaInsetsForSides(
    BuildContext context, {
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    final insets = MediaQuery.of(context).padding;
    return EdgeInsets.only(
      top: top ? insets.top : 0.0,
      bottom: bottom ? insets.bottom : 0.0,
      left: left ? insets.left : 0.0,
      right: right ? insets.right : 0.0,
    );
  }
  
  /// Check if device has notches
  static bool hasNotches(BuildContext context) {
    final insets = MediaQuery.of(context).padding;
    return insets.top > 0 || insets.bottom > 0;
  }
  
  /// Get status bar height
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
  
  /// Get bottom bar height
  static double getBottomBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
  
  /// Get navigation bar height
  static double getNavigationBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
  
  /// Calculate safe area padding
  static EdgeInsets calculateSafeAreaPadding(
    BuildContext context, {
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
    EdgeInsets minimum = EdgeInsets.zero,
  }) {
    final insets = MediaQuery.of(context).padding;
    return EdgeInsets.only(
      top: top ? (insets.top > minimum.top ? insets.top : minimum.top) : 0.0,
      bottom: bottom ? (insets.bottom > minimum.bottom ? insets.bottom : minimum.bottom) : 0.0,
      left: left ? (insets.left > minimum.left ? insets.left : minimum.left) : 0.0,
      right: right ? (insets.right > minimum.right ? insets.right : minimum.right) : 0.0,
    );
  }
}
