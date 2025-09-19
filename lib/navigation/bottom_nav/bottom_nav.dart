import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Bottom navigation variants
enum AuiBottomNavVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Bottom navigation sizes
enum AuiBottomNavSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Bottom navigation states
enum AuiBottomNavState {
  enabled,
  disabled,
  hidden,
  visible,
}

/// Bottom navigation item data
class AuiBottomNavItem {
  const AuiBottomNavItem({
    required this.icon,
    required this.label,
    this.activeIcon,
    this.badge,
    this.badgeColor,
    this.badgeTextColor,
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
  });

  final Widget icon;
  final String label;
  final Widget? activeIcon;
  final Widget? badge;
  final Color? badgeColor;
  final Color? badgeTextColor;
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
}

/// A comprehensive bottom navigation component
class AuiBottomNav extends StatefulWidget {
  const AuiBottomNav({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.variant = AuiBottomNavVariant.filled,
    this.size = AuiBottomNavSize.md,
    this.state = AuiBottomNavState.enabled,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.iconSize,
    this.selectedFontSize,
    this.unselectedFontSize,
    this.type = BottomNavigationBarType.fixed,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.semanticLabel,
    this.tooltip,
    this.mouseCursor,
    this.enableFeedback = true,
    this.landscapeLayout = BottomNavigationBarLandscapeLayout.centered,
    this.useLegacyColorScheme = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.showSelectedLabels = true,
    this.showUnselectedLabels = true,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
    this.gradient,
    this.border,
    this.shape,
    this.clipBehavior = Clip.none,
  });

  final List<AuiBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final ValueChanged<int>? onLongPress;
  final ValueChanged<int>? onDoubleTap;
  final AuiBottomNavVariant variant;
  final AuiBottomNavSize size;
  final AuiBottomNavState state;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? iconSize;
  final double? selectedFontSize;
  final double? unselectedFontSize;
  final BottomNavigationBarType type;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? semanticLabel;
  final String? tooltip;
  final MouseCursor? mouseCursor;
  final bool enableFeedback;
  final BottomNavigationBarLandscapeLayout landscapeLayout;
  final bool useLegacyColorScheme;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;
  final Gradient? gradient;
  final Border? border;
  final ShapeBorder? shape;
  final Clip clipBehavior;

  @override
  State<AuiBottomNav> createState() => _AuiBottomNavState();
}

