import 'package:flutter/material.dart';
import 'breakpoint_utils.dart';

/// Responsive builder widget for creating responsive layouts.
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.builder,
    this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  final Widget Function(BuildContext context, String breakpoint) builder;
  final Widget Function(BuildContext context)? mobile;
  final Widget Function(BuildContext context)? tablet;
  final Widget Function(BuildContext context)? desktop;
  final Widget Function(BuildContext context)? largeDesktop;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointUtils.getBreakpointFromContext(context);
    
    switch (breakpoint) {
      case 'mobile':
        return mobile?.call(context) ?? builder(context, breakpoint);
      case 'tablet':
        return tablet?.call(context) ?? builder(context, breakpoint);
      case 'desktop':
        return desktop?.call(context) ?? builder(context, breakpoint);
      case 'largeDesktop':
        return largeDesktop?.call(context) ?? builder(context, breakpoint);
      default:
        return builder(context, breakpoint);
    }
  }
}

/// Responsive value widget for creating responsive values.
class ResponsiveValue<T> extends StatelessWidget {
  const ResponsiveValue({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.builder,
  });

  final T mobile;
  final T tablet;
  final T desktop;
  final T largeDesktop;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointUtils.getBreakpointFromContext(context);
    final value = BreakpointUtils.getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return builder(context, value);
  }
}

/// Responsive padding widget for creating responsive padding.
class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final EdgeInsets mobile;
  final EdgeInsets tablet;
  final EdgeInsets desktop;
  final EdgeInsets largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final padding = BreakpointUtils.getResponsivePadding(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Padding(
      padding: padding,
      child: child,
    );
  }
}

