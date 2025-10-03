import 'package:flutter/material.dart';

/// Design tokens for motion and animations.
/// 
/// Provides consistent timing, easing, and animation tokens that respect
/// user preferences for reduced motion and accessibility.
class AppMotion {
  const AppMotion._();

  /// Create a standard motion instance
  factory AppMotion.standard() => const AppMotion._();

  /// Animation durations
  static const Duration short1 = Duration(milliseconds: 50);
  static const Duration short2 = Duration(milliseconds: 100);
  static const Duration short3 = Duration(milliseconds: 150);
  static const Duration short4 = Duration(milliseconds: 200);
  static const Duration medium1 = Duration(milliseconds: 250);
  static const Duration medium2 = Duration(milliseconds: 300);
  static const Duration medium3 = Duration(milliseconds: 350);
  static const Duration medium4 = Duration(milliseconds: 400);
  static const Duration long1 = Duration(milliseconds: 450);
  static const Duration long2 = Duration(milliseconds: 500);
  static const Duration long3 = Duration(milliseconds: 550);
  static const Duration long4 = Duration(milliseconds: 600);
  static const Duration extraLong1 = Duration(milliseconds: 700);
  static const Duration extraLong2 = Duration(milliseconds: 800);
  static const Duration extraLong3 = Duration(milliseconds: 900);
  static const Duration extraLong4 = Duration(milliseconds: 1000);

  /// Easing curves
  static const Curve standardCurve = Curves.easeInOut;
  static const Curve standardDecelerate = Curves.easeOut;
  static const Curve standardAccelerate = Curves.easeIn;
  static const Curve emphasized = Curves.easeInOutCubic;
  static const Curve emphasizedDecelerate = Curves.easeOutCubic;
  static const Curve emphasizedAccelerate = Curves.easeInCubic;
  static const Curve linear = Curves.linear;
  static const Curve bounce = Curves.bounceOut;
  static const Curve elastic = Curves.elasticOut;

  /// Reduced motion durations (for accessibility)
  static const Duration reducedShort1 = Duration(milliseconds: 0);
  static const Duration reducedShort2 = Duration(milliseconds: 0);
  static const Duration reducedShort3 = Duration(milliseconds: 0);
  static const Duration reducedShort4 = Duration(milliseconds: 0);
  static const Duration reducedMedium1 = Duration(milliseconds: 0);
  static const Duration reducedMedium2 = Duration(milliseconds: 0);
  static const Duration reducedMedium3 = Duration(milliseconds: 0);
  static const Duration reducedMedium4 = Duration(milliseconds: 0);
  static const Duration reducedLong1 = Duration(milliseconds: 0);
  static const Duration reducedLong2 = Duration(milliseconds: 0);
  static const Duration reducedLong3 = Duration(milliseconds: 0);
  static const Duration reducedLong4 = Duration(milliseconds: 0);
  static const Duration reducedExtraLong1 = Duration(milliseconds: 0);
  static const Duration reducedExtraLong2 = Duration(milliseconds: 0);
  static const Duration reducedExtraLong3 = Duration(milliseconds: 0);
  static const Duration reducedExtraLong4 = Duration(milliseconds: 0);

  /// Reduced motion curves (for accessibility)
  static const Curve reducedStandard = Curves.linear;
  static const Curve reducedStandardDecelerate = Curves.linear;
  static const Curve reducedStandardAccelerate = Curves.linear;
  static const Curve reducedEmphasized = Curves.linear;
  static const Curve reducedEmphasizedDecelerate = Curves.linear;
  static const Curve reducedEmphasizedAccelerate = Curves.linear;
  static const Curve reducedLinear = Curves.linear;
  static const Curve reducedBounce = Curves.linear;
  static const Curve reducedElastic = Curves.linear;

  /// Get duration based on reduced motion preference
  static Duration getDuration({
    required Duration normal,
    required Duration reduced,
    bool respectReducedMotion = true,
  }) {
    if (respectReducedMotion && _isReducedMotionEnabled()) {
      return reduced;
    }
    return normal;
  }

