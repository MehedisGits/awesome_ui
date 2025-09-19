import 'package:flutter/material.dart';

/// Responsive breakpoints
enum AuiBreakpoint {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

/// Responsive orientation
enum AuiOrientation {
  portrait,
  landscape,
}

/// Responsive device type
enum AuiDeviceType {
  mobile,
  tablet,
  desktop,
  watch,
  tv,
}

/// Responsive configuration
class AuiResponsiveConfig {
  const AuiResponsiveConfig({
    this.breakpoints = const AuiBreakpointValues(),
    this.orientation = AuiOrientation.portrait,
    this.deviceType = AuiDeviceType.mobile,
    this.isMobile = true,
    this.isTablet = false,
    this.isDesktop = false,
    this.isWatch = false,
    this.isTv = false,
    this.isPortrait = true,
    this.isLandscape = false,
    this.width = 0.0,
    this.height = 0.0,
    this.aspectRatio = 1.0,
    this.pixelRatio = 1.0,
    this.textScaleFactor = 1.0,
    this.platformBrightness = Brightness.light,
    this.platformLocale = const Locale('en', 'US'),
    this.platformTextDirection = TextDirection.ltr,
    this.platformPadding = EdgeInsets.zero,
    this.platformViewInsets = EdgeInsets.zero,
    this.platformViewPadding = EdgeInsets.zero,
    // this.platformGestureSettings = const DeviceGestureSettings(),
    // this.platformAccessibilityFeatures = const AccessibilityFeatures(),
    this.platformDisableAnimations = false,
    this.platformInvertColors = false,
    this.platformHighContrast = false,
    this.platformOnOffSwitchLabels = false,
    this.platformReduceMotion = false,
    this.platformBoldText = false,
  });

  final AuiBreakpointValues breakpoints;
  final AuiOrientation orientation;
  final AuiDeviceType deviceType;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final bool isWatch;
  final bool isTv;
  final bool isPortrait;
  final bool isLandscape;
  final double width;
  final double height;
  final double aspectRatio;
  final double pixelRatio;
  final double textScaleFactor;
  final Brightness platformBrightness;
  final Locale platformLocale;
  final TextDirection platformTextDirection;
  final EdgeInsets platformPadding;
  final EdgeInsets platformViewInsets;
  final EdgeInsets platformViewPadding;
  // final DeviceGestureSettings platformGestureSettings;
  // final AccessibilityFeatures platformAccessibilityFeatures;
  final bool platformDisableAnimations;
  final bool platformInvertColors;
  final bool platformHighContrast;
  final bool platformOnOffSwitchLabels;
  final bool platformReduceMotion;
  final bool platformBoldText;

  /// Get current breakpoint
  AuiBreakpoint get currentBreakpoint {
    if (width >= breakpoints.xxl) return AuiBreakpoint.xxl;
    if (width >= breakpoints.xl) return AuiBreakpoint.xl;
    if (width >= breakpoints.lg) return AuiBreakpoint.lg;
    if (width >= breakpoints.md) return AuiBreakpoint.md;
    if (width >= breakpoints.sm) return AuiBreakpoint.sm;
    return AuiBreakpoint.xs;
  }

  /// Check if current breakpoint is at least the given breakpoint
  bool isAtLeast(AuiBreakpoint breakpoint) {
    return width >= breakpoints.getValue(breakpoint);
  }

  /// Check if current breakpoint is at most the given breakpoint
  bool isAtMost(AuiBreakpoint breakpoint) {
    return width <= breakpoints.getValue(breakpoint);
  }

  /// Check if current breakpoint is between the given breakpoints
  bool isBetween(AuiBreakpoint min, AuiBreakpoint max) {
    return isAtLeast(min) && isAtMost(max);
  }

  /// Get responsive value based on breakpoint
  T getValue<T>(Map<AuiBreakpoint, T> values) {
    final breakpoint = currentBreakpoint;
    return values[breakpoint] ?? values.values.last;
  }

