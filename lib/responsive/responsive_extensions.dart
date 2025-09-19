import 'package:flutter/material.dart';
import 'breakpoints/responsive_breakpoints.dart';
import 'utilities/responsive_utilities.dart';

/// Responsive extensions for BuildContext
extension AuiResponsiveContext on BuildContext {
  /// Get responsive configuration
  AuiResponsiveConfig get auiResponsive => AuiResponsiveBreakpoints.getConfig(this);
  
  /// Get current breakpoint
  AuiBreakpoint get auiBreakpoint => auiResponsive.currentBreakpoint;
  
  /// Get device type
  AuiDeviceType get auiDeviceType => auiResponsive.deviceType;
  
  /// Get orientation
  AuiOrientation get auiOrientation => auiResponsive.orientation;
  
  /// Check if mobile
  bool get auiIsMobile => auiResponsive.isMobile;
  
  /// Check if tablet
  bool get auiIsTablet => auiResponsive.isTablet;
  
  /// Check if desktop
  bool get auiIsDesktop => auiResponsive.isDesktop;
  
  /// Check if watch
  bool get auiIsWatch => auiResponsive.isWatch;
  
  /// Check if tv
  bool get auiIsTv => auiResponsive.isTv;
  
  /// Check if portrait
  bool get auiIsPortrait => auiResponsive.isPortrait;
  
  /// Check if landscape
  bool get auiIsLandscape => auiResponsive.isLandscape;
  
  /// Get screen width
  double get auiScreenWidth => auiResponsive.width;
  
  /// Get screen height
  double get auiScreenHeight => auiResponsive.height;
  
  /// Get aspect ratio
  double get auiScreenAspectRatio => auiResponsive.aspectRatio;
  
  /// Get pixel ratio
  double get auiPixelRatio => auiResponsive.pixelRatio;
  
  /// Get text scale factor
  double get auiTextScaleFactor => auiResponsive.textScaleFactor;
  
  /// Get platform brightness
  Brightness get auiPlatformBrightness => auiResponsive.platformBrightness;
  
  /// Get platform locale
  Locale get auiPlatformLocale => auiResponsive.platformLocale;
  
  /// Get platform text direction
  TextDirection get auiPlatformTextDirection => auiResponsive.platformTextDirection;
  
  /// Get platform padding
  EdgeInsets get auiPlatformPadding => auiResponsive.platformPadding;
  
  /// Get platform view insets
  EdgeInsets get auiPlatformViewInsets => auiResponsive.platformViewInsets;
  
  /// Get platform view padding
  EdgeInsets get auiPlatformViewPadding => auiResponsive.platformViewPadding;
  
  /// Get platform gesture settings
  // DeviceGestureSettings get auiPlatformGestureSettings => auiResponsive.platformGestureSettings;
  
  /// Get platform accessibility features
  // AccessibilityFeatures get auiPlatformAccessibilityFeatures => auiResponsive.platformAccessibilityFeatures;
  
  /// Check if platform disables animations
  bool get auiPlatformDisableAnimations => auiResponsive.platformDisableAnimations;
  
  /// Check if platform inverts colors
  bool get auiPlatformInvertColors => auiResponsive.platformInvertColors;
  
  /// Check if platform has high contrast
  bool get auiPlatformHighContrast => auiResponsive.platformHighContrast;
  
  /// Check if platform has on/off switch labels
  bool get auiPlatformOnOffSwitchLabels => auiResponsive.platformOnOffSwitchLabels;
  
  /// Check if platform reduces motion
  bool get auiPlatformReduceMotion => auiResponsive.platformReduceMotion;
  
  /// Check if platform has bold text
  bool get auiPlatformBoldText => auiResponsive.platformBoldText;
  
  /// Check if at least breakpoint
  bool auiIsAtLeast(AuiBreakpoint breakpoint) => auiResponsive.isAtLeast(breakpoint);
  
  /// Check if at most breakpoint
  bool auiIsAtMost(AuiBreakpoint breakpoint) => auiResponsive.isAtMost(breakpoint);
  
