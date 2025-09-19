import 'package:flutter/material.dart';

/// Motion system for awesome_ui
/// 
/// Provides consistent animation durations, curves, and motion patterns
/// for micro-interactions and page transitions.
class AuiMotion {
  const AuiMotion._();
  
  // Duration constants (in milliseconds)
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration slower = Duration(milliseconds: 750);
  static const Duration slowest = Duration(milliseconds: 1000);
  
  // Micro durations
  static const Duration micro = Duration(milliseconds: 50);
  static const Duration nano = Duration(milliseconds: 25);
  
  // Macro durations
  static const Duration macro = Duration(milliseconds: 800);
  static const Duration mega = Duration(milliseconds: 1200);
  static const Duration giga = Duration(milliseconds: 2000);
}

/// Animation curves for different motion types
class AuiCurves {
  const AuiCurves._();
  
  // Standard curves
  static const Curve standard = Curves.easeInOut;
  static const Curve standardAccelerate = Curves.easeIn;
  static const Curve standardDecelerate = Curves.easeOut;
  
  // Emphasis curves
  static const Curve emphasized = Curves.easeInOutCubic;
  static const Curve emphasizedAccelerate = Curves.easeInCubic;
  static const Curve emphasizedDecelerate = Curves.easeOutCubic;
  
  // Linear curves
  static const Curve linear = Curves.linear;
  static const Curve linearOutSlowIn = Curves.linearToEaseOut;
  
  // Bounce curves
  static const Curve bounce = Curves.bounceOut;
  static const Curve bounceIn = Curves.bounceIn;
  static const Curve bounceOut = Curves.bounceOut;
  
  // Elastic curves
  static const Curve elastic = Curves.elasticOut;
  static const Curve elasticIn = Curves.elasticIn;
  static const Curve elasticOut = Curves.elasticOut;
  
  // Back curves
  static const Curve back = Curves.fastOutSlowIn;
  static const Curve backIn = Curves.fastOutSlowIn;
  static const Curve backOut = Curves.fastOutSlowIn;
  
  // Custom curves
  static const Curve custom1 = Curves.fastOutSlowIn;
  static const Curve custom2 = Curves.slowMiddle;
  static const Curve custom3 = Curves.fastLinearToSlowEaseIn;
}

/// Motion patterns for different interactions
class AuiMotionPatterns {
  const AuiMotionPatterns._();
  
  // Button interactions
  static const AuiMotionPattern buttonPress = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.standardDecelerate,
  );
  
  static const AuiMotionPattern buttonHover = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.standard,
  );
  
  static const AuiMotionPattern buttonFocus = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.standard,
  );
  
  // Card interactions
  static const AuiMotionPattern cardHover = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.standard,
  );
  
  static const AuiMotionPattern cardPress = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.standardDecelerate,
  );
  
  // Dialog animations
  static const AuiMotionPattern dialogEnter = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern dialogExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // Sheet animations
  static const AuiMotionPattern sheetEnter = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern sheetExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // Page transitions
  static const AuiMotionPattern pageTransition = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.standard,
  );
  
  static const AuiMotionPattern pageTransitionFast = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.standard,
  );
  
  static const AuiMotionPattern pageTransitionSlow = AuiMotionPattern(
    duration: AuiMotion.slow,
    curve: AuiCurves.standard,
  );
  
  // List animations
  static const AuiMotionPattern listItemEnter = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern listItemExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // FAB animations
  static const AuiMotionPattern fabEnter = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern fabExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // Snackbar animations
  static const AuiMotionPattern snackbarEnter = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern snackbarExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // Tooltip animations
  static const AuiMotionPattern tooltipEnter = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern tooltipExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // Menu animations
  static const AuiMotionPattern menuEnter = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern menuExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // Dropdown animations
  static const AuiMotionPattern dropdownEnter = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedDecelerate,
  );
  
  static const AuiMotionPattern dropdownExit = AuiMotionPattern(
    duration: AuiMotion.fast,
    curve: AuiCurves.emphasizedAccelerate,
  );
  
  // Loading animations
  static const AuiMotionPattern loading = AuiMotionPattern(
    duration: AuiMotion.slow,
    curve: AuiCurves.linear,
  );
  
  static const AuiMotionPattern loadingFast = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.linear,
  );
  
  static const AuiMotionPattern loadingSlow = AuiMotionPattern(
    duration: AuiMotion.slower,
    curve: AuiCurves.linear,
  );
  
  // Skeleton animations
  static const AuiMotionPattern skeleton = AuiMotionPattern(
    duration: AuiMotion.slow,
    curve: AuiCurves.linear,
  );
  
  // Progress animations
  static const AuiMotionPattern progress = AuiMotionPattern(
    duration: AuiMotion.medium,
    curve: AuiCurves.standard,
  );
  
  // Shimmer animations
  static const AuiMotionPattern shimmer = AuiMotionPattern(
    duration: AuiMotion.slow,
    curve: AuiCurves.linear,
  );
}