  /// Get responsive value with fallback
  T getValueWithFallback<T>(Map<AuiBreakpoint, T> values, T fallback) {
    final breakpoint = currentBreakpoint;
    return values[breakpoint] ?? fallback;
  }

  /// Get responsive value with interpolation
  double getInterpolatedValue(Map<AuiBreakpoint, double> values) {
    final breakpoint = currentBreakpoint;
    final currentValue = values[breakpoint] ?? values.values.last;
    
    if (breakpoint == AuiBreakpoint.xs) return currentValue;
    
    final previousBreakpoint = AuiBreakpoint.values[breakpoint.index - 1];
    final previousValue = values[previousBreakpoint] ?? values.values.first;
    
    final currentWidth = breakpoints.getValue(breakpoint);
    final previousWidth = breakpoints.getValue(previousBreakpoint);
    final progress = (width - previousWidth) / (currentWidth - previousWidth);
    
    return previousValue + (currentValue - previousValue) * progress;
  }

  /// Copy with new values
  AuiResponsiveConfig copyWith({
    AuiBreakpointValues? breakpoints,
    AuiOrientation? orientation,
    AuiDeviceType? deviceType,
    bool? isMobile,
    bool? isTablet,
    bool? isDesktop,
    bool? isWatch,
    bool? isTv,
    bool? isPortrait,
    bool? isLandscape,
    double? width,
    double? height,
    double? aspectRatio,
    double? pixelRatio,
    double? textScaleFactor,
    Brightness? platformBrightness,
    Locale? platformLocale,
    TextDirection? platformTextDirection,
    EdgeInsets? platformPadding,
    EdgeInsets? platformViewInsets,
    EdgeInsets? platformViewPadding,
    // DeviceGestureSettings? platformGestureSettings,
    // AccessibilityFeatures? platformAccessibilityFeatures,
    bool? platformDisableAnimations,
    bool? platformInvertColors,
    bool? platformHighContrast,
    bool? platformOnOffSwitchLabels,
    bool? platformReduceMotion,
    bool? platformBoldText,
  }) {
    return AuiResponsiveConfig(
      breakpoints: breakpoints ?? this.breakpoints,
      orientation: orientation ?? this.orientation,
      deviceType: deviceType ?? this.deviceType,
      isMobile: isMobile ?? this.isMobile,
      isTablet: isTablet ?? this.isTablet,
      isDesktop: isDesktop ?? this.isDesktop,
      isWatch: isWatch ?? this.isWatch,
      isTv: isTv ?? this.isTv,
      isPortrait: isPortrait ?? this.isPortrait,
      isLandscape: isLandscape ?? this.isLandscape,
      width: width ?? this.width,
      height: height ?? this.height,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      pixelRatio: pixelRatio ?? this.pixelRatio,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      platformBrightness: platformBrightness ?? this.platformBrightness,
      platformLocale: platformLocale ?? this.platformLocale,
      platformTextDirection: platformTextDirection ?? this.platformTextDirection,
      platformPadding: platformPadding ?? this.platformPadding,
      platformViewInsets: platformViewInsets ?? this.platformViewInsets,
      platformViewPadding: platformViewPadding ?? this.platformViewPadding,
      // platformGestureSettings: platformGestureSettings ?? this.platformGestureSettings,
      // platformAccessibilityFeatures: platformAccessibilityFeatures ?? this.platformAccessibilityFeatures,
      platformDisableAnimations: platformDisableAnimations ?? this.platformDisableAnimations,
      platformInvertColors: platformInvertColors ?? this.platformInvertColors,
      platformHighContrast: platformHighContrast ?? this.platformHighContrast,
      platformOnOffSwitchLabels: platformOnOffSwitchLabels ?? this.platformOnOffSwitchLabels,
      platformReduceMotion: platformReduceMotion ?? this.platformReduceMotion,
      platformBoldText: platformBoldText ?? this.platformBoldText,
    );
  }
}

/// Breakpoint values
class AuiBreakpointValues {
  const AuiBreakpointValues({
    this.xs = 0.0,
    this.sm = 600.0,
    this.md = 840.0,
    this.lg = 1200.0,
    this.xl = 1600.0,
    this.xxl = 1920.0,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  /// Get value for breakpoint
  double getValue(AuiBreakpoint breakpoint) {
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
      case AuiBreakpoint.xxl:
        return xxl;
    }
  }

  /// Get breakpoint for width
  AuiBreakpoint getBreakpoint(double width) {
    if (width >= xxl) return AuiBreakpoint.xxl;
    if (width >= xl) return AuiBreakpoint.xl;
    if (width >= lg) return AuiBreakpoint.lg;
    if (width >= md) return AuiBreakpoint.md;
    if (width >= sm) return AuiBreakpoint.sm;
    return AuiBreakpoint.xs;
  }

  /// Get breakpoint range
  AuiBreakpointRange getRange(AuiBreakpoint breakpoint) {
    switch (breakpoint) {
      case AuiBreakpoint.xs:
        return AuiBreakpointRange(xs, sm);
      case AuiBreakpoint.sm:
        return AuiBreakpointRange(sm, md);
      case AuiBreakpoint.md:
        return AuiBreakpointRange(md, lg);
      case AuiBreakpoint.lg:
        return AuiBreakpointRange(lg, xl);
      case AuiBreakpoint.xl:
        return AuiBreakpointRange(xl, xxl);
      case AuiBreakpoint.xxl:
        return AuiBreakpointRange(xxl, double.infinity);
    }
  }

  /// Copy with new values
  AuiBreakpointValues copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return AuiBreakpointValues(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }
}

/// Breakpoint range
class AuiBreakpointRange {
  const AuiBreakpointRange(this.min, this.max);