/// Responsive margin widget for creating responsive margins.
class ResponsiveMargin extends StatelessWidget {
  const ResponsiveMargin({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final EdgeInsets mobile;
  final EdgeInsets tablet;
  final EdgeInsets desktop;
  final EdgeInsets largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final margin = BreakpointUtils.getResponsiveMargin(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Container(
      margin: margin,
      child: child,
    );
  }
}

/// Responsive font size widget for creating responsive font sizes.
class ResponsiveFontSize extends StatelessWidget {
  const ResponsiveFontSize({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final fontSize = BreakpointUtils.getResponsiveFontSize(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return DefaultTextStyle(
      style: TextStyle(fontSize: fontSize),
      child: child,
    );
  }
}

/// Responsive spacing widget for creating responsive spacing.
class ResponsiveSpacing extends StatelessWidget {
  const ResponsiveSpacing({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final spacing = BreakpointUtils.getResponsiveSpacing(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return SizedBox(
      height: spacing,
      child: child,
    );
  }
}

/// Responsive border radius widget for creating responsive border radius.
class ResponsiveBorderRadius extends StatelessWidget {
  const ResponsiveBorderRadius({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final BorderRadius mobile;
  final BorderRadius tablet;
  final BorderRadius desktop;
  final BorderRadius largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BreakpointUtils.getResponsiveBorderRadius(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return ClipRRect(
      borderRadius: borderRadius,
      child: child,
    );
  }
}

/// Responsive elevation widget for creating responsive elevation.
class ResponsiveElevation extends StatelessWidget {
  const ResponsiveElevation({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final elevation = BreakpointUtils.getResponsiveElevation(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Material(
      elevation: elevation,
      child: child,
    );
  }
}

/// Responsive column count widget for creating responsive column counts.
class ResponsiveColumnCount extends StatelessWidget {
  const ResponsiveColumnCount({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.builder,
  });

  final int mobile;
  final int tablet;
  final int desktop;
  final int largeDesktop;
  final Widget Function(BuildContext context, int columnCount) builder;

  @override
  Widget build(BuildContext context) {
    final columnCount = BreakpointUtils.getResponsiveColumnCount(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return builder(context, columnCount);
  }
}

/// Responsive aspect ratio widget for creating responsive aspect ratios.
class ResponsiveAspectRatio extends StatelessWidget {
  const ResponsiveAspectRatio({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final aspectRatio = BreakpointUtils.getResponsiveAspectRatio(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: child,
    );
  }
}

/// Responsive max width widget for creating responsive max widths.
class ResponsiveMaxWidth extends StatelessWidget {
  const ResponsiveMaxWidth({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final maxWidth = BreakpointUtils.getResponsiveMaxWidth(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: child,
    );
  }
}

/// Responsive min width widget for creating responsive min widths.
class ResponsiveMinWidth extends StatelessWidget {
  const ResponsiveMinWidth({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final minWidth = BreakpointUtils.getResponsiveMinWidth(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth),
      child: child,
    );
  }
}

/// Responsive max height widget for creating responsive max heights.
class ResponsiveMaxHeight extends StatelessWidget {
  const ResponsiveMaxHeight({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final maxHeight = BreakpointUtils.getResponsiveMaxHeight(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: child,
    );
  }
}

/// Responsive min height widget for creating responsive min heights.
class ResponsiveMinHeight extends StatelessWidget {
  const ResponsiveMinHeight({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final minHeight = BreakpointUtils.getResponsiveMinHeight(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: child,
    );
  }
}

/// Responsive opacity widget for creating responsive opacity.
class ResponsiveOpacity extends StatelessWidget {
  const ResponsiveOpacity({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final opacity = BreakpointUtils.getResponsiveOpacity(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Opacity(
      opacity: opacity,
      child: child,
    );
  }
}

/// Responsive scale widget for creating responsive scale.
class ResponsiveScale extends StatelessWidget {
  const ResponsiveScale({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scale = BreakpointUtils.getResponsiveScale(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Transform.scale(
      scale: scale,
      child: child,
    );
  }
}

/// Responsive rotation widget for creating responsive rotation.
class ResponsiveRotation extends StatelessWidget {
  const ResponsiveRotation({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final double mobile;
  final double tablet;
  final double desktop;
  final double largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final rotation = BreakpointUtils.getResponsiveRotation(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Transform.rotate(
      angle: rotation,
      child: child,
    );
  }
}

/// Responsive alignment widget for creating responsive alignment.
class ResponsiveAlignment extends StatelessWidget {
  const ResponsiveAlignment({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final Alignment mobile;
  final Alignment tablet;
  final Alignment desktop;
  final Alignment largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final alignment = BreakpointUtils.getResponsiveAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Align(
      alignment: alignment,
      child: child,
    );
  }
}

/// Responsive text alignment widget for creating responsive text alignment.
class ResponsiveTextAlignment extends StatelessWidget {
  const ResponsiveTextAlignment({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final TextAlign mobile;
  final TextAlign tablet;
  final TextAlign desktop;
  final TextAlign largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textAlign = BreakpointUtils.getResponsiveTextAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return DefaultTextStyle(
      style: TextStyle(),
      textAlign: textAlign,
      child: child,
    );
  }
}

/// Responsive main axis alignment widget for creating responsive main axis alignment.
class ResponsiveMainAxisAlignment extends StatelessWidget {
  const ResponsiveMainAxisAlignment({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final MainAxisAlignment mobile;
  final MainAxisAlignment tablet;
  final MainAxisAlignment desktop;
  final MainAxisAlignment largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mainAxisAlignment = BreakpointUtils.getResponsiveMainAxisAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [child],
    );
  }
}

/// Responsive cross axis alignment widget for creating responsive cross axis alignment.
class ResponsiveCrossAxisAlignment extends StatelessWidget {
  const ResponsiveCrossAxisAlignment({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final CrossAxisAlignment mobile;
  final CrossAxisAlignment tablet;
  final CrossAxisAlignment desktop;
  final CrossAxisAlignment largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final crossAxisAlignment = BreakpointUtils.getResponsiveCrossAxisAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [child],
    );
  }
}

/// Responsive main axis size widget for creating responsive main axis size.
class ResponsiveMainAxisSize extends StatelessWidget {
  const ResponsiveMainAxisSize({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final MainAxisSize mobile;
  final MainAxisSize tablet;
  final MainAxisSize desktop;
  final MainAxisSize largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mainAxisSize = BreakpointUtils.getResponsiveMainAxisSize(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Column(
      mainAxisSize: mainAxisSize,
      children: [child],
    );
  }
}

/// Responsive wrap alignment widget for creating responsive wrap alignment.
class ResponsiveWrapAlignment extends StatelessWidget {
  const ResponsiveWrapAlignment({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final WrapAlignment mobile;
  final WrapAlignment tablet;
  final WrapAlignment desktop;
  final WrapAlignment largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final wrapAlignment = BreakpointUtils.getResponsiveWrapAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Wrap(
      alignment: wrapAlignment,
      children: [child],
    );
  }
}

/// Responsive wrap cross alignment widget for creating responsive wrap cross alignment.
class ResponsiveWrapCrossAlignment extends StatelessWidget {
  const ResponsiveWrapCrossAlignment({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
    required this.child,
  });

  final WrapCrossAlignment mobile;
  final WrapCrossAlignment tablet;
  final WrapCrossAlignment desktop;
  final WrapCrossAlignment largeDesktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final wrapCrossAlignment = BreakpointUtils.getResponsiveWrapCrossAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
    
    return Wrap(
      crossAxisAlignment: wrapCrossAlignment,
      children: [child],
    );
  }
}
