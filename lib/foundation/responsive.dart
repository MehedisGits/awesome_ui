import 'package:flutter/material.dart';

/// Responsive breakpoint system for awesome_ui
/// 
/// Breakpoints:
/// - xs: < 600px (mobile portrait)
/// - sm: 600px - 839px (mobile landscape, small tablet)
/// - md: 840px - 1199px (tablet)
/// - lg: 1200px - 1599px (desktop)
/// - xl: >= 1600px (large desktop)
class AuiBreakpoints {
  static const double xs = 600;
  static const double sm = 840;
  static const double md = 1200;
  static const double lg = 1600;
  
  /// Get current breakpoint based on screen width
  static AuiBreakpoint getBreakpoint(double width) {
    if (width < xs) return AuiBreakpoint.xs;
    if (width < sm) return AuiBreakpoint.sm;
    if (width < md) return AuiBreakpoint.md;
    if (width < lg) return AuiBreakpoint.lg;
    return AuiBreakpoint.xl;
  }
  
  /// Check if current width matches breakpoint
  static bool isBreakpoint(double width, AuiBreakpoint breakpoint) {
    return getBreakpoint(width) == breakpoint;
  }
  
  /// Check if current width is at least the given breakpoint
  static bool isAtLeast(double width, AuiBreakpoint breakpoint) {
    final current = getBreakpoint(width);
    return current.index >= breakpoint.index;
  }
  
  /// Check if current width is at most the given breakpoint
  static bool isAtMost(double width, AuiBreakpoint breakpoint) {
    final current = getBreakpoint(width);
    return current.index <= breakpoint.index;
  }
}

/// Breakpoint enum for type safety
enum AuiBreakpoint {
  xs, sm, md, lg, xl
}

/// Responsive value that changes based on breakpoint
class AuiResponsiveValue<T> {
  const AuiResponsiveValue({
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });
  
  final T xs;
  final T? sm;
  final T? md;
  final T? lg;
  final T? xl;
  
  /// Get value for current breakpoint
  T value(AuiBreakpoint breakpoint) {
    switch (breakpoint) {
      case AuiBreakpoint.xs:
        return xs;
      case AuiBreakpoint.sm:
        return sm ?? xs;
      case AuiBreakpoint.md:
        return md ?? sm ?? xs;
      case AuiBreakpoint.lg:
        return lg ?? md ?? sm ?? xs;
      case AuiBreakpoint.xl:
        return xl ?? lg ?? md ?? sm ?? xs;
    }
  }
  
  /// Get value for current screen width
  T valueForWidth(double width) {
    return value(AuiBreakpoints.getBreakpoint(width));
  }
}

/// Responsive wrapper widget
class AuiResponsive extends StatelessWidget {
  const AuiResponsive({
    super.key,
    required this.builder,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });
  
  final Widget Function(BuildContext context, AuiBreakpoint breakpoint) builder;
  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final breakpoint = AuiBreakpoints.getBreakpoint(constraints.maxWidth);
        return builder(context, breakpoint);
      },
    );
  }
}

/// Show widget only on specific breakpoints
class AuiShow extends StatelessWidget {
  const AuiShow({
    super.key,
    required this.child,
    this.xs = true,
    this.sm = true,
    this.md = true,
    this.lg = true,
    this.xl = true,
  });
  
  final Widget child;
  final bool xs;
  final bool sm;
  final bool md;
  final bool lg;
  final bool xl;
  
  @override
  Widget build(BuildContext context) {
    return AuiResponsive(
      builder: (context, breakpoint) {
        bool shouldShow;
        switch (breakpoint) {
          case AuiBreakpoint.xs:
            shouldShow = xs;
            break;
          case AuiBreakpoint.sm:
            shouldShow = sm;
            break;
          case AuiBreakpoint.md:
            shouldShow = md;
            break;
          case AuiBreakpoint.lg:
            shouldShow = lg;
            break;
          case AuiBreakpoint.xl:
            shouldShow = xl;
            break;
        }
        
        return shouldShow ? child : const SizedBox.shrink();
      },
    );
  }
}

/// Hide widget on specific breakpoints
class AuiHide extends StatelessWidget {
  const AuiHide({
    super.key,
    required this.child,
    this.xs = false,
    this.sm = false,
    this.md = false,
    this.lg = false,
    this.xl = false,
  });
  
  final Widget child;
  final bool xs;
  final bool sm;
  final bool md;
  final bool lg;
  final bool xl;
  
  @override
  Widget build(BuildContext context) {
    return AuiResponsive(
      builder: (context, breakpoint) {
        bool shouldHide;
        switch (breakpoint) {
          case AuiBreakpoint.xs:
            shouldHide = xs;
            break;
          case AuiBreakpoint.sm:
            shouldHide = sm;
            break;
          case AuiBreakpoint.md:
            shouldHide = md;
            break;
          case AuiBreakpoint.lg:
            shouldHide = lg;
            break;
          case AuiBreakpoint.xl:
            shouldHide = xl;
            break;
        }
        
        return shouldHide ? const SizedBox.shrink() : child;
      },
    );
  }
}

/// Responsive grid columns
class AuiGridColumns {
  static const int xs = 4;
  static const int sm = 6;
  static const int md = 8;
  static const int lg = 12;
  static const int xl = 16;
  
  static int getColumns(AuiBreakpoint breakpoint) {
    switch (breakpoint) {
      case AuiBreakpoint.xs:
        return xs;
      case AuiBreakpoint.sm:
        return sm;
      case AuiBreakpoint.md:
        return md;
      case AuiBreakpoint.lg:
        return lg;
      case AuiBreakpoint.xl:
        return xl;
    }
  }
}

/// Extension for easy breakpoint checking
extension AuiBreakpointExtension on BuildContext {
  AuiBreakpoint get breakpoint {
    final width = MediaQuery.of(this).size.width;
    return AuiBreakpoints.getBreakpoint(width);
  }
  
  bool isBreakpoint(AuiBreakpoint breakpoint) {
    return this.breakpoint == breakpoint;
  }
  
  bool isAtLeast(AuiBreakpoint breakpoint) {
    final width = MediaQuery.of(this).size.width;
    return AuiBreakpoints.isAtLeast(width, breakpoint);
  }
  
  bool isAtMost(AuiBreakpoint breakpoint) {
    final width = MediaQuery.of(this).size.width;
    return AuiBreakpoints.isAtMost(width, breakpoint);
  }
  
  bool get isMobile => isAtMost(AuiBreakpoint.sm);
  bool get isTablet => isBreakpoint(AuiBreakpoint.md);
  bool get isDesktop => isAtLeast(AuiBreakpoint.lg);
}