  final double min;
  final double max;

  /// Check if width is in range
  bool contains(double width) {
    return width >= min && width < max;
  }

  /// Get progress within range
  double getProgress(double width) {
    if (max == double.infinity) return 1.0;
    return ((width - min) / (max - min)).clamp(0.0, 1.0);
  }
}

/// Responsive breakpoint utilities
class AuiResponsiveBreakpoints {
  const AuiResponsiveBreakpoints._();

  /// Default breakpoint values
  static const AuiBreakpointValues defaultBreakpoints = AuiBreakpointValues();

  /// Material Design breakpoint values
  static const AuiBreakpointValues materialBreakpoints = AuiBreakpointValues(
    xs: 0.0,
    sm: 600.0,
    md: 840.0,
    lg: 1200.0,
    xl: 1600.0,
    xxl: 1920.0,
  );

  /// Bootstrap breakpoint values
  static const AuiBreakpointValues bootstrapBreakpoints = AuiBreakpointValues(
    xs: 0.0,
    sm: 576.0,
    md: 768.0,
    lg: 992.0,
    xl: 1200.0,
    xxl: 1400.0,
  );

  /// Tailwind CSS breakpoint values
  static const AuiBreakpointValues tailwindBreakpoints = AuiBreakpointValues(
    xs: 0.0,
    sm: 640.0,
    md: 768.0,
    lg: 1024.0,
    xl: 1280.0,
    xxl: 1536.0,
  );

  /// Get breakpoint for width
  static AuiBreakpoint getBreakpoint(double width, {AuiBreakpointValues? breakpoints}) {
    final bp = breakpoints ?? defaultBreakpoints;
    return bp.getBreakpoint(width);
  }

  /// Check if width is at least breakpoint
  static bool isAtLeast(double width, AuiBreakpoint breakpoint, {AuiBreakpointValues? breakpoints}) {
    final bp = breakpoints ?? defaultBreakpoints;
    return width >= bp.getValue(breakpoint);
  }

  /// Check if width is at most breakpoint
  static bool isAtMost(double width, AuiBreakpoint breakpoint, {AuiBreakpointValues? breakpoints}) {
    final bp = breakpoints ?? defaultBreakpoints;
    return width <= bp.getValue(breakpoint);
  }

  /// Check if width is between breakpoints
  static bool isBetween(double width, AuiBreakpoint min, AuiBreakpoint max, {AuiBreakpointValues? breakpoints}) {
    return isAtLeast(width, min, breakpoints: breakpoints) && isAtMost(width, max, breakpoints: breakpoints);
  }