/// Motion pattern definition
class AuiMotionPattern {
  const AuiMotionPattern({
    required this.duration,
    required this.curve,
  });
  
  final Duration duration;
  final Curve curve;
  
  /// Create animation controller with this pattern
  AnimationController createController(TickerProvider vsync) {
    return AnimationController(
      duration: duration,
      vsync: vsync,
    );
  }
  
  /// Create animation with this pattern
  Animation<double> createAnimation(AnimationController controller) {
    return CurvedAnimation(
      parent: controller,
      curve: curve,
    );
  }
  
  /// Create tween animation with this pattern
  Animation<T> createTween<T>(AnimationController controller, Tween<T> tween) {
    return tween.animate(createAnimation(controller));
  }
}

/// Page transition patterns
class AuiPageTransitions {
  const AuiPageTransitions._();
  
  // Subtle transitions (for fintech, enterprise apps)
  static const AuiPageTransition subtle = AuiPageTransition(
    duration: AuiMotion.medium,
    curve: AuiCurves.standard,
    type: AuiPageTransitionType.fade,
  );
  
  // Lively transitions (for social, consumer apps)
  static const AuiPageTransition lively = AuiPageTransition(
    duration: AuiMotion.medium,
    curve: AuiCurves.emphasized,
    type: AuiPageTransitionType.slide,
  );
  
  // Fast transitions (for utility apps)
  static const AuiPageTransition fast = AuiPageTransition(
    duration: AuiMotion.fast,
    curve: AuiCurves.standard,
    type: AuiPageTransitionType.fade,
  );
  
  // Slow transitions (for media, creative apps)
  static const AuiPageTransition slow = AuiPageTransition(
    duration: AuiMotion.slow,
    curve: AuiCurves.emphasized,
    type: AuiPageTransitionType.slide,
  );
  
  // Custom transitions
  static AuiPageTransition custom({
    required Duration duration,
    required Curve curve,
    required AuiPageTransitionType type,
  }) {
    return AuiPageTransition(
      duration: duration,
      curve: curve,
      type: type,
    );
  }
}

/// Page transition definition
class AuiPageTransition {
  const AuiPageTransition({
    required this.duration,
    required this.curve,
    required this.type,
  });
  
  final Duration duration;
  final Curve curve;
  final AuiPageTransitionType type;
  
  /// Create page route with this transition
  PageRouteBuilder createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case AuiPageTransitionType.fade:
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          case AuiPageTransitionType.slide:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: curve,
              )),
              child: child,
            );
          case AuiPageTransitionType.scale:
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: curve,
              )),
              child: child,
            );
          case AuiPageTransitionType.rotation:
            return RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: curve,
              )),
              child: child,
            );
        }
      },
    );
  }
}

/// Page transition types
enum AuiPageTransitionType {
  fade,
  slide,
  scale,
  rotation,
}

/// Motion utilities
class AuiMotionUtils {
  const AuiMotionUtils._();
  
