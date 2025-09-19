import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Tab variants
enum AuiTabVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Tab sizes
enum AuiTabSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Tab states
enum AuiTabState {
  enabled,
  disabled,
  selected,
  unselected,
  hovered,
  focused,
}

/// Tab alignment
enum AuiTabAlignment {
  start,
  center,
  end,
  fill,
}

/// Tab bar variant
enum AuiTabBarVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Tab bar size
enum AuiTabBarSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Tab bar state
enum AuiTabBarState {
  enabled,
  disabled,
  hidden,
  visible,
}

/// Tab data
class AuiTabData {
  const AuiTabData({
    required this.label,
    this.icon,
    this.activeIcon,
    this.badge,
    this.badgeColor,
    this.badgeTextColor,
    this.tooltip,
    this.semanticLabel,
    this.enabled = true,
    this.visible = true,
    this.backgroundColor,
    this.foregroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.iconSize,
    this.labelStyle,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.gradient,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.shape,
  });

  final String label;
  final Widget? icon;
  final Widget? activeIcon;
  final Widget? badge;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final String? tooltip;
  final String? semanticLabel;
  final bool enabled;
  final bool visible;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? iconSize;
  final TextStyle? labelStyle;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Gradient? gradient;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final ShapeBorder? shape;
}

/// A comprehensive tab component
class AuiTab extends StatelessWidget {
  const AuiTab({
    super.key,
    required this.label,
    this.icon,
    this.activeIcon,
    this.badge,
    this.badgeColor,
    this.badgeTextColor,
    this.tooltip,
    this.semanticLabel,
    this.variant = AuiTabVariant.filled,
    this.size = AuiTabSize.md,
    this.state = AuiTabState.enabled,
    this.backgroundColor,
    this.foregroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.iconSize,
    this.labelStyle,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.borderColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.gradient,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.clipBehavior = Clip.none,
    this.shape,
    this.selected = false,
  });

  final String label;
  final Widget? icon;
  final Widget? activeIcon;
  final Widget? badge;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final String? tooltip;
  final String? semanticLabel;
  final AuiTabVariant variant;
  final AuiTabSize size;
  final AuiTabState state;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? iconSize;
  final TextStyle? labelStyle;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Gradient? gradient;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get tab colors
    final tabBackgroundColor = _getTabBackgroundColor(colors);
    final tabBorderColor = _getTabBorderColor(colors, borderColor);
    
    // Get tab elevation
    final tabElevation = _getTabElevation(elevation);
    
    // Get tab border radius
    final tabBorderRadius = _getTabBorderRadius(spacing);
    
    // Get tab padding
    final tabPadding = _getTabPadding(spacing);
    
    // Get tab icon size
    final tabIconSize = _getTabIconSize();
    
    // Get tab font size
    final tabFontSize = _getTabFontSize();
    
    // Get icon widget
    final iconWidget = _getIconWidget(tabIconSize);
    
    // Get label widget
    final labelWidget = _getLabelWidget(colors, tabFontSize);
    