  /// Get responsive value
  static T getValue<T>(double width, Map<AuiBreakpoint, T> values, {AuiBreakpointValues? breakpoints}) {
    final breakpoint = getBreakpoint(width, breakpoints: breakpoints);
    return values[breakpoint] ?? values.values.last;
  }

  /// Get responsive value with fallback
  static T getValueWithFallback<T>(double width, Map<AuiBreakpoint, T> values, T fallback, {AuiBreakpointValues? breakpoints}) {
    final breakpoint = getBreakpoint(width, breakpoints: breakpoints);
    return values[breakpoint] ?? fallback;
  }

  /// Get interpolated value
  static double getInterpolatedValue(double width, Map<AuiBreakpoint, double> values, {AuiBreakpointValues? breakpoints}) {
    final bp = breakpoints ?? defaultBreakpoints;
    final breakpoint = getBreakpoint(width, breakpoints: bp);
    final currentValue = values[breakpoint] ?? values.values.last;
    
    if (breakpoint == AuiBreakpoint.xs) return currentValue;
    
    final previousBreakpoint = AuiBreakpoint.values[breakpoint.index - 1];
    final previousValue = values[previousBreakpoint] ?? values.values.first;
    
    final currentWidth = bp.getValue(breakpoint);
    final previousWidth = bp.getValue(previousBreakpoint);
    final progress = (width - previousWidth) / (currentWidth - previousWidth);
    
    return previousValue + (currentValue - previousValue) * progress;
  }

  /// Get device type from width
  static AuiDeviceType getDeviceType(double width) {
    if (width >= 1600.0) return AuiDeviceType.desktop;
    if (width >= 840.0) return AuiDeviceType.tablet;
    if (width >= 600.0) return AuiDeviceType.mobile;
    return AuiDeviceType.mobile;
  }

  /// Get orientation from dimensions
  static AuiOrientation getOrientation(double width, double height) {
    return width > height ? AuiOrientation.landscape : AuiOrientation.portrait;
  }

  /// Get responsive configuration from MediaQuery
  static AuiResponsiveConfig getConfig(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final deviceType = getDeviceType(size.width);
    final orientation = getOrientation(size.width, size.height);
    
    return AuiResponsiveConfig(
      breakpoints: defaultBreakpoints,
      orientation: orientation,
      deviceType: deviceType,
      isMobile: deviceType == AuiDeviceType.mobile,
      isTablet: deviceType == AuiDeviceType.tablet,
      isDesktop: deviceType == AuiDeviceType.desktop,
      isWatch: deviceType == AuiDeviceType.watch,
      isTv: deviceType == AuiDeviceType.tv,
      isPortrait: orientation == AuiOrientation.portrait,
      isLandscape: orientation == AuiOrientation.landscape,
      width: size.width,
      height: size.height,
      aspectRatio: size.aspectRatio,
      pixelRatio: mediaQuery.devicePixelRatio,
      textScaleFactor: mediaQuery.textScaler.scale(1.0),
      platformBrightness: mediaQuery.platformBrightness,
      platformLocale: const Locale('en', 'US'), // mediaQuery.locale,
      platformTextDirection: TextDirection.ltr, // mediaQuery.textDirection,
      platformPadding: mediaQuery.padding,
      platformViewInsets: mediaQuery.viewInsets,
      platformViewPadding: mediaQuery.viewPadding,
      // platformGestureSettings: mediaQuery.gestureSettings,
      // platformAccessibilityFeatures: mediaQuery.accessibilityFeatures,
      platformDisableAnimations: false, // mediaQuery.disableAnimations,
      platformInvertColors: false, // mediaQuery.invertColors,
      platformHighContrast: false, // mediaQuery.highContrast,
      platformOnOffSwitchLabels: false, // mediaQuery.onOffSwitchLabels,
      platformReduceMotion: false, // mediaQuery.reduceMotion,
      platformBoldText: mediaQuery.boldText,
    );
  }
}
