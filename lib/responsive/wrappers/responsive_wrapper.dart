import 'package:flutter/material.dart';
import '../breakpoints/responsive_breakpoints.dart';

/// A comprehensive responsive wrapper component
class AuiResponsive extends StatelessWidget {
  const AuiResponsive({
    super.key,
    required this.child,
    this.breakpoints,
    this.builder,
    this.mobile,
    this.tablet,
    this.desktop,
    this.watch,
    this.tv,
    this.portrait,
    this.landscape,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.orientation,
    this.deviceType,
    this.condition,
    this.fallback,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  final Widget child;
  final AuiBreakpointValues? breakpoints;
  final Widget Function(BuildContext context, AuiResponsiveConfig config)? builder;
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? watch;
  final Widget? tv;
  final Widget? portrait;
  final Widget? landscape;
  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;
  final AuiOrientation? orientation;
  final AuiDeviceType? deviceType;
  final bool Function(AuiResponsiveConfig config)? condition;
  final Widget? fallback;
  final bool animate;
  final Duration animationDuration;
  final Curve animationCurve;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    // Use builder if provided
    if (builder != null) {
      return builder!(context, config);
    }
    
    // Use condition if provided
    if (condition != null) {
      if (condition!(config)) {
        return _buildAnimatedChild(child);
      }
      return fallback ?? const SizedBox.shrink();
    }
    
    // Use orientation-specific widgets
    if (orientation != null) {
      if (orientation == AuiOrientation.portrait && portrait != null) {
        return _buildAnimatedChild(portrait!);
      }
      if (orientation == AuiOrientation.landscape && landscape != null) {
        return _buildAnimatedChild(landscape!);
      }
    }
    
    // Use device type-specific widgets
    if (deviceType != null) {
      switch (deviceType!) {
        case AuiDeviceType.mobile:
          if (mobile != null) return _buildAnimatedChild(mobile!);
          break;
        case AuiDeviceType.tablet:
          if (tablet != null) return _buildAnimatedChild(tablet!);
          break;
        case AuiDeviceType.desktop:
          if (desktop != null) return _buildAnimatedChild(desktop!);
          break;
        case AuiDeviceType.watch:
          if (watch != null) return _buildAnimatedChild(watch!);
          break;
        case AuiDeviceType.tv:
          if (tv != null) return _buildAnimatedChild(tv!);
          break;
      }
    }
    
    // Use breakpoint-specific widgets
    final breakpoint = config.currentBreakpoint;
    switch (breakpoint) {
      case AuiBreakpoint.xs:
        if (xs != null) return _buildAnimatedChild(xs!);
        break;
      case AuiBreakpoint.sm:
        if (sm != null) return _buildAnimatedChild(sm!);
        break;
      case AuiBreakpoint.md:
        if (md != null) return _buildAnimatedChild(md!);
        break;
      case AuiBreakpoint.lg:
        if (lg != null) return _buildAnimatedChild(lg!);
        break;
      case AuiBreakpoint.xl:
        if (xl != null) return _buildAnimatedChild(xl!);
        break;
      case AuiBreakpoint.xxl:
        if (xxl != null) return _buildAnimatedChild(xxl!);
        break;
    }
    
    // Use device type fallbacks
    if (config.isMobile && mobile != null) {
      return _buildAnimatedChild(mobile!);
    }
    if (config.isTablet && tablet != null) {
      return _buildAnimatedChild(tablet!);
    }
    if (config.isDesktop && desktop != null) {
      return _buildAnimatedChild(desktop!);
    }
    
    // Use orientation fallbacks
    if (config.isPortrait && portrait != null) {
      return _buildAnimatedChild(portrait!);
    }
    if (config.isLandscape && landscape != null) {
      return _buildAnimatedChild(landscape!);
    }
    
    // Return default child
    return _buildAnimatedChild(child);
  }
  
  /// Build animated child
  Widget _buildAnimatedChild(Widget child) {
    if (!animate) return child;
    
    return AnimatedSwitcher(
      duration: animationDuration,
      switchInCurve: animationCurve,
      switchOutCurve: animationCurve,
      child: child,
    );
  }
}

/// Responsive value wrapper
class AuiResponsiveValue<T> extends StatelessWidget {
  const AuiResponsiveValue({
    super.key,
    required this.values,
    this.breakpoints,
    this.fallback,
    this.builder,
  });

