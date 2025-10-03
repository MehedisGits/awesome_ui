import 'package:flutter/material.dart';

/// Breakpoint utilities for responsive design.
class BreakpointUtils {
  const BreakpointUtils._();

  /// Breakpoint definitions
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double largeDesktop = 1800;

  /// Get current breakpoint based on screen width
  static String getBreakpoint(double width) {
    if (width < mobile) {
      return 'mobile';
    } else if (width < tablet) {
      return 'tablet';
    } else if (width < desktop) {
      return 'desktop';
    } else {
      return 'largeDesktop';
    }
  }

  /// Get current breakpoint from context
  static String getBreakpointFromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getBreakpoint(width);
  }

  /// Check if current breakpoint is mobile
  static bool isMobile(double width) => width < mobile;

  /// Check if current breakpoint is tablet
  static bool isTablet(double width) => width >= mobile && width < tablet;

  /// Check if current breakpoint is desktop
  static bool isDesktop(double width) => width >= tablet && width < desktop;

  /// Check if current breakpoint is large desktop
  static bool isLargeDesktop(double width) => width >= desktop;

  /// Get responsive value based on breakpoint
  static T getResponsiveValue<T>({
    required T mobile,
    required T tablet,
    required T desktop,
    required T largeDesktop,
    required double width,
  }) {
    if (width < BreakpointUtils.mobile) {
      return mobile;
    } else if (width < BreakpointUtils.tablet) {
      return tablet;
    } else if (width < BreakpointUtils.desktop) {
      return desktop;
    } else {
      return largeDesktop;
    }
  }

  /// Get responsive value from context
  static T getResponsiveValueFromContext<T>({
    required T mobile,
    required T tablet,
    required T desktop,
    required T largeDesktop,
    required BuildContext context,
  }) {
    final width = MediaQuery.of(context).size.width;
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive padding based on breakpoint
  static EdgeInsets getResponsivePadding({
    required EdgeInsets mobile,
    required EdgeInsets tablet,
    required EdgeInsets desktop,
    required EdgeInsets largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive margin based on breakpoint
  static EdgeInsets getResponsiveMargin({
    required EdgeInsets mobile,
    required EdgeInsets tablet,
    required EdgeInsets desktop,
    required EdgeInsets largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive font size based on breakpoint
  static double getResponsiveFontSize({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive spacing based on breakpoint
  static double getResponsiveSpacing({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive border radius based on breakpoint
  static BorderRadius getResponsiveBorderRadius({
    required BorderRadius mobile,
    required BorderRadius tablet,
    required BorderRadius desktop,
    required BorderRadius largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive elevation based on breakpoint
  static double getResponsiveElevation({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive column count based on breakpoint
  static int getResponsiveColumnCount({
    required int mobile,
    required int tablet,
    required int desktop,
    required int largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive aspect ratio based on breakpoint
  static double getResponsiveAspectRatio({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive max width based on breakpoint
  static double getResponsiveMaxWidth({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive min width based on breakpoint
  static double getResponsiveMinWidth({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive max height based on breakpoint
  static double getResponsiveMaxHeight({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive min height based on breakpoint
  static double getResponsiveMinHeight({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive opacity based on breakpoint
  static double getResponsiveOpacity({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive scale based on breakpoint
  static double getResponsiveScale({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive rotation based on breakpoint
  static double getResponsiveRotation({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive alignment based on breakpoint
  static Alignment getResponsiveAlignment({
    required Alignment mobile,
    required Alignment tablet,
    required Alignment desktop,
    required Alignment largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive text alignment based on breakpoint
  static TextAlign getResponsiveTextAlignment({
    required TextAlign mobile,
    required TextAlign tablet,
    required TextAlign desktop,
    required TextAlign largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive main axis alignment based on breakpoint
  static MainAxisAlignment getResponsiveMainAxisAlignment({
    required MainAxisAlignment mobile,
    required MainAxisAlignment tablet,
    required MainAxisAlignment desktop,
    required MainAxisAlignment largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive cross axis alignment based on breakpoint
  static CrossAxisAlignment getResponsiveCrossAxisAlignment({
    required CrossAxisAlignment mobile,
    required CrossAxisAlignment tablet,
    required CrossAxisAlignment desktop,
    required CrossAxisAlignment largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive main axis size based on breakpoint
  static MainAxisSize getResponsiveMainAxisSize({
    required MainAxisSize mobile,
    required MainAxisSize tablet,
    required MainAxisSize desktop,
    required MainAxisSize largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive wrap alignment based on breakpoint
  static WrapAlignment getResponsiveWrapAlignment({
    required WrapAlignment mobile,
    required WrapAlignment tablet,
    required WrapAlignment desktop,
    required WrapAlignment largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

  /// Get responsive wrap cross alignment based on breakpoint
  static WrapCrossAlignment getResponsiveWrapCrossAlignment({
    required WrapCrossAlignment mobile,
    required WrapCrossAlignment tablet,
    required WrapCrossAlignment desktop,
    required WrapCrossAlignment largeDesktop,
    required double width,
  }) {
    return getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: width,
    );
  }

}