  /// Get curve based on reduced motion preference
  static Curve getCurve({
    required Curve normal,
    required Curve reduced,
    bool respectReducedMotion = true,
  }) {
    if (respectReducedMotion && _isReducedMotionEnabled()) {
      return reduced;
    }
    return normal;
  }

  /// Check if reduced motion is enabled
  static bool _isReducedMotionEnabled() {
    // This would typically check MediaQuery.of(context).accessibleNavigation
    // or similar platform-specific settings
    // For now, return false as a default
    return false;
  }

  /// Check if reduced motion is enabled from context
  static bool isReducedMotionEnabled(BuildContext context) {
    return MediaQuery.of(context).accessibleNavigation || 
           MediaQuery.of(context).disableAnimations;
  }

  /// Get duration with context-aware reduced motion support
  static Duration getDurationWithContext({
    required BuildContext context,
    required Duration normal,
    required Duration reduced,
    bool respectReducedMotion = true,
  }) {
    if (respectReducedMotion && isReducedMotionEnabled(context)) {
      return reduced;
    }
    return normal;
  }

  /// Get curve with context-aware reduced motion support
  static Curve getCurveWithContext({
    required BuildContext context,
    required Curve normal,
    required Curve reduced,
    bool respectReducedMotion = true,
  }) {
    if (respectReducedMotion && isReducedMotionEnabled(context)) {
      return reduced;
    }
    return normal;
  }

  /// Animation presets for common interactions
  static const Map<String, Duration> presets = {
    'buttonPress': short2,
    'buttonRelease': short1,
    'cardHover': short3,
    'cardPress': short2,
    'modalOpen': medium2,
    'modalClose': medium1,
    'pageTransition': long2,
    'fadeIn': short4,
    'fadeOut': short3,
    'slideIn': medium2,
    'slideOut': medium1,
    'scaleIn': short3,
    'scaleOut': short2,
    'rotateIn': medium1,
    'rotateOut': short4,
  };

  /// Reduced motion presets
  static const Map<String, Duration> reducedPresets = {
    'buttonPress': reducedShort2,
    'buttonRelease': reducedShort1,
    'cardHover': reducedShort3,
    'cardPress': reducedShort2,
    'modalOpen': reducedMedium2,
    'modalClose': reducedMedium1,
    'pageTransition': reducedLong2,
    'fadeIn': reducedShort4,
    'fadeOut': reducedShort3,
    'slideIn': reducedMedium2,
    'slideOut': reducedMedium1,
    'scaleIn': reducedShort3,
    'scaleOut': reducedShort2,
    'rotateIn': reducedMedium1,
    'rotateOut': reducedShort4,
  };

  /// Get preset duration
  static Duration getPresetDuration(String preset, {bool respectReducedMotion = true}) {
    final normal = presets[preset] ?? short2;
    final reduced = reducedPresets[preset] ?? reducedShort2;
    return getDuration(
      normal: normal,
      reduced: reduced,
      respectReducedMotion: respectReducedMotion,
    );
  }

  /// Animation curves for different interaction types
  static const Map<String, Curve> interactionCurves = {
    'buttonPress': standardDecelerate,
    'buttonRelease': standardAccelerate,
    'cardHover': standardCurve,
    'cardPress': standardDecelerate,
    'modalOpen': emphasizedDecelerate,
    'modalClose': emphasizedAccelerate,
    'pageTransition': emphasized,
    'fadeIn': standardDecelerate,
    'fadeOut': standardAccelerate,
    'slideIn': emphasizedDecelerate,
    'slideOut': emphasizedAccelerate,
    'scaleIn': bounce,
    'scaleOut': standardAccelerate,
    'rotateIn': elastic,
    'rotateOut': standardAccelerate,
  };

  /// Reduced motion interaction curves
  static const Map<String, Curve> reducedInteractionCurves = {
    'buttonPress': reducedStandardDecelerate,
    'buttonRelease': reducedStandardAccelerate,
    'cardHover': reducedStandard,
    'cardPress': reducedStandardDecelerate,
    'modalOpen': reducedEmphasizedDecelerate,
    'modalClose': reducedEmphasizedAccelerate,
    'pageTransition': reducedEmphasized,
    'fadeIn': reducedStandardDecelerate,
    'fadeOut': reducedStandardAccelerate,
    'slideIn': reducedEmphasizedDecelerate,
    'slideOut': reducedEmphasizedAccelerate,
    'scaleIn': reducedLinear,
    'scaleOut': reducedStandardAccelerate,
    'rotateIn': reducedLinear,
    'rotateOut': reducedStandardAccelerate,
  };

