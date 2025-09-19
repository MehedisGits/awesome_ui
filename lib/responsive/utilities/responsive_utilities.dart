import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../breakpoints/responsive_breakpoints.dart';

/// Responsive utilities
class AuiResponsiveUtils {
  const AuiResponsiveUtils._();

  /// Get responsive value from context
  static T getValue<T>(BuildContext context, Map<AuiBreakpoint, T> values, {T? fallback}) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return AuiResponsiveBreakpoints.getValueWithFallback(
      config.width,
      values,
      fallback ?? values.values.last,
    );
  }

  /// Get responsive interpolated value from context
  static double getInterpolatedValue(BuildContext context, Map<AuiBreakpoint, double> values) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return AuiResponsiveBreakpoints.getInterpolatedValue(config.width, values);
  }

  /// Get responsive spacing from context
  static double getSpacing(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive font size from context
  static double getFontSize(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive padding from context
  static EdgeInsets getPadding(BuildContext context, Map<AuiBreakpoint, EdgeInsets> values) {
    return getValue(context, values);
  }

  /// Get responsive margin from context
  static EdgeInsets getMargin(BuildContext context, Map<AuiBreakpoint, EdgeInsets> values) {
    return getValue(context, values);
  }

  /// Get responsive border radius from context
  static BorderRadius getBorderRadius(BuildContext context, Map<AuiBreakpoint, BorderRadius> values) {
    return getValue(context, values);
  }

  /// Get responsive elevation from context
  static double getElevation(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive icon size from context
  static double getIconSize(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive width from context
  static double getWidth(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive height from context
  static double getHeight(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive columns from context
  static int getColumns(BuildContext context, Map<AuiBreakpoint, int> values) {
    return getValue(context, values);
  }

  /// Get responsive rows from context
  static int getRows(BuildContext context, Map<AuiBreakpoint, int> values) {
    return getValue(context, values);
  }

  /// Get responsive aspect ratio from context
  static double getAspectRatio(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive opacity from context
  static double getOpacity(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive scale from context
  static double getScale(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive rotation from context
  static double getRotation(BuildContext context, Map<AuiBreakpoint, double> values) {
    return getInterpolatedValue(context, values);
  }

  /// Get responsive translation from context
  static Offset getTranslation(BuildContext context, Map<AuiBreakpoint, Offset> values) {
    return getValue(context, values);
  }

  /// Get responsive color from context
  static Color getColor(BuildContext context, Map<AuiBreakpoint, Color> values) {
    return getValue(context, values);
  }

  /// Get responsive gradient from context
  static Gradient getGradient(BuildContext context, Map<AuiBreakpoint, Gradient> values) {
    return getValue(context, values);
  }

  /// Get responsive text style from context
  static TextStyle getTextStyle(BuildContext context, Map<AuiBreakpoint, TextStyle> values) {
    return getValue(context, values);
  }

  /// Get responsive box decoration from context
  static BoxDecoration getBoxDecoration(BuildContext context, Map<AuiBreakpoint, BoxDecoration> values) {
    return getValue(context, values);
  }

  /// Get responsive shape border from context
  static ShapeBorder getShapeBorder(BuildContext context, Map<AuiBreakpoint, ShapeBorder> values) {
    return getValue(context, values);
  }

  /// Get responsive border from context
  static Border getBorder(BuildContext context, Map<AuiBreakpoint, Border> values) {
    return getValue(context, values);
  }

  /// Get responsive box shadow from context
  static List<BoxShadow> getBoxShadow(BuildContext context, Map<AuiBreakpoint, List<BoxShadow>> values) {
    return getValue(context, values);
  }

  /// Get responsive animation duration from context
  static Duration getAnimationDuration(BuildContext context, Map<AuiBreakpoint, Duration> values) {
    return getValue(context, values);
  }

  /// Get responsive animation curve from context
  static Curve getAnimationCurve(BuildContext context, Map<AuiBreakpoint, Curve> values) {
    return getValue(context, values);
  }

  /// Get responsive scroll physics from context
  static ScrollPhysics getScrollPhysics(BuildContext context, Map<AuiBreakpoint, ScrollPhysics> values) {
    return getValue(context, values);
  }

  /// Get responsive clip behavior from context
  static Clip getClipBehavior(BuildContext context, Map<AuiBreakpoint, Clip> values) {
    return getValue(context, values);
  }

  /// Get responsive alignment from context
  static Alignment getAlignment(BuildContext context, Map<AuiBreakpoint, Alignment> values) {
    return getValue(context, values);
  }

  /// Get responsive main axis alignment from context
  static MainAxisAlignment getMainAxisAlignment(BuildContext context, Map<AuiBreakpoint, MainAxisAlignment> values) {
    return getValue(context, values);
  }

  /// Get responsive cross axis alignment from context
  static CrossAxisAlignment getCrossAxisAlignment(BuildContext context, Map<AuiBreakpoint, CrossAxisAlignment> values) {
    return getValue(context, values);
  }

  /// Get responsive main axis size from context
  static MainAxisSize getMainAxisSize(BuildContext context, Map<AuiBreakpoint, MainAxisSize> values) {
    return getValue(context, values);
  }

  /// Get responsive text direction from context
  static TextDirection getTextDirection(BuildContext context, Map<AuiBreakpoint, TextDirection> values) {
    return getValue(context, values);
  }

  /// Get responsive text align from context
  static TextAlign getTextAlign(BuildContext context, Map<AuiBreakpoint, TextAlign> values) {
    return getValue(context, values);
  }

  /// Get responsive text overflow from context
  static TextOverflow getTextOverflow(BuildContext context, Map<AuiBreakpoint, TextOverflow> values) {
    return getValue(context, values);
  }

  /// Get responsive max lines from context
  static int? getMaxLines(BuildContext context, Map<AuiBreakpoint, int?> values) {
    return getValue(context, values);
  }

  /// Get responsive flex from context
  static int getFlex(BuildContext context, Map<AuiBreakpoint, int> values) {
    return getValue(context, values);
  }

  /// Get responsive expanded from context
  static bool getExpanded(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive flexible from context
  static bool getFlexible(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive shrink wrap from context
  static bool getShrinkWrap(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive reverse from context
  static bool getReverse(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive primary from context
  static bool getPrimary(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive enabled from context
  static bool getEnabled(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive visible from context
  static bool getVisible(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive selected from context
  static bool getSelected(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive focused from context
  static bool getFocused(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive hovered from context
  static bool getHovered(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive pressed from context
  static bool getPressed(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive disabled from context
  static bool getDisabled(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive loading from context
  static bool getLoading(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive error from context
  static bool getError(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive success from context
  static bool getSuccess(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive warning from context
  static bool getWarning(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive info from context
  static bool getInfo(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive debug from context
  static bool getDebug(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive trace from context
  static bool getTrace(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive verbose from context
  static bool getVerbose(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive all from context
  static bool getAll(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive off from context
  static bool getOff(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive fatal from context
  static bool getFatal(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive severe from context
  static bool getSevere(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive fine from context
  static bool getFine(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive finer from context
  static bool getFiner(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive finest from context
  static bool getFinest(BuildContext context, Map<AuiBreakpoint, bool> values) {
    return getValue(context, values);
  }

  /// Get responsive config from context
  static AuiResponsiveConfig getConfig(BuildContext context) {
    return AuiResponsiveBreakpoints.getConfig(context);
  }

  /// Get responsive breakpoint from context
  static AuiBreakpoint getBreakpoint(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.currentBreakpoint;
  }

  /// Get responsive device type from context
  static AuiDeviceType getDeviceType(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.deviceType;
  }

  /// Get responsive orientation from context
  static AuiOrientation getOrientation(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.orientation;
  }

  /// Check if context is mobile
  static bool isMobile(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isMobile;
  }

  /// Check if context is tablet
  static bool isTablet(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isTablet;
  }

  /// Check if context is desktop
  static bool isDesktop(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isDesktop;
  }

  /// Check if context is watch
  static bool isWatch(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isWatch;
  }

  /// Check if context is tv
  static bool isTv(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isTv;
  }

  /// Check if context is portrait
  static bool isPortrait(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isPortrait;
  }

  /// Check if context is landscape
  static bool isLandscape(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isLandscape;
  }

  /// Check if context is at least breakpoint
  static bool isAtLeast(BuildContext context, AuiBreakpoint breakpoint) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isAtLeast(breakpoint);
  }

  /// Check if context is at most breakpoint
  static bool isAtMost(BuildContext context, AuiBreakpoint breakpoint) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isAtMost(breakpoint);
  }

  /// Check if context is between breakpoints
  static bool isBetween(BuildContext context, AuiBreakpoint min, AuiBreakpoint max) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.isBetween(min, max);
  }

  /// Get responsive width from context
  static double getScreenWidth(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.width;
  }

  /// Get responsive height from context
  static double getScreenHeight(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.height;
  }

  /// Get responsive aspect ratio from context
  static double getScreenAspectRatio(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.aspectRatio;
  }

  /// Get responsive pixel ratio from context
  static double getPixelRatio(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.pixelRatio;
  }

  /// Get responsive text scale factor from context
  static double getTextScaleFactor(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.textScaleFactor;
  }

  /// Get responsive platform brightness from context
  static Brightness getPlatformBrightness(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformBrightness;
  }

  /// Get responsive platform locale from context
  static Locale getPlatformLocale(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformLocale;
  }

  /// Get responsive platform text direction from context
  static TextDirection getPlatformTextDirection(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformTextDirection;
  }

  /// Get responsive platform padding from context
  static EdgeInsets getPlatformPadding(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformPadding;
  }

  /// Get responsive platform view insets from context
  static EdgeInsets getPlatformViewInsets(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformViewInsets;
  }

  /// Get responsive platform view padding from context
  static EdgeInsets getPlatformViewPadding(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformViewPadding;
  }

  /// Get responsive platform gesture settings from context
  static DeviceGestureSettings? getPlatformGestureSettings(BuildContext context) {
    // final config = AuiResponsiveBreakpoints.getConfig(context);
    // return config.platformGestureSettings;
    return null;
  }

  /// Get responsive platform accessibility features from context
  static AccessibilityFeatures? getPlatformAccessibilityFeatures(BuildContext context) {
    // final config = AuiResponsiveBreakpoints.getConfig(context);
    // return config.platformAccessibilityFeatures;
    return null;
  }

  /// Check if platform disables animations
  static bool isPlatformDisableAnimations(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformDisableAnimations;
  }

  /// Check if platform inverts colors
  static bool isPlatformInvertColors(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformInvertColors;
  }

  /// Check if platform has high contrast
  static bool isPlatformHighContrast(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformHighContrast;
  }

  /// Check if platform has on/off switch labels
  static bool isPlatformOnOffSwitchLabels(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformOnOffSwitchLabels;
  }

  /// Check if platform reduces motion
  static bool isPlatformReduceMotion(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformReduceMotion;
  }

  /// Check if platform has bold text
  static bool isPlatformBoldText(BuildContext context) {
    final config = AuiResponsiveBreakpoints.getConfig(context);
    return config.platformBoldText;
  }
}