  final Map<AuiBreakpoint, T> values;
  final AuiBreakpointValues? breakpoints;
  final T? fallback;
  final Widget Function(BuildContext context, T value)? builder;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    final value = AuiResponsiveBreakpoints.getValueWithFallback(
      config.width,
      values,
      fallback ?? values.values.last,
      breakpoints: breakpoints ?? config.breakpoints,
    );
    
    if (builder != null) {
      return builder!(context, value);
    }
    
    return Text(value.toString());
  }
}

/// Responsive interpolated value wrapper
class AuiResponsiveInterpolatedValue extends StatelessWidget {
  const AuiResponsiveInterpolatedValue({
    super.key,
    required this.values,
    this.breakpoints,
    this.fallback,
    this.builder,
  });

  final Map<AuiBreakpoint, double> values;
  final AuiBreakpointValues? breakpoints;
  final double? fallback;
  final Widget Function(BuildContext context, double value)? builder;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    final value = AuiResponsiveBreakpoints.getInterpolatedValue(
      config.width,
      values,
      breakpoints: breakpoints ?? config.breakpoints,
    );
    
    if (builder != null) {
      return builder!(context, value);
    }
    
    return Text(value.toString());
  }
}

/// Responsive condition wrapper
class AuiResponsiveCondition extends StatelessWidget {
  const AuiResponsiveCondition({
    super.key,
    required this.condition,
    required this.child,
    this.fallback,
    this.breakpoints,
  });

  final bool Function(AuiResponsiveConfig config) condition;
  final Widget child;
  final Widget? fallback;
  final AuiBreakpointValues? breakpoints;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    if (condition(config)) {
      return child;
    }
    
    return fallback ?? const SizedBox.shrink();
  }
}

/// Responsive breakpoint wrapper
class AuiResponsiveBreakpoint extends StatelessWidget {
  const AuiResponsiveBreakpoint({
    super.key,
    required this.breakpoint,
    required this.child,
    this.fallback,
    this.breakpoints,
    this.operator = AuiResponsiveOperator.atLeast,
  });

  final AuiBreakpoint breakpoint;
  final Widget child;
  final Widget? fallback;
  final AuiBreakpointValues? breakpoints;
  final AuiResponsiveOperator operator;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    bool shouldShow = false;
    switch (operator) {
      case AuiResponsiveOperator.atLeast:
        shouldShow = config.isAtLeast(breakpoint);
        break;
      case AuiResponsiveOperator.atMost:
        shouldShow = config.isAtMost(breakpoint);
        break;
      case AuiResponsiveOperator.exactly:
        shouldShow = config.currentBreakpoint == breakpoint;
        break;
      case AuiResponsiveOperator.between:
        // This would need two breakpoints, so we'll use atLeast for now
        shouldShow = config.isAtLeast(breakpoint);
        break;
    }
    
    if (shouldShow) {
      return child;
    }
    
    return fallback ?? const SizedBox.shrink();
  }
}

/// Responsive operator
enum AuiResponsiveOperator {
  atLeast,
  atMost,
  exactly,
  between,
}

/// Responsive device type wrapper
class AuiResponsiveDeviceType extends StatelessWidget {
  const AuiResponsiveDeviceType({
    super.key,
    required this.deviceType,
    required this.child,
    this.fallback,
  });

  final AuiDeviceType deviceType;
  final Widget child;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    if (config.deviceType == deviceType) {
      return child;
    }
    
    return fallback ?? const SizedBox.shrink();
  }
}

/// Responsive orientation wrapper
class AuiResponsiveOrientation extends StatelessWidget {
  const AuiResponsiveOrientation({
    super.key,
    required this.orientation,
    required this.child,
    this.fallback,
  });

  final AuiOrientation orientation;
  final Widget child;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    if (config.orientation == orientation) {
      return child;
    }
    
    return fallback ?? const SizedBox.shrink();
  }
}

/// Responsive grid wrapper
class AuiResponsiveGrid extends StatelessWidget {
  const AuiResponsiveGrid({
    super.key,
    required this.children,
    this.breakpoints,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 3,
    this.gap = 16.0,
    this.childAspectRatio = 1.0,
    this.mainAxisSpacing = 16.0,
    this.crossAxisSpacing = 16.0,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
  });