class _AuiBottomNavState extends State<AuiBottomNav> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    
    _animationController.forward();
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
    
    // Get bottom nav colors
    final bottomNavBackgroundColor = _getBottomNavBackgroundColor(colors);
    final bottomNavSelectedColor = _getBottomNavSelectedColor(colors);
    final bottomNavUnselectedColor = _getBottomNavUnselectedColor(colors);
    final bottomNavBorderColor = _getBottomNavBorderColor(colors);
    
    // Get bottom nav elevation
    final bottomNavElevation = _getBottomNavElevation(elevation);
    
    // Get bottom nav border radius
    final bottomNavBorderRadius = _getBottomNavBorderRadius(spacing);
    
    // Get bottom nav padding
    final bottomNavPadding = _getBottomNavPadding(spacing);
    
    // Get bottom nav icon size
    final bottomNavIconSize = _getBottomNavIconSize();
    
    // Get bottom nav font sizes
    final bottomNavSelectedFontSize = _getBottomNavSelectedFontSize();
    final bottomNavUnselectedFontSize = _getBottomNavUnselectedFontSize();
    
    Widget bottomNav = Container(
      padding: bottomNavPadding,
      decoration: BoxDecoration(
        color: bottomNavBackgroundColor,
        borderRadius: bottomNavBorderRadius,
        border: bottomNavBorderColor != null 
            ? Border.all(color: bottomNavBorderColor, width: 1.0)
            : null,
        gradient: widget.gradient,
        boxShadow: _getBottomNavShadows(colors, bottomNavElevation),
      ),
      child: ClipRect(
        child: BottomNavigationBar(
            items: _getBottomNavItems(colors, bottomNavIconSize),
            currentIndex: widget.currentIndex,
            onTap: _getOnTap(),
            type: widget.type,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: bottomNavSelectedColor,
            unselectedItemColor: bottomNavUnselectedColor,
            iconSize: bottomNavIconSize,
            selectedFontSize: bottomNavSelectedFontSize,
            unselectedFontSize: bottomNavUnselectedFontSize,
            showSelectedLabels: widget.showSelectedLabels,
            showUnselectedLabels: widget.showUnselectedLabels,
            selectedLabelStyle: widget.selectedLabelStyle ?? _getSelectedLabelStyle(colors, bottomNavSelectedFontSize),
            unselectedLabelStyle: widget.unselectedLabelStyle ?? _getUnselectedLabelStyle(colors, bottomNavUnselectedFontSize),
            enableFeedback: widget.enableFeedback,
            landscapeLayout: widget.landscapeLayout,
            useLegacyColorScheme: widget.useLegacyColorScheme,
            mouseCursor: widget.mouseCursor,
          ),
        ),
    );
    
    // Add border if needed
    if (widget.border != null) {
      bottomNav = Container(
        decoration: BoxDecoration(
          border: widget.border,
        ),
        child: bottomNav,
      );
    }
    
    // Add shape if needed
    if (widget.shape != null) {
      bottomNav = ClipPath(
        clipper: _ShapeClipper(widget.shape!),
        child: bottomNav,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      bottomNav = Padding(
        padding: widget.margin!,
        child: bottomNav,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      bottomNav = Semantics(
        label: widget.semanticLabel,
        child: bottomNav,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      bottomNav = Tooltip(
        message: widget.tooltip!,
        child: bottomNav,
      );
    }
    
    return bottomNav;
  }
  
  /// Get onTap callback
  ValueChanged<int>? _getOnTap() {
    if (widget.state == AuiBottomNavState.disabled) {
      return null;
    }
    return widget.onTap;
  }
  
  /// Get bottom nav background color
  Color _getBottomNavBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiBottomNavState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiBottomNavVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiBottomNavVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiBottomNavVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiBottomNavVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
      case AuiBottomNavVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get bottom nav selected color
  Color _getBottomNavSelectedColor(AuiColorScheme colors) {
    if (widget.state == AuiBottomNavState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.selectedItemColor ?? colors.primary;
  }
  
  /// Get bottom nav unselected color
  Color _getBottomNavUnselectedColor(AuiColorScheme colors) {
    if (widget.state == AuiBottomNavState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.unselectedItemColor ?? colors.onSurfaceVariant;
  }
  
  /// Get bottom nav border color
  Color? _getBottomNavBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiBottomNavState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiBottomNavVariant.filled:
        return null;
      case AuiBottomNavVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiBottomNavVariant.elevated:
        return null;
      case AuiBottomNavVariant.tonal:
        return null;
      case AuiBottomNavVariant.minimal:
        return null;
    }
  }
  
  /// Get bottom nav elevation
  double _getBottomNavElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiBottomNavVariant.filled:
        return elevation.level0;
      case AuiBottomNavVariant.outlined:
        return elevation.level0;
      case AuiBottomNavVariant.elevated:
        return elevation.level2;
      case AuiBottomNavVariant.tonal:
        return elevation.level0;
      case AuiBottomNavVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get bottom nav border radius
  BorderRadius _getBottomNavBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiBottomNavSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiBottomNavSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiBottomNavSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiBottomNavSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiBottomNavSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get bottom nav padding
  EdgeInsets _getBottomNavPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiBottomNavSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiBottomNavSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiBottomNavSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.md);
      case AuiBottomNavSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.xl, vertical: spacing.lg);
      case AuiBottomNavSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.xxl, vertical: spacing.xl);
    }
  }
  
  /// Get bottom nav height
  double _getBottomNavHeight() {
    switch (widget.size) {
      case AuiBottomNavSize.xs:
        return 48.0;
      case AuiBottomNavSize.sm:
        return 56.0;
      case AuiBottomNavSize.md:
        return 64.0;
      case AuiBottomNavSize.lg:
        return 72.0;
      case AuiBottomNavSize.xl:
        return 80.0;
    }
  }
  
  /// Get bottom nav icon size
  double _getBottomNavIconSize() {
    if (widget.iconSize != null) return widget.iconSize!;
    
    switch (widget.size) {
      case AuiBottomNavSize.xs:
        return 20.0;
      case AuiBottomNavSize.sm:
        return 24.0;
      case AuiBottomNavSize.md:
        return 24.0;
      case AuiBottomNavSize.lg:
        return 28.0;
      case AuiBottomNavSize.xl:
        return 32.0;
    }
  }
  
  /// Get bottom nav selected font size
  double _getBottomNavSelectedFontSize() {
    if (widget.selectedFontSize != null) return widget.selectedFontSize!;
    
    switch (widget.size) {
      case AuiBottomNavSize.xs:
        return 12.0;
      case AuiBottomNavSize.sm:
        return 14.0;
      case AuiBottomNavSize.md:
        return 14.0;
      case AuiBottomNavSize.lg:
        return 16.0;
      case AuiBottomNavSize.xl:
        return 18.0;
    }
  }
  
  /// Get bottom nav unselected font size
  double _getBottomNavUnselectedFontSize() {
    if (widget.unselectedFontSize != null) return widget.unselectedFontSize!;
    
    switch (widget.size) {
      case AuiBottomNavSize.xs:
        return 10.0;
      case AuiBottomNavSize.sm:
        return 12.0;
      case AuiBottomNavSize.md:
        return 12.0;
      case AuiBottomNavSize.lg:
        return 14.0;
      case AuiBottomNavSize.xl:
        return 16.0;
    }
  }
  
  /// Get bottom nav items
  List<BottomNavigationBarItem> _getBottomNavItems(AuiColorScheme colors, double iconSize) {
    return widget.items.map((item) {
      return BottomNavigationBarItem(
        icon: _getBottomNavItemIcon(item, colors, iconSize),
        activeIcon: item.activeIcon ?? _getBottomNavItemIcon(item, colors, iconSize),
        label: item.label,
        tooltip: item.tooltip,
      );
    }).toList();
  }
  
  /// Get bottom nav item icon
  Widget _getBottomNavItemIcon(AuiBottomNavItem item, AuiColorScheme colors, double iconSize) {
    Widget icon = item.icon;
    
    // Add badge if provided
    if (item.badge != null) {
      icon = Stack(
        clipBehavior: Clip.none,
        children: [
          icon,
          Positioned(
            right: widget.badgeOffset?.dx ?? _getBadgeOffset(),
            top: widget.badgeOffset?.dy ?? _getBadgeOffset(),
            child: item.badge!,
          ),
        ],
      );
    }
    
    return icon;
  }
  
  /// Get selected label style
  TextStyle _getSelectedLabelStyle(AuiColorScheme colors, double fontSize) {
    return TextStyle(
      color: _getBottomNavSelectedColor(colors),
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }
  
  /// Get unselected label style
  TextStyle _getUnselectedLabelStyle(AuiColorScheme colors, double fontSize) {
    return TextStyle(
      color: _getBottomNavUnselectedColor(colors),
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get badge offset
  double _getBadgeOffset() {
    switch (widget.size) {
      case AuiBottomNavSize.xs:
        return -4.0;
      case AuiBottomNavSize.sm:
        return -6.0;
      case AuiBottomNavSize.md:
        return -8.0;
      case AuiBottomNavSize.lg:
        return -10.0;
      case AuiBottomNavSize.xl:
        return -12.0;
    }
  }
  
  /// Get bottom nav shadows
  List<BoxShadow> _getBottomNavShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, -elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}

/// Shape clipper for custom bottom nav shapes
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

/// Bottom navigation utilities
class AuiBottomNavUtils {
  const AuiBottomNavUtils._();
  
  /// Get bottom nav height for size
  static double getBottomNavHeight(AuiBottomNavSize size) {
    switch (size) {
      case AuiBottomNavSize.xs:
        return 48.0;
      case AuiBottomNavSize.sm:
        return 56.0;
      case AuiBottomNavSize.md:
        return 64.0;
      case AuiBottomNavSize.lg:
        return 72.0;
      case AuiBottomNavSize.xl:
        return 80.0;
    }
  }
  
  /// Get icon size for size
  static double getIconSize(AuiBottomNavSize size) {
    switch (size) {
      case AuiBottomNavSize.xs:
        return 20.0;
      case AuiBottomNavSize.sm:
        return 24.0;
      case AuiBottomNavSize.md:
        return 24.0;
      case AuiBottomNavSize.lg:
        return 28.0;
      case AuiBottomNavSize.xl:
        return 32.0;
    }
  }
  
  /// Get selected font size for size
  static double getSelectedFontSize(AuiBottomNavSize size) {
    switch (size) {
      case AuiBottomNavSize.xs:
        return 12.0;
      case AuiBottomNavSize.sm:
        return 14.0;
      case AuiBottomNavSize.md:
        return 14.0;
      case AuiBottomNavSize.lg:
        return 16.0;
      case AuiBottomNavSize.xl:
        return 18.0;
    }
  }
  
  /// Get unselected font size for size
  static double getUnselectedFontSize(AuiBottomNavSize size) {
    switch (size) {
      case AuiBottomNavSize.xs:
        return 10.0;
      case AuiBottomNavSize.sm:
        return 12.0;
      case AuiBottomNavSize.md:
        return 12.0;
      case AuiBottomNavSize.lg:
        return 14.0;
      case AuiBottomNavSize.xl:
        return 16.0;
    }
  }
}