  /// Check if between breakpoints
  bool auiIsBetween(AuiBreakpoint min, AuiBreakpoint max) => auiResponsive.isBetween(min, max);
  
  /// Get responsive value
  T auiValue<T>(Map<AuiBreakpoint, T> values, {T? fallback}) => 
      AuiResponsiveUtils.getValue(this, values, fallback: fallback);
  
  /// Get responsive interpolated value
  double auiInterpolatedValue(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getInterpolatedValue(this, values);
  
  /// Get responsive spacing
  double auiSpacing(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getSpacing(this, values);
  
  /// Get responsive font size
  double auiFontSize(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getFontSize(this, values);
  
  /// Get responsive padding
  EdgeInsets auiPadding(Map<AuiBreakpoint, EdgeInsets> values) => 
      AuiResponsiveUtils.getPadding(this, values);
  
  /// Get responsive margin
  EdgeInsets auiMargin(Map<AuiBreakpoint, EdgeInsets> values) => 
      AuiResponsiveUtils.getMargin(this, values);
  
  /// Get responsive border radius
  BorderRadius auiBorderRadius(Map<AuiBreakpoint, BorderRadius> values) => 
      AuiResponsiveUtils.getBorderRadius(this, values);
  
  /// Get responsive elevation
  double auiElevation(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getElevation(this, values);
  
  /// Get responsive icon size
  double auiIconSize(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getIconSize(this, values);
  
  /// Get responsive width
  double auiWidth(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getWidth(this, values);
  
  /// Get responsive height
  double auiHeight(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getHeight(this, values);
  
  /// Get responsive columns
  int auiColumns(Map<AuiBreakpoint, int> values) => 
      AuiResponsiveUtils.getColumns(this, values);
  
  /// Get responsive rows
  int auiRows(Map<AuiBreakpoint, int> values) => 
      AuiResponsiveUtils.getRows(this, values);
  
  /// Get responsive aspect ratio
  double auiAspectRatio(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getAspectRatio(this, values);
  
  /// Get responsive opacity
  double auiOpacity(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getOpacity(this, values);
  
  /// Get responsive scale
  double auiScale(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getScale(this, values);
  
  /// Get responsive rotation
  double auiRotation(Map<AuiBreakpoint, double> values) => 
      AuiResponsiveUtils.getRotation(this, values);
  
  /// Get responsive translation
  Offset auiTranslation(Map<AuiBreakpoint, Offset> values) => 
      AuiResponsiveUtils.getTranslation(this, values);
  
  /// Get responsive color
  Color auiColor(Map<AuiBreakpoint, Color> values) => 
      AuiResponsiveUtils.getColor(this, values);
  
  /// Get responsive gradient
  Gradient auiGradient(Map<AuiBreakpoint, Gradient> values) => 
      AuiResponsiveUtils.getGradient(this, values);
  
  /// Get responsive text style
  TextStyle auiTextStyle(Map<AuiBreakpoint, TextStyle> values) => 
      AuiResponsiveUtils.getTextStyle(this, values);
  
  /// Get responsive box decoration
  BoxDecoration auiBoxDecoration(Map<AuiBreakpoint, BoxDecoration> values) => 
      AuiResponsiveUtils.getBoxDecoration(this, values);
  
  /// Get responsive shape border
  ShapeBorder auiShapeBorder(Map<AuiBreakpoint, ShapeBorder> values) => 
      AuiResponsiveUtils.getShapeBorder(this, values);
  
  /// Get responsive border
  Border auiBorder(Map<AuiBreakpoint, Border> values) => 
      AuiResponsiveUtils.getBorder(this, values);
  
  /// Get responsive box shadow
  List<BoxShadow> auiBoxShadow(Map<AuiBreakpoint, List<BoxShadow>> values) => 
      AuiResponsiveUtils.getBoxShadow(this, values);
  
  /// Get responsive animation duration
  Duration auiAnimationDuration(Map<AuiBreakpoint, Duration> values) => 
      AuiResponsiveUtils.getAnimationDuration(this, values);
  
  /// Get responsive animation curve
  Curve auiAnimationCurve(Map<AuiBreakpoint, Curve> values) => 
      AuiResponsiveUtils.getAnimationCurve(this, values);
  
  /// Get responsive scroll physics
  ScrollPhysics auiScrollPhysics(Map<AuiBreakpoint, ScrollPhysics> values) => 
      AuiResponsiveUtils.getScrollPhysics(this, values);
  
  /// Get responsive clip behavior
  Clip auiClipBehavior(Map<AuiBreakpoint, Clip> values) => 
      AuiResponsiveUtils.getClipBehavior(this, values);
  
  /// Get responsive alignment
  Alignment auiAlignment(Map<AuiBreakpoint, Alignment> values) => 
      AuiResponsiveUtils.getAlignment(this, values);
  
  /// Get responsive main axis alignment
  MainAxisAlignment auiMainAxisAlignment(Map<AuiBreakpoint, MainAxisAlignment> values) => 
      AuiResponsiveUtils.getMainAxisAlignment(this, values);
  
  /// Get responsive cross axis alignment
  CrossAxisAlignment auiCrossAxisAlignment(Map<AuiBreakpoint, CrossAxisAlignment> values) => 
      AuiResponsiveUtils.getCrossAxisAlignment(this, values);
  
  /// Get responsive main axis size
  MainAxisSize auiMainAxisSize(Map<AuiBreakpoint, MainAxisSize> values) => 
      AuiResponsiveUtils.getMainAxisSize(this, values);
  
  /// Get responsive text direction
  TextDirection auiTextDirection(Map<AuiBreakpoint, TextDirection> values) => 
      AuiResponsiveUtils.getTextDirection(this, values);
  
  /// Get responsive text align
  TextAlign auiTextAlign(Map<AuiBreakpoint, TextAlign> values) => 
      AuiResponsiveUtils.getTextAlign(this, values);
  
  /// Get responsive text overflow
  TextOverflow auiTextOverflow(Map<AuiBreakpoint, TextOverflow> values) => 
      AuiResponsiveUtils.getTextOverflow(this, values);
  
  /// Get responsive max lines
  int? auiMaxLines(Map<AuiBreakpoint, int?> values) => 
      AuiResponsiveUtils.getMaxLines(this, values);
  
  /// Get responsive flex
  int auiFlex(Map<AuiBreakpoint, int> values) => 
      AuiResponsiveUtils.getFlex(this, values);
  
  /// Get responsive expanded
  bool auiExpanded(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getExpanded(this, values);
  
  /// Get responsive flexible
  bool auiFlexible(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getFlexible(this, values);
  
  /// Get responsive shrink wrap
  bool auiShrinkWrap(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getShrinkWrap(this, values);
  
  /// Get responsive reverse
  bool auiReverse(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getReverse(this, values);
  
  /// Get responsive primary
  bool auiPrimary(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getPrimary(this, values);
  
  /// Get responsive enabled
  bool auiEnabled(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getEnabled(this, values);
  
  /// Get responsive visible
  bool auiVisible(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getVisible(this, values);
  
  /// Get responsive selected
  bool auiSelected(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getSelected(this, values);
  
  /// Get responsive focused
  bool auiFocused(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getFocused(this, values);
  
  /// Get responsive hovered
  bool auiHovered(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getHovered(this, values);
  
  /// Get responsive pressed
  bool auiPressed(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getPressed(this, values);
  
  /// Get responsive disabled
  bool auiDisabled(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getDisabled(this, values);
  
  /// Get responsive loading
  bool auiLoading(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getLoading(this, values);
  
  /// Get responsive error
  bool auiError(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getError(this, values);
  
  /// Get responsive success
  bool auiSuccess(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getSuccess(this, values);
  
  /// Get responsive warning
  bool auiWarning(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getWarning(this, values);
  
  /// Get responsive info
  bool auiInfo(Map<AuiBreakpoint, bool> values) => 
      AuiResponsiveUtils.getInfo(this, values);
}

/// Responsive extensions for AuiBreakpoint
extension AuiBreakpointExtension on AuiBreakpoint {
  /// Get breakpoint value
  double get value => AuiResponsiveBreakpoints.defaultBreakpoints.getValue(this);
  
  /// Get breakpoint name
  String get name {
    switch (this) {
      case AuiBreakpoint.xs:
        return 'xs';
      case AuiBreakpoint.sm:
        return 'sm';
      case AuiBreakpoint.md:
        return 'md';
      case AuiBreakpoint.lg:
        return 'lg';
      case AuiBreakpoint.xl:
        return 'xl';
      case AuiBreakpoint.xxl:
        return 'xxl';
    }
  }
  
  /// Get breakpoint display name
  String get displayName {
    switch (this) {
      case AuiBreakpoint.xs:
        return 'Extra Small';
      case AuiBreakpoint.sm:
        return 'Small';
      case AuiBreakpoint.md:
        return 'Medium';
      case AuiBreakpoint.lg:
        return 'Large';
      case AuiBreakpoint.xl:
        return 'Extra Large';
      case AuiBreakpoint.xxl:
        return '2X Large';
    }
  }
  
  /// Get breakpoint description
  String get description {
    switch (this) {
      case AuiBreakpoint.xs:
        return 'Mobile phones (0px - 599px)';
      case AuiBreakpoint.sm:
        return 'Large phones (600px - 839px)';
      case AuiBreakpoint.md:
        return 'Tablets (840px - 1199px)';
      case AuiBreakpoint.lg:
        return 'Small desktops (1200px - 1599px)';
      case AuiBreakpoint.xl:
        return 'Large desktops (1600px - 1919px)';
      case AuiBreakpoint.xxl:
        return 'Extra large desktops (1920px+)';
    }
  }
}

/// Responsive extensions for AuiDeviceType
extension AuiDeviceTypeExtension on AuiDeviceType {
  /// Get device type name
  String get name {
    switch (this) {
      case AuiDeviceType.mobile:
        return 'mobile';
      case AuiDeviceType.tablet:
        return 'tablet';
      case AuiDeviceType.desktop:
        return 'desktop';
      case AuiDeviceType.watch:
        return 'watch';
      case AuiDeviceType.tv:
        return 'tv';
    }
  }
  
  /// Get device type display name
  String get displayName {
    switch (this) {
      case AuiDeviceType.mobile:
        return 'Mobile';
      case AuiDeviceType.tablet:
        return 'Tablet';
      case AuiDeviceType.desktop:
        return 'Desktop';
      case AuiDeviceType.watch:
        return 'Watch';
      case AuiDeviceType.tv:
        return 'TV';
    }
  }
  
  /// Get device type description
  String get description {
    switch (this) {
      case AuiDeviceType.mobile:
        return 'Mobile phones and small devices';
      case AuiDeviceType.tablet:
        return 'Tablets and medium devices';
      case AuiDeviceType.desktop:
        return 'Desktop computers and large devices';
      case AuiDeviceType.watch:
        return 'Smart watches and wearable devices';
      case AuiDeviceType.tv:
        return 'TVs and large display devices';
    }
  }
}

/// Responsive extensions for AuiOrientation
extension AuiOrientationExtension on AuiOrientation {
  /// Get orientation name
  String get name {
    switch (this) {
      case AuiOrientation.portrait:
        return 'portrait';
      case AuiOrientation.landscape:
        return 'landscape';
    }
  }
  
  /// Get orientation display name
  String get displayName {
    switch (this) {
      case AuiOrientation.portrait:
        return 'Portrait';
      case AuiOrientation.landscape:
        return 'Landscape';
    }
  }
  
  /// Get orientation description
  String get description {
    switch (this) {
      case AuiOrientation.portrait:
        return 'Vertical orientation (height > width)';
      case AuiOrientation.landscape:
        return 'Horizontal orientation (width > height)';
    }
  }
}