  /// Get preset curve
  static Curve getPresetCurve(String preset, {bool respectReducedMotion = true}) {
    final normal = interactionCurves[preset] ?? standardCurve;
    final reduced = reducedInteractionCurves[preset] ?? reducedStandard;
    return getCurve(
      normal: normal,
      reduced: reduced,
      respectReducedMotion: respectReducedMotion,
    );
  }

  /// Create animation controller with reduced motion support
  static AnimationController createController({
    required TickerProvider vsync,
    required Duration duration,
    Duration? reducedDuration,
    bool respectReducedMotion = true,
  }) {
    final effectiveDuration = getDuration(
      normal: duration,
      reduced: reducedDuration ?? Duration.zero,
      respectReducedMotion: respectReducedMotion,
    );
    
    return AnimationController(
      duration: effectiveDuration,
      vsync: vsync,
    );
  }

  /// Create tween animation with reduced motion support
  static Animation<T> createTween<T>({
    required TickerProvider vsync,
    required T begin,
    required T end,
    required Duration duration,
    Duration? reducedDuration,
    required Curve curve,
    Curve? reducedCurve,
    bool respectReducedMotion = true,
  }) {
    final effectiveDuration = getDuration(
      normal: duration,
      reduced: reducedDuration ?? Duration.zero,
      respectReducedMotion: respectReducedMotion,
    );
    
    final effectiveCurve = getCurve(
      normal: curve,
      reduced: reducedCurve ?? Curves.linear,
      respectReducedMotion: respectReducedMotion,
    );
    
    return Tween<T>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: AnimationController(
          duration: effectiveDuration,
          vsync: vsync,
        ),
        curve: effectiveCurve,
      ),
    );
  }

}

/// Performance optimization utilities
class PerformanceUtils {
    /// Check if animations should be disabled for performance
    static bool shouldDisableAnimations() {
      // In release mode, consider disabling non-essential animations
      return false; // kReleaseMode;
    }

    /// Get optimized duration for performance
    static Duration getOptimizedDuration({
      required Duration normal,
      required Duration reduced,
      bool respectPerformance = true,
    }) {
      if (respectPerformance && shouldDisableAnimations()) {
        return reduced;
      }
      return normal;
    }

    /// Get optimized curve for performance
    static Curve getOptimizedCurve({
      required Curve normal,
      required Curve reduced,
      bool respectPerformance = true,
    }) {
      if (respectPerformance && shouldDisableAnimations()) {
        return reduced;
      }
      return normal;
    }

    /// Create performance-optimized animation controller
    static AnimationController createOptimizedController({
      required TickerProvider vsync,
      required Duration duration,
      Duration? reducedDuration,
      bool respectPerformance = true,
    }) {
      final effectiveDuration = getOptimizedDuration(
        normal: duration,
        reduced: reducedDuration ?? Duration.zero,
        respectPerformance: respectPerformance,
      );
      
      return AnimationController(
        duration: effectiveDuration,
        vsync: vsync,
      );
    }
  }

/// Memory optimization utilities
class MemoryUtils {
    /// Check if memory usage is high
    static bool isMemoryUsageHigh() {
      // This would typically check actual memory usage
      // For now, return false as a default
      return false;
    }

    /// Get memory-optimized duration
    static Duration getMemoryOptimizedDuration({
      required Duration normal,
      required Duration reduced,
      bool respectMemory = true,
    }) {
      if (respectMemory && isMemoryUsageHigh()) {
        return reduced;
      }
      return normal;
    }

    /// Get memory-optimized curve
    static Curve getMemoryOptimizedCurve({
      required Curve normal,
      required Curve reduced,
      bool respectMemory = true,
    }) {
      if (respectMemory && isMemoryUsageHigh()) {
        return reduced;
      }
      return normal;
    }
  }