    Widget tab = Container(
      padding: tabPadding,
      decoration: BoxDecoration(
        color: tabBackgroundColor,
        borderRadius: tabBorderRadius,
        border: tabBorderColor != null 
            ? Border.all(color: tabBorderColor, width: 1.0)
            : null,
        gradient: gradient,
        boxShadow: _getTabShadows(colors, tabElevation),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconWidget != null) ...[
            iconWidget,
            SizedBox(width: _getIconSpacing()),
          ],
          labelWidget,
          if (badge != null) ...[
            SizedBox(width: _getIconSpacing()),
            _getBadgeWidget(),
          ],
        ],
      ),
    );
    
    // Add tap functionality
    if (onTap != null || onLongPress != null || onDoubleTap != null) {
      tab = GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: tab,
      );
    }
    
    // Add margin
    if (margin != null) {
      tab = Padding(
        padding: margin!,
        child: tab,
      );
    }
    
    // Add semantics
    if (semanticLabel != null) {
      tab = Semantics(
        label: semanticLabel,
        child: tab,
      );
    }
    
    // Add tooltip
    if (tooltip != null) {
      tab = Tooltip(
        message: tooltip!,
        child: tab,
      );
    }
    
    return tab;
  }
  
  /// Get tab background color
  Color _getTabBackgroundColor(AuiColorScheme colors) {
    if (state == AuiTabState.disabled) {
      return colors.surfaceVariant;
    }
    
    if (selected) {
      switch (variant) {
        case AuiTabVariant.filled:
          return backgroundColor ?? colors.primary;
        case AuiTabVariant.outlined:
          return backgroundColor ?? colors.surface;
        case AuiTabVariant.elevated:
          return backgroundColor ?? colors.surface;
        case AuiTabVariant.tonal:
          return backgroundColor ?? colors.primaryContainer;
        case AuiTabVariant.minimal:
          return Colors.transparent;
      }
    } else {
      switch (variant) {
        case AuiTabVariant.filled:
          return backgroundColor ?? colors.surfaceVariant;
        case AuiTabVariant.outlined:
          return backgroundColor ?? colors.surface;
        case AuiTabVariant.elevated:
          return backgroundColor ?? colors.surface;
        case AuiTabVariant.tonal:
          return backgroundColor ?? colors.surfaceVariant;
        case AuiTabVariant.minimal:
          return Colors.transparent;
      }
    }
  }
  
  /// Get tab foreground color
  Color _getTabForegroundColor(AuiColorScheme colors) {
    if (state == AuiTabState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    if (selected) {
      return selectedColor ?? colors.onPrimary;
    } else {
      return unselectedColor ?? colors.onSurfaceVariant;
    }
  }
  
  /// Get tab border color
  Color? _getTabBorderColor(AuiColorScheme colors, Color? borderColor) {
    if (state == AuiTabState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (variant) {
      case AuiTabVariant.filled:
        return null;
      case AuiTabVariant.outlined:
        return borderColor ?? colors.outline;
      case AuiTabVariant.elevated:
        return null;
      case AuiTabVariant.tonal:
        return null;
      case AuiTabVariant.minimal:
        return null;
    }
  }
  
  /// Get tab elevation
  double _getTabElevation(AuiElevationScheme elevation) {
    if (this.elevation != null) return this.elevation!;
    
    switch (variant) {
      case AuiTabVariant.filled:
        return elevation.level0;
      case AuiTabVariant.outlined:
        return elevation.level0;
      case AuiTabVariant.elevated:
        return elevation.level1;
      case AuiTabVariant.tonal:
        return elevation.level0;
      case AuiTabVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get tab border radius
  BorderRadius _getTabBorderRadius(AuiSpacingScheme spacing) {
    if (borderRadius != null) return borderRadius!;
    
    switch (size) {
      case AuiTabSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiTabSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiTabSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiTabSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiTabSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get tab padding
  EdgeInsets _getTabPadding(AuiSpacingScheme spacing) {
    if (padding != null) return padding!;
    
    switch (size) {
      case AuiTabSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiTabSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiTabSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.md);
      case AuiTabSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.xl, vertical: spacing.lg);
      case AuiTabSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.xxl, vertical: spacing.xl);
    }
  }
  
  /// Get tab icon size
  double _getTabIconSize() {
    if (iconSize != null) return iconSize!;
    
    switch (size) {
      case AuiTabSize.xs:
        return 16.0;
      case AuiTabSize.sm:
        return 20.0;
      case AuiTabSize.md:
        return 24.0;
      case AuiTabSize.lg:
        return 28.0;
      case AuiTabSize.xl:
        return 32.0;
    }
  }
  
  /// Get tab font size
  double _getTabFontSize() {
    switch (size) {
      case AuiTabSize.xs:
        return 12.0;
      case AuiTabSize.sm:
        return 14.0;
      case AuiTabSize.md:
        return 16.0;
      case AuiTabSize.lg:
        return 18.0;
      case AuiTabSize.xl:
        return 20.0;
    }
  }
  
  /// Get icon widget
  Widget? _getIconWidget(double iconSize) {
    if (icon == null) return null;
    
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: selected && activeIcon != null ? activeIcon! : icon!,
    );
  }
  
  /// Get label widget
  Widget _getLabelWidget(AuiColorScheme colors, double fontSize) {
    return Text(
      label,
      style: _getLabelTextStyle(colors, fontSize),
    );
  }
  
  /// Get label text style
  TextStyle _getLabelTextStyle(AuiColorScheme colors, double fontSize) {
    if (selected) {
      return selectedLabelStyle ?? TextStyle(
        color: _getTabForegroundColor(colors),
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );
    } else {
      return unselectedLabelStyle ?? TextStyle(
        color: _getTabForegroundColor(colors),
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      );
    }
  }
  
  /// Get badge widget
  Widget _getBadgeWidget() {
    if (badge == null) return const SizedBox.shrink();
    
    return Positioned(
      right: badgeOffset?.dx ?? _getBadgeOffset(),
      top: badgeOffset?.dy ?? _getBadgeOffset(),
      child: badge!,
    );
  }
  
  /// Get icon spacing
  double _getIconSpacing() {
    switch (size) {
      case AuiTabSize.xs:
        return 4.0;
      case AuiTabSize.sm:
        return 6.0;
      case AuiTabSize.md:
        return 8.0;
      case AuiTabSize.lg:
        return 10.0;
      case AuiTabSize.xl:
        return 12.0;
    }
  }
  
  /// Get badge offset
  double _getBadgeOffset() {
    switch (size) {
      case AuiTabSize.xs:
        return -4.0;
      case AuiTabSize.sm:
        return -6.0;
      case AuiTabSize.md:
        return -8.0;
      case AuiTabSize.lg:
        return -10.0;
      case AuiTabSize.xl:
        return -12.0;
    }
  }
  
  /// Get tab shadows
  List<BoxShadow> _getTabShadows(AuiColorScheme colors, double elevation) {
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

/// A comprehensive tab bar component
class AuiTabBar extends StatefulWidget implements PreferredSizeWidget {
  const AuiTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicator,
    this.indicatorColor,
    this.indicatorSize = TabBarIndicatorSize.tab,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.dividerColor,
    this.dividerHeight = 0.0,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.labelPadding,
    this.overlayColor,
    this.splashFactory,
    this.mouseCursor,
    this.enableFeedback = true,
    this.onTap,
    this.variant = AuiTabBarVariant.filled,
    this.size = AuiTabBarSize.md,
    this.state = AuiTabBarState.enabled,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.alignment = AuiTabAlignment.center,
    this.spacing,
    this.gradient,
    this.border,
    this.shape,
    this.clipBehavior = Clip.none,
  });

  final List<AuiTabData> tabs;
  final TabController? controller;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;
  final Decoration? indicator;
  final Color? indicatorColor;
  final TabBarIndicatorSize indicatorSize;
  final double indicatorWeight;
  final EdgeInsetsGeometry indicatorPadding;
  final Color? dividerColor;
  final double dividerHeight;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final WidgetStateProperty<Color?>? overlayColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final MouseCursor? mouseCursor;
  final bool enableFeedback;
  final ValueChanged<int>? onTap;
  final AuiTabBarVariant variant;
  final AuiTabBarSize size;
  final AuiTabBarState state;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final AuiTabAlignment alignment;
  final double? spacing;
  final Gradient? gradient;
  final Border? border;
  final ShapeBorder? shape;
  final Clip clipBehavior;

  @override
  State<AuiTabBar> createState() => _AuiTabBarState();

  @override
  Size get preferredSize {
    final height = _getTabBarHeight();
    return Size.fromHeight(height);
  }

  /// Get tab bar height
  double _getTabBarHeight() {
    switch (size) {
      case AuiTabBarSize.xs:
        return 40.0;
      case AuiTabBarSize.sm:
        return 48.0;
      case AuiTabBarSize.md:
        return 56.0;
      case AuiTabBarSize.lg:
        return 64.0;
      case AuiTabBarSize.xl:
        return 72.0;
    }
  }
}

class _AuiTabBarState extends State<AuiTabBar> {
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get tab bar colors
    final tabBarBackgroundColor = _getTabBarBackgroundColor(colors);
    final tabBarBorderColor = _getTabBarBorderColor(colors);
    
    // Get tab bar elevation
    final tabBarElevation = _getTabBarElevation(elevation);
    
    // Get tab bar border radius
    final tabBarBorderRadius = _getTabBarBorderRadius(spacing);
    
    // Get tab bar padding
    final tabBarPadding = _getTabBarPadding(spacing);
    
    // Get tab bar height
    final tabBarHeight = _getTabBarHeight();
    
    // Get tab bar spacing
    final tabBarSpacing = _getTabBarSpacing(spacing);
    
    Widget tabBar = Container(
      height: tabBarHeight,
      padding: tabBarPadding,
      decoration: BoxDecoration(
        color: tabBarBackgroundColor,
        borderRadius: tabBarBorderRadius,
        border: tabBarBorderColor != null 
            ? Border.all(color: tabBarBorderColor, width: 1.0)
            : null,
        gradient: widget.gradient,
        boxShadow: _getTabBarShadows(colors, tabBarElevation),
      ),
      child: Row(
        mainAxisAlignment: _getMainAxisAlignment(),
        children: _getTabWidgets(colors, tabBarSpacing),
      ),
    );
    
    // Add border if needed
    if (widget.border != null) {
      tabBar = Container(
        decoration: BoxDecoration(
          border: widget.border,
        ),
        child: tabBar,
      );
    }
    
    // Add shape if needed
    if (widget.shape != null) {
      tabBar = ClipPath(
        clipper: _ShapeClipper(widget.shape!),
        child: tabBar,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      tabBar = Padding(
        padding: widget.margin!,
        child: tabBar,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      tabBar = Semantics(
        label: widget.semanticLabel,
        child: tabBar,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      tabBar = Tooltip(
        message: widget.tooltip!,
        child: tabBar,
      );
    }
    
    return tabBar;
  }
  
  /// Get tab bar background color
  Color _getTabBarBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiTabBarState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiTabBarVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiTabBarVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiTabBarVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiTabBarVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
      case AuiTabBarVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get tab bar foreground color
  
  /// Get tab bar border color
  Color? _getTabBarBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiTabBarState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiTabBarVariant.filled:
        return null;
      case AuiTabBarVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiTabBarVariant.elevated:
        return null;
      case AuiTabBarVariant.tonal:
        return null;
      case AuiTabBarVariant.minimal:
        return null;
    }
  }
  
  /// Get tab bar elevation
  double _getTabBarElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiTabBarVariant.filled:
        return elevation.level0;
      case AuiTabBarVariant.outlined:
        return elevation.level0;
      case AuiTabBarVariant.elevated:
        return elevation.level1;
      case AuiTabBarVariant.tonal:
        return elevation.level0;
      case AuiTabBarVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get tab bar border radius
  BorderRadius _getTabBarBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiTabBarSize.xs:
        return BorderRadius.circular(spacing.xs);
      case AuiTabBarSize.sm:
        return BorderRadius.circular(spacing.sm);
      case AuiTabBarSize.md:
        return BorderRadius.circular(spacing.md);
      case AuiTabBarSize.lg:
        return BorderRadius.circular(spacing.lg);
      case AuiTabBarSize.xl:
        return BorderRadius.circular(spacing.xl);
    }
  }
  
  /// Get tab bar padding
  EdgeInsets _getTabBarPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding! as EdgeInsets;
    
    switch (widget.size) {
      case AuiTabBarSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiTabBarSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiTabBarSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.md);
      case AuiTabBarSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.xl, vertical: spacing.lg);
      case AuiTabBarSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.xxl, vertical: spacing.xl);
    }
  }
  
  /// Get tab bar height
  double _getTabBarHeight() {
    switch (widget.size) {
      case AuiTabBarSize.xs:
        return 40.0;
      case AuiTabBarSize.sm:
        return 48.0;
      case AuiTabBarSize.md:
        return 56.0;
      case AuiTabBarSize.lg:
        return 64.0;
      case AuiTabBarSize.xl:
        return 72.0;
    }
  }
  
  /// Get tab bar spacing
  double _getTabBarSpacing(AuiSpacingScheme spacing) {
    if (widget.spacing != null) return widget.spacing!;
    
    switch (widget.size) {
      case AuiTabBarSize.xs:
        return spacing.xs;
      case AuiTabBarSize.sm:
        return spacing.sm;
      case AuiTabBarSize.md:
        return spacing.md;
      case AuiTabBarSize.lg:
        return spacing.lg;
      case AuiTabBarSize.xl:
        return spacing.xl;
    }
  }
  
  /// Get main axis alignment
  MainAxisAlignment _getMainAxisAlignment() {
    switch (widget.alignment) {
      case AuiTabAlignment.start:
        return MainAxisAlignment.start;
      case AuiTabAlignment.center:
        return MainAxisAlignment.center;
      case AuiTabAlignment.end:
        return MainAxisAlignment.end;
      case AuiTabAlignment.fill:
        return MainAxisAlignment.spaceEvenly;
    }
  }
  
  /// Get tab widgets
  List<Widget> _getTabWidgets(AuiColorScheme colors, double spacing) {
    final widgets = <Widget>[];
    
    for (int i = 0; i < widget.tabs.length; i++) {
      final tabData = widget.tabs[i];
      
      if (tabData.visible) {
        widgets.add(
          AuiTab(
            label: tabData.label,
            icon: tabData.icon,
            activeIcon: tabData.activeIcon,
            badge: tabData.badge,
            badgeColor: tabData.badgeColor,
            badgeTextColor: tabData.badgeTextColor,
            tooltip: tabData.tooltip,
            semanticLabel: tabData.semanticLabel,
            variant: AuiTabVariant.filled,
            size: _getTabSize(),
            state: tabData.enabled ? AuiTabState.enabled : AuiTabState.disabled,
            backgroundColor: tabData.backgroundColor,
            foregroundColor: tabData.foregroundColor,
            selectedColor: tabData.selectedColor,
            unselectedColor: tabData.unselectedColor,
            iconSize: tabData.iconSize,
            labelStyle: tabData.labelStyle,
            selectedLabelStyle: tabData.selectedLabelStyle,
            unselectedLabelStyle: tabData.unselectedLabelStyle,
            padding: tabData.padding,
            margin: tabData.margin,
            borderRadius: tabData.borderRadius,
            border: tabData.border,
            elevation: tabData.elevation,
            shadowColor: tabData.shadowColor,
            surfaceTintColor: tabData.surfaceTintColor,
            gradient: tabData.gradient,
            badgeAlignment: tabData.badgeAlignment,
            badgeOffset: tabData.badgeOffset,
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!(i);
              }
              if (tabData.onTap != null) {
                tabData.onTap!();
              }
            },
            onLongPress: tabData.onLongPress,
            onDoubleTap: tabData.onDoubleTap,
            mouseCursor: tabData.mouseCursor,
            clipBehavior: widget.clipBehavior,
            shape: tabData.shape,
            selected: i == (widget.controller?.index ?? 0),
          ),
        );
        
        if (i < widget.tabs.length - 1) {
          widgets.add(SizedBox(width: spacing));
        }
      }
    }
    
    return widgets;
  }
  
  /// Get tab size
  AuiTabSize _getTabSize() {
    switch (widget.size) {
      case AuiTabBarSize.xs:
        return AuiTabSize.xs;
      case AuiTabBarSize.sm:
        return AuiTabSize.sm;
      case AuiTabBarSize.md:
        return AuiTabSize.md;
      case AuiTabBarSize.lg:
        return AuiTabSize.lg;
      case AuiTabBarSize.xl:
        return AuiTabSize.xl;
    }
  }
  
  /// Get tab bar shadows
  List<BoxShadow> _getTabBarShadows(AuiColorScheme colors, double elevation) {
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

/// Shape clipper for custom tab bar shapes
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

/// Tab utilities
class AuiTabUtils {
  const AuiTabUtils._();
  
  /// Get tab size from tab bar size
  static AuiTabSize getTabSize(AuiTabBarSize size) {
    switch (size) {
      case AuiTabBarSize.xs:
        return AuiTabSize.xs;
      case AuiTabBarSize.sm:
        return AuiTabSize.sm;
      case AuiTabBarSize.md:
        return AuiTabSize.md;
      case AuiTabBarSize.lg:
        return AuiTabSize.lg;
      case AuiTabBarSize.xl:
        return AuiTabSize.xl;
    }
  }
  
  /// Get tab bar height for size
  static double getTabBarHeight(AuiTabBarSize size) {
    switch (size) {
      case AuiTabBarSize.xs:
        return 40.0;
      case AuiTabBarSize.sm:
        return 48.0;
      case AuiTabBarSize.md:
        return 56.0;
      case AuiTabBarSize.lg:
        return 64.0;
      case AuiTabBarSize.xl:
        return 72.0;
    }
  }
  
  /// Get icon size for size
  static double getIconSize(AuiTabSize size) {
    switch (size) {
      case AuiTabSize.xs:
        return 16.0;
      case AuiTabSize.sm:
        return 20.0;
      case AuiTabSize.md:
        return 24.0;
      case AuiTabSize.lg:
        return 28.0;
      case AuiTabSize.xl:
        return 32.0;
    }
  }
  
  /// Get font size for size
  static double getFontSize(AuiTabSize size) {
    switch (size) {
      case AuiTabSize.xs:
        return 12.0;
      case AuiTabSize.sm:
        return 14.0;
      case AuiTabSize.md:
        return 16.0;
      case AuiTabSize.lg:
        return 18.0;
      case AuiTabSize.xl:
        return 20.0;
    }
  }
}