  /// Get motion pattern for interaction type
  static AuiMotionPattern getPattern(InteractionType type) {
    switch (type) {
      case InteractionType.buttonPress:
        return AuiMotionPatterns.buttonPress;
      case InteractionType.buttonHover:
        return AuiMotionPatterns.buttonHover;
      case InteractionType.buttonFocus:
        return AuiMotionPatterns.buttonFocus;
      case InteractionType.cardHover:
        return AuiMotionPatterns.cardHover;
      case InteractionType.cardPress:
        return AuiMotionPatterns.cardPress;
      case InteractionType.dialogEnter:
        return AuiMotionPatterns.dialogEnter;
      case InteractionType.dialogExit:
        return AuiMotionPatterns.dialogExit;
      case InteractionType.sheetEnter:
        return AuiMotionPatterns.sheetEnter;
      case InteractionType.sheetExit:
        return AuiMotionPatterns.sheetExit;
      case InteractionType.pageTransition:
        return AuiMotionPatterns.pageTransition;
      case InteractionType.listItemEnter:
        return AuiMotionPatterns.listItemEnter;
      case InteractionType.listItemExit:
        return AuiMotionPatterns.listItemExit;
      case InteractionType.fabEnter:
        return AuiMotionPatterns.fabEnter;
      case InteractionType.fabExit:
        return AuiMotionPatterns.fabExit;
      case InteractionType.snackbarEnter:
        return AuiMotionPatterns.snackbarEnter;
      case InteractionType.snackbarExit:
        return AuiMotionPatterns.snackbarExit;
      case InteractionType.tooltipEnter:
        return AuiMotionPatterns.tooltipEnter;
      case InteractionType.tooltipExit:
        return AuiMotionPatterns.tooltipExit;
      case InteractionType.menuEnter:
        return AuiMotionPatterns.menuEnter;
      case InteractionType.menuExit:
        return AuiMotionPatterns.menuExit;
      case InteractionType.dropdownEnter:
        return AuiMotionPatterns.dropdownEnter;
      case InteractionType.dropdownExit:
        return AuiMotionPatterns.dropdownExit;
      case InteractionType.loading:
        return AuiMotionPatterns.loading;
      case InteractionType.skeleton:
        return AuiMotionPatterns.skeleton;
      case InteractionType.progress:
        return AuiMotionPatterns.progress;
      case InteractionType.shimmer:
        return AuiMotionPatterns.shimmer;
    }
  }
  
  /// Get page transition for app type
  static AuiPageTransition getPageTransition(AppType type) {
    switch (type) {
      case AppType.fintech:
        return AuiPageTransitions.subtle;
      case AppType.enterprise:
        return AuiPageTransitions.subtle;
      case AppType.social:
        return AuiPageTransitions.lively;
      case AppType.consumer:
        return AuiPageTransitions.lively;
      case AppType.utility:
        return AuiPageTransitions.fast;
      case AppType.media:
        return AuiPageTransitions.slow;
      case AppType.creative:
        return AuiPageTransitions.slow;
      case AppType.gaming:
        return AuiPageTransitions.lively;
      case AppType.education:
        return AuiPageTransitions.subtle;
      case AppType.healthcare:
        return AuiPageTransitions.subtle;
    }
  }
}

/// Interaction types
enum InteractionType {
  buttonPress,
  buttonHover,
  buttonFocus,
  cardHover,
  cardPress,
  dialogEnter,
  dialogExit,
  sheetEnter,
  sheetExit,
  pageTransition,
  listItemEnter,
  listItemExit,
  fabEnter,
  fabExit,
  snackbarEnter,
  snackbarExit,
  tooltipEnter,
  tooltipExit,
  menuEnter,
  menuExit,
  dropdownEnter,
  dropdownExit,
  loading,
  skeleton,
  progress,
  shimmer,
}

/// App types for motion customization
enum AppType {
  fintech,
  enterprise,
  social,
  consumer,
  utility,
  media,
  creative,
  gaming,
  education,
  healthcare,
}

/// Motion extensions
extension AuiMotionExtension on Duration {
  /// Get motion pattern with this duration
  AuiMotionPattern withCurve(Curve curve) {
    return AuiMotionPattern(duration: this, curve: curve);
  }
}

extension AuiCurveExtension on Curve {
  /// Get motion pattern with this curve
  AuiMotionPattern withDuration(Duration duration) {
    return AuiMotionPattern(duration: duration, curve: this);
  }
}
