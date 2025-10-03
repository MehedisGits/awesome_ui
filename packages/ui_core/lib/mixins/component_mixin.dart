import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import '../adapters/platform_style.dart';
import '../theme/app_style_scope.dart';
import '../responsive/breakpoint_utils.dart';

/// Base mixin for components that need platform-specific behavior.
mixin ComponentMixin<T extends StatefulWidget> on State<T> {
  /// Get the current platform style
  PlatformStyle get platformStyle => AppStyleScope.of(context).platformStyle;

  /// Get the current colors
  AppColors get colors => AppStyleScope.of(context).colors;

  /// Get the current typography
  AppTypography get typography => AppStyleScope.of(context).typography;

  /// Get the current spacing
  AppSpacing get spacing => AppStyleScope.of(context).spacing;

  /// Get the current radius
  AppRadius get radius => AppStyleScope.of(context).radius;

  /// Get the current elevation
  AppElevation get elevation => AppStyleScope.of(context).elevation;

  /// Get the current motion
  AppMotion get motion => AppStyleScope.of(context).motion;

  /// Check if the current platform is Material
  bool get isMaterial => platformStyle == PlatformStyle.material;

  /// Check if the current platform is Cupertino
  bool get isCupertino => platformStyle == PlatformStyle.cupertino;

  /// Check if the current platform is Web
  bool get isWeb => platformStyle == PlatformStyle.web;

  /// Check if the current platform is Adaptive
  bool get isAdaptive => platformStyle == PlatformStyle.adaptive;

  /// Get the resolved platform style
  PlatformStyle get resolvedPlatformStyle {
    if (platformStyle == PlatformStyle.adaptive) {
      return PlatformStyleUtils.getCurrentPlatformStyle();
    }
    return platformStyle;
  }

  /// Get the current breakpoint
  String get breakpoint => BreakpointUtils.getBreakpointFromContext(context);

  /// Check if the current breakpoint is mobile
  bool get isMobile => BreakpointUtils.isMobile(MediaQuery.of(context).size.width);

  /// Check if the current breakpoint is tablet
  bool get isTablet => BreakpointUtils.isTablet(MediaQuery.of(context).size.width);

  /// Check if the current breakpoint is desktop
  bool get isDesktop => BreakpointUtils.isDesktop(MediaQuery.of(context).size.width);

  /// Check if the current breakpoint is large desktop
  bool get isLargeDesktop => BreakpointUtils.isLargeDesktop(MediaQuery.of(context).size.width);

  /// Get responsive value based on breakpoint
  T getResponsiveValue<T>({
    required T mobile,
    required T tablet,
    required T desktop,
    required T largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive padding based on breakpoint
  EdgeInsets getResponsivePadding({
    required EdgeInsets mobile,
    required EdgeInsets tablet,
    required EdgeInsets desktop,
    required EdgeInsets largeDesktop,
  }) {
    return BreakpointUtils.getResponsivePadding(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive margin based on breakpoint
  EdgeInsets getResponsiveMargin({
    required EdgeInsets mobile,
    required EdgeInsets tablet,
    required EdgeInsets desktop,
    required EdgeInsets largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveMargin(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive font size based on breakpoint
  double getResponsiveFontSize({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveFontSize(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive spacing based on breakpoint
  double getResponsiveSpacing({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveSpacing(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive border radius based on breakpoint
  BorderRadius getResponsiveBorderRadius({
    required BorderRadius mobile,
    required BorderRadius tablet,
    required BorderRadius desktop,
    required BorderRadius largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveBorderRadius(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive elevation based on breakpoint
  double getResponsiveElevation({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveElevation(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive column count based on breakpoint
  int getResponsiveColumnCount({
    required int mobile,
    required int tablet,
    required int desktop,
    required int largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveColumnCount(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive aspect ratio based on breakpoint
  double getResponsiveAspectRatio({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveAspectRatio(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive max width based on breakpoint
  double getResponsiveMaxWidth({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveMaxWidth(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive min width based on breakpoint
  double getResponsiveMinWidth({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveMinWidth(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive max height based on breakpoint
  double getResponsiveMaxHeight({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveMaxHeight(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive min height based on breakpoint
  double getResponsiveMinHeight({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveMinHeight(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive opacity based on breakpoint
  double getResponsiveOpacity({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveOpacity(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive scale based on breakpoint
  double getResponsiveScale({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveScale(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive rotation based on breakpoint
  double getResponsiveRotation({
    required double mobile,
    required double tablet,
    required double desktop,
    required double largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveRotation(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive alignment based on breakpoint
  Alignment getResponsiveAlignment({
    required Alignment mobile,
    required Alignment tablet,
    required Alignment desktop,
    required Alignment largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive text alignment based on breakpoint
  TextAlign getResponsiveTextAlignment({
    required TextAlign mobile,
    required TextAlign tablet,
    required TextAlign desktop,
    required TextAlign largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveTextAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive main axis alignment based on breakpoint
  MainAxisAlignment getResponsiveMainAxisAlignment({
    required MainAxisAlignment mobile,
    required MainAxisAlignment tablet,
    required MainAxisAlignment desktop,
    required MainAxisAlignment largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveMainAxisAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive cross axis alignment based on breakpoint
  CrossAxisAlignment getResponsiveCrossAxisAlignment({
    required CrossAxisAlignment mobile,
    required CrossAxisAlignment tablet,
    required CrossAxisAlignment desktop,
    required CrossAxisAlignment largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveCrossAxisAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive main axis size based on breakpoint
  MainAxisSize getResponsiveMainAxisSize({
    required MainAxisSize mobile,
    required MainAxisSize tablet,
    required MainAxisSize desktop,
    required MainAxisSize largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveMainAxisSize(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive wrap alignment based on breakpoint
  WrapAlignment getResponsiveWrapAlignment({
    required WrapAlignment mobile,
    required WrapAlignment tablet,
    required WrapAlignment desktop,
    required WrapAlignment largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveWrapAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Get responsive wrap cross alignment based on breakpoint
  WrapCrossAlignment getResponsiveWrapCrossAlignment({
    required WrapCrossAlignment mobile,
    required WrapCrossAlignment tablet,
    required WrapCrossAlignment desktop,
    required WrapCrossAlignment largeDesktop,
  }) {
    return BreakpointUtils.getResponsiveWrapCrossAlignment(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      width: MediaQuery.of(context).size.width,
    );
  }
}