  final List<Widget> children;
  final AuiBreakpointValues? breakpoints;
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double gap;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    int columns;
    if (config.isDesktop) {
      columns = desktopColumns;
    } else if (config.isTablet) {
      columns = tabletColumns;
    } else {
      columns = mobileColumns;
    }
    
    return GridView.builder(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// Responsive list wrapper
class AuiResponsiveList extends StatelessWidget {
  const AuiResponsiveList({
    super.key,
    required this.children,
    this.breakpoints,
    this.mobileItemCount = 1,
    this.tabletItemCount = 2,
    this.desktopItemCount = 3,
    this.gap = 16.0,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
  });

  final List<Widget> children;
  final AuiBreakpointValues? breakpoints;
  final int mobileItemCount;
  final int tabletItemCount;
  final int desktopItemCount;
  final double gap;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    int itemCount;
    if (config.isDesktop) {
      itemCount = desktopItemCount;
    } else if (config.isTablet) {
      itemCount = tabletItemCount;
    } else {
      itemCount = mobileItemCount;
    }
    
    return ListView.builder(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      itemCount: (children.length / itemCount).ceil(),
      itemBuilder: (context, index) {
        final startIndex = index * itemCount;
        final endIndex = (startIndex + itemCount).clamp(0, children.length);
        final items = children.sublist(startIndex, endIndex);
        
        return Padding(
          padding: EdgeInsets.only(bottom: gap),
          child: Row(
            children: items.map((item) => Expanded(child: item)).toList(),
          ),
        );
      },
    );
  }
}

/// Responsive text wrapper
class AuiResponsiveText extends StatelessWidget {
  const AuiResponsiveText(
    this.text, {
    super.key,
    this.breakpoints,
    this.mobileStyle,
    this.tabletStyle,
    this.desktopStyle,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
  });

  final String text;
  final AuiBreakpointValues? breakpoints;
  final TextStyle? mobileStyle;
  final TextStyle? tabletStyle;
  final TextStyle? desktopStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    TextStyle? effectiveStyle;
    if (config.isDesktop && desktopStyle != null) {
      effectiveStyle = desktopStyle;
    } else if (config.isTablet && tabletStyle != null) {
      effectiveStyle = tabletStyle;
    } else if (config.isMobile && mobileStyle != null) {
      effectiveStyle = mobileStyle;
    } else {
      effectiveStyle = style;
    }
    
    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
    );
  }
}

/// Responsive spacing wrapper
class AuiResponsiveSpacing extends StatelessWidget {
  const AuiResponsiveSpacing({
    super.key,
    required this.child,
    this.breakpoints,
    this.mobilePadding,
    this.tabletPadding,
    this.desktopPadding,
    this.padding,
    this.mobileMargin,
    this.tabletMargin,
    this.desktopMargin,
    this.margin,
  });

  final Widget child;
  final AuiBreakpointValues? breakpoints;
  final EdgeInsets? mobilePadding;
  final EdgeInsets? tabletPadding;
  final EdgeInsets? desktopPadding;
  final EdgeInsets? padding;
  final EdgeInsets? mobileMargin;
  final EdgeInsets? tabletMargin;
  final EdgeInsets? desktopMargin;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    
    EdgeInsets? effectivePadding;
    if (config.isDesktop && desktopPadding != null) {
      effectivePadding = desktopPadding;
    } else if (config.isTablet && tabletPadding != null) {
      effectivePadding = tabletPadding;
    } else if (config.isMobile && mobilePadding != null) {
      effectivePadding = mobilePadding;
    } else {
      effectivePadding = padding;
    }
    
    EdgeInsets? effectiveMargin;
    if (config.isDesktop && desktopMargin != null) {
      effectiveMargin = desktopMargin;
    } else if (config.isTablet && tabletMargin != null) {
      effectiveMargin = tabletMargin;
    } else if (config.isMobile && mobileMargin != null) {
      effectiveMargin = mobileMargin;
    } else {
      effectiveMargin = margin;
    }
    
    Widget result = child;
    
    if (effectivePadding != null) {
      result = Padding(
        padding: effectivePadding,
        child: result,
      );
    }
    
    if (effectiveMargin != null) {
      result = Padding(
        padding: effectiveMargin,
        child: result,
      );
    }
    
    return result;
  }
}
