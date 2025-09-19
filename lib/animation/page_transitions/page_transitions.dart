import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Page transition types
enum AuiPageTransitionType {
  fade,
  slide,
  scale,
  rotation,
  flip,
  zoom,
  slideUp,
  slideDown,
  slideLeft,
  slideRight,
  slideUpFade,
  slideDownFade,
  slideLeftFade,
  slideRightFade,
  scaleFade,
  rotationFade,
  flipFade,
  zoomFade,
  slideUpScale,
  slideDownScale,
  slideLeftScale,
  slideRightScale,
  slideUpRotation,
  slideDownRotation,
  slideLeftRotation,
  slideRightRotation,
  slideUpFlip,
  slideDownFlip,
  slideLeftFlip,
  slideRightFlip,
  slideUpZoom,
  slideDownZoom,
  slideLeftZoom,
  slideRightZoom,
  custom,
}

/// Page transition directions
enum AuiPageTransitionDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
  center,
}

/// Page transition curves
enum AuiPageTransitionCurve {
  linear,
  ease,
  easeIn,
  easeOut,
  easeInOut,
  fastOutSlowIn,
  slowMiddle,
  bounceIn,
  bounceOut,
  bounceInOut,
  elasticIn,
  elasticOut,
  elasticInOut,
  backIn,
  backOut,
  backInOut,
  decelerate,
  accelerate,
  elastic,
  bounce,
  back,
}

/// Page transition configuration
class AuiPageTransitionConfig {
  const AuiPageTransitionConfig({
    this.type = AuiPageTransitionType.slide,
    this.direction = AuiPageTransitionDirection.rightToLeft,
    this.curve = AuiPageTransitionCurve.easeInOut,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.alignment = Alignment.center,
    this.scale = 1.0,
    this.rotation = 0.0,
    this.opacity = 1.0,
    this.offset = Offset.zero,
    this.perspective = 0.001,
    this.axis = Axis.vertical,
    this.flipDirection = AuiPageTransitionDirection.rightToLeft,
    this.zoomScale = 0.8,
    this.slideOffset = const Offset(1.0, 0.0),
    this.fadeOpacity = 0.0,
    this.scaleBegin = 0.0,
    this.scaleEnd = 1.0,
    this.rotationBegin = 0.0,
    this.rotationEnd = 0.0,
    this.flipBegin = 0.0,
    this.flipEnd = 3.14159,
    this.zoomBegin = 0.0,
    this.zoomEnd = 1.0,
    this.slideBegin = 1.0,
    this.slideEnd = 0.0,
    this.fadeBegin = 0.0,
    this.fadeEnd = 1.0,
    this.customBuilder,
    this.transitionBuilder,
    this.reverseTransitionBuilder,
    this.maintainState = true,
    this.fullscreenDialog = false,
    this.opaque = true,
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel,
    this.useRootNavigator = false,
    this.anchorPoint,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    this.clipBehavior = Clip.none,
  });

  final AuiPageTransitionType type;
  final AuiPageTransitionDirection direction;
  final AuiPageTransitionCurve curve;
  final Duration duration;
  final Duration reverseDuration;
  final Alignment alignment;
  final double scale;
  final double rotation;
  final double opacity;
  final Offset offset;
  final double perspective;
  final Axis axis;
  final AuiPageTransitionDirection flipDirection;
  final double zoomScale;
  final Offset slideOffset;
  final double fadeOpacity;
  final double scaleBegin;
  final double scaleEnd;
  final double rotationBegin;
  final double rotationEnd;
  final double flipBegin;
  final double flipEnd;
  final double zoomBegin;
  final double zoomEnd;
  final double slideBegin;
  final double slideEnd;
  final double fadeBegin;
  final double fadeEnd;
  final Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? customBuilder;
  final Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? transitionBuilder;
  final Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? reverseTransitionBuilder;
  final bool maintainState;
  final bool fullscreenDialog;
  final bool opaque;
  final bool barrierDismissible;
  final Color? barrierColor;
  final String? barrierLabel;
  final bool useRootNavigator;
  final Offset? anchorPoint;
  final EdgeInsets insetPadding;
  final Clip clipBehavior;

  /// Copy with new values
  AuiPageTransitionConfig copyWith({
    AuiPageTransitionType? type,
    AuiPageTransitionDirection? direction,
    AuiPageTransitionCurve? curve,
    Duration? duration,
    Duration? reverseDuration,
    Alignment? alignment,
    double? scale,
    double? rotation,
    double? opacity,
    Offset? offset,
    double? perspective,
    Axis? axis,
    AuiPageTransitionDirection? flipDirection,
    double? zoomScale,
    Offset? slideOffset,
    double? fadeOpacity,
    double? scaleBegin,
    double? scaleEnd,
    double? rotationBegin,
    double? rotationEnd,
    double? flipBegin,
    double? flipEnd,
    double? zoomBegin,
    double? zoomEnd,
    double? slideBegin,
    double? slideEnd,
    double? fadeBegin,
    double? fadeEnd,
    Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? customBuilder,
    Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? transitionBuilder,
    Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)? reverseTransitionBuilder,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? opaque,
    bool? barrierDismissible,
    Color? barrierColor,
    String? barrierLabel,
    bool? useRootNavigator,
    Offset? anchorPoint,
    EdgeInsets? insetPadding,
    Clip? clipBehavior,
  }) {
    return AuiPageTransitionConfig(
      type: type ?? this.type,
      direction: direction ?? this.direction,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      reverseDuration: reverseDuration ?? this.reverseDuration,
      alignment: alignment ?? this.alignment,
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      opacity: opacity ?? this.opacity,
      offset: offset ?? this.offset,
      perspective: perspective ?? this.perspective,
      axis: axis ?? this.axis,
      flipDirection: flipDirection ?? this.flipDirection,
      zoomScale: zoomScale ?? this.zoomScale,
      slideOffset: slideOffset ?? this.slideOffset,
      fadeOpacity: fadeOpacity ?? this.fadeOpacity,
      scaleBegin: scaleBegin ?? this.scaleBegin,
      scaleEnd: scaleEnd ?? this.scaleEnd,
      rotationBegin: rotationBegin ?? this.rotationBegin,
      rotationEnd: rotationEnd ?? this.rotationEnd,
      flipBegin: flipBegin ?? this.flipBegin,
      flipEnd: flipEnd ?? this.flipEnd,
      zoomBegin: zoomBegin ?? this.zoomBegin,
      zoomEnd: zoomEnd ?? this.zoomEnd,
      slideBegin: slideBegin ?? this.slideBegin,
      slideEnd: slideEnd ?? this.slideEnd,
      fadeBegin: fadeBegin ?? this.fadeBegin,
      fadeEnd: fadeEnd ?? this.fadeEnd,
      customBuilder: customBuilder ?? this.customBuilder,
      transitionBuilder: transitionBuilder ?? this.transitionBuilder,
      reverseTransitionBuilder: reverseTransitionBuilder ?? this.reverseTransitionBuilder,
      maintainState: maintainState ?? this.maintainState,
      fullscreenDialog: fullscreenDialog ?? this.fullscreenDialog,
      opaque: opaque ?? this.opaque,
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      barrierColor: barrierColor ?? this.barrierColor,
      barrierLabel: barrierLabel ?? this.barrierLabel,
      useRootNavigator: useRootNavigator ?? this.useRootNavigator,
      anchorPoint: anchorPoint ?? this.anchorPoint,
      insetPadding: insetPadding ?? this.insetPadding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

/// A comprehensive page transition component
class AuiPageTransition extends PageRouteBuilder {
  AuiPageTransition({
    required this.config,
    required this.child,
    super.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: config.duration,
          reverseTransitionDuration: config.reverseDuration,
          maintainState: config.maintainState,
          fullscreenDialog: config.fullscreenDialog,
          opaque: config.opaque,
          barrierDismissible: config.barrierDismissible,
          barrierColor: config.barrierColor,
          barrierLabel: config.barrierLabel,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return _buildTransitionStatic(context, animation, secondaryAnimation, child, config);
          },
        );

  final AuiPageTransitionConfig config;
  final Widget child;

  static Widget _buildTransitionStatic(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    AuiPageTransitionConfig config,
  ) {
    if (config.customBuilder != null) {
      return config.customBuilder!(context, animation, secondaryAnimation, child);
    }

    if (config.transitionBuilder != null) {
      return config.transitionBuilder!(context, animation, secondaryAnimation, child);
    }

    return _buildDefaultTransitionStatic(context, animation, secondaryAnimation, child, config);
  }

  static Widget _buildDefaultTransitionStatic(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    AuiPageTransitionConfig config,
  ) {
    final curve = _getCurveStatic(config.curve);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    // Simplified transition implementation
    switch (config.type) {
      case AuiPageTransitionType.fade:
        return FadeTransition(opacity: curvedAnimation, child: child);
      case AuiPageTransitionType.slide:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      case AuiPageTransitionType.scale:
        return ScaleTransition(scale: curvedAnimation, child: child);
      case AuiPageTransitionType.rotation:
        return RotationTransition(turns: curvedAnimation, child: child);
      case AuiPageTransitionType.flip:
        return AnimatedBuilder(
          animation: curvedAnimation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(curvedAnimation.value * math.pi),
              child: child,
            );
          },
          child: child,
        );
      case AuiPageTransitionType.zoom:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        );
      case AuiPageTransitionType.slideUp:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      case AuiPageTransitionType.slideDown:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      case AuiPageTransitionType.slideLeft:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      case AuiPageTransitionType.slideRight:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      case AuiPageTransitionType.slideUpFade:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideDownFade:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideLeftFade:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideRightFade:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.scaleFade:
        return ScaleTransition(
          scale: curvedAnimation,
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.rotationFade:
        return RotationTransition(
          turns: curvedAnimation,
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.flipFade:
        return AnimatedBuilder(
          animation: curvedAnimation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(curvedAnimation.value * math.pi),
              child: FadeTransition(opacity: curvedAnimation, child: child),
            );
          },
          child: child,
        );
      case AuiPageTransitionType.zoomFade:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideUpScale:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(scale: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideDownScale:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(scale: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideLeftScale:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(scale: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideRightScale:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(scale: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideUpRotation:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: RotationTransition(turns: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideDownRotation:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: RotationTransition(turns: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideLeftRotation:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: RotationTransition(turns: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideRightRotation:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: RotationTransition(turns: curvedAnimation, child: child),
        );
      case AuiPageTransitionType.slideUpFlip:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: AnimatedBuilder(
            animation: curvedAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(curvedAnimation.value * math.pi),
                child: child,
              );
            },
            child: child,
          ),
        );
      case AuiPageTransitionType.slideDownFlip:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: AnimatedBuilder(
            animation: curvedAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(curvedAnimation.value * math.pi),
                child: child,
              );
            },
            child: child,
          ),
        );
      case AuiPageTransitionType.slideLeftFlip:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: AnimatedBuilder(
            animation: curvedAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(curvedAnimation.value * math.pi),
                child: child,
              );
            },
            child: child,
          ),
        );
      case AuiPageTransitionType.slideRightFlip:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: AnimatedBuilder(
            animation: curvedAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(curvedAnimation.value * math.pi),
                child: child,
              );
            },
            child: child,
          ),
        );
      case AuiPageTransitionType.slideUpZoom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      case AuiPageTransitionType.slideDownZoom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      case AuiPageTransitionType.slideLeftZoom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      case AuiPageTransitionType.slideRightZoom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      case AuiPageTransitionType.custom:
        return child;
    }
  }

  static Curve _getCurveStatic(AuiPageTransitionCurve curve) {
    switch (curve) {
      case AuiPageTransitionCurve.linear:
        return Curves.linear;
      case AuiPageTransitionCurve.ease:
        return Curves.ease;
      case AuiPageTransitionCurve.easeIn:
        return Curves.easeIn;
      case AuiPageTransitionCurve.easeOut:
        return Curves.easeOut;
      case AuiPageTransitionCurve.easeInOut:
        return Curves.easeInOut;
      case AuiPageTransitionCurve.fastOutSlowIn:
        return Curves.fastOutSlowIn;
      case AuiPageTransitionCurve.slowMiddle:
        return Curves.slowMiddle;
      case AuiPageTransitionCurve.bounceIn:
        return Curves.bounceIn;
      case AuiPageTransitionCurve.bounceOut:
        return Curves.bounceOut;
      case AuiPageTransitionCurve.bounceInOut:
        return Curves.bounceInOut;
      case AuiPageTransitionCurve.elasticIn:
        return Curves.elasticIn;
      case AuiPageTransitionCurve.elasticOut:
        return Curves.elasticOut;
      case AuiPageTransitionCurve.elasticInOut:
        return Curves.elasticInOut;
      case AuiPageTransitionCurve.backIn:
        return Curves.fastOutSlowIn;
      case AuiPageTransitionCurve.backOut:
        return Curves.fastOutSlowIn;
      case AuiPageTransitionCurve.backInOut:
        return Curves.fastOutSlowIn;
      case AuiPageTransitionCurve.decelerate:
        return Curves.decelerate;
      case AuiPageTransitionCurve.accelerate:
        return Curves.fastOutSlowIn;
      case AuiPageTransitionCurve.elastic:
        return Curves.elasticOut;
      case AuiPageTransitionCurve.bounce:
        return Curves.bounceOut;
      case AuiPageTransitionCurve.back:
        return Curves.fastOutSlowIn;
    }
  }

  Widget _buildFadeTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: config.fadeBegin,
        end: config.fadeEnd,
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildSlideTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: _getSlideOffset(config.direction),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildScaleTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: config.scaleBegin,
        end: config.scaleEnd,
      ).animate(animation),
      alignment: config.alignment,
      child: child,
    );
  }

  Widget _buildRotationTransition(Widget child, Animation<double> animation) {
    return RotationTransition(
      turns: Tween<double>(
        begin: config.rotationBegin,
        end: config.rotationEnd,
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildFlipTransition(Widget child, Animation<double> animation) {
    return Transform(
      alignment: config.alignment,
      transform: Matrix4.identity()
        ..setEntry(3, 2, config.perspective)
        ..rotateY(Tween<double>(
          begin: config.flipBegin,
          end: config.flipEnd,
        ).evaluate(animation)),
      child: child,
    );
  }

  Widget _buildZoomTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: config.zoomBegin,
        end: config.zoomEnd,
      ).animate(animation),
      alignment: config.alignment,
      child: child,
    );
  }

  Widget _buildSlideUpTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildSlideDownTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildSlideLeftTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildSlideRightTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildSlideUpFadeTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideDownFadeTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideLeftFadeTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideRightFadeTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildScaleFadeTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: config.scaleBegin,
        end: config.scaleEnd,
      ).animate(animation),
      alignment: config.alignment,
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildRotationFadeTransition(Widget child, Animation<double> animation) {
    return RotationTransition(
      turns: Tween<double>(
        begin: config.rotationBegin,
        end: config.rotationEnd,
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildFlipFadeTransition(Widget child, Animation<double> animation) {
    return Transform(
      alignment: config.alignment,
      transform: Matrix4.identity()
        ..setEntry(3, 2, config.perspective)
        ..rotateY(Tween<double>(
          begin: config.flipBegin,
          end: config.flipEnd,
        ).evaluate(animation)),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildZoomFadeTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: config.zoomBegin,
        end: config.zoomEnd,
      ).animate(animation),
      alignment: config.alignment,
      child: FadeTransition(
        opacity: Tween<double>(
          begin: config.fadeBegin,
          end: config.fadeEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideUpScaleTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.scaleBegin,
          end: config.scaleEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Widget _buildSlideDownScaleTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.scaleBegin,
          end: config.scaleEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Widget _buildSlideLeftScaleTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.scaleBegin,
          end: config.scaleEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Widget _buildSlideRightScaleTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.scaleBegin,
          end: config.scaleEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Widget _buildSlideUpRotationTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: RotationTransition(
        turns: Tween<double>(
          begin: config.rotationBegin,
          end: config.rotationEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideDownRotationTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(animation),
      child: RotationTransition(
        turns: Tween<double>(
          begin: config.rotationBegin,
          end: config.rotationEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideLeftRotationTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: RotationTransition(
        turns: Tween<double>(
          begin: config.rotationBegin,
          end: config.rotationEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideRightRotationTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: RotationTransition(
        turns: Tween<double>(
          begin: config.rotationBegin,
          end: config.rotationEnd,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildSlideUpFlipTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: Transform(
        alignment: config.alignment,
        transform: Matrix4.identity()
          ..setEntry(3, 2, config.perspective)
          ..rotateY(Tween<double>(
            begin: config.flipBegin,
            end: config.flipEnd,
          ).evaluate(animation)),
        child: child,
      ),
    );
  }

  Widget _buildSlideDownFlipTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(animation),
      child: Transform(
        alignment: config.alignment,
        transform: Matrix4.identity()
          ..setEntry(3, 2, config.perspective)
          ..rotateY(Tween<double>(
            begin: config.flipBegin,
            end: config.flipEnd,
          ).evaluate(animation)),
        child: child,
      ),
    );
  }

  Widget _buildSlideLeftFlipTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: Transform(
        alignment: config.alignment,
        transform: Matrix4.identity()
          ..setEntry(3, 2, config.perspective)
          ..rotateY(Tween<double>(
            begin: config.flipBegin,
            end: config.flipEnd,
          ).evaluate(animation)),
        child: child,
      ),
    );
  }

  Widget _buildSlideRightFlipTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: Transform(
        alignment: config.alignment,
        transform: Matrix4.identity()
          ..setEntry(3, 2, config.perspective)
          ..rotateY(Tween<double>(
            begin: config.flipBegin,
            end: config.flipEnd,
          ).evaluate(animation)),
        child: child,
      ),
    );
  }

  Widget _buildSlideUpZoomTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.zoomBegin,
          end: config.zoomEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Widget _buildSlideDownZoomTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.zoomBegin,
          end: config.zoomEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Widget _buildSlideLeftZoomTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.zoomBegin,
          end: config.zoomEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Widget _buildSlideRightZoomTransition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: config.zoomBegin,
          end: config.zoomEnd,
        ).animate(animation),
        alignment: config.alignment,
        child: child,
      ),
    );
  }

  Offset _getSlideOffset(AuiPageTransitionDirection direction) {
    switch (direction) {
      case AuiPageTransitionDirection.leftToRight:
        return const Offset(-1.0, 0.0);
      case AuiPageTransitionDirection.rightToLeft:
        return const Offset(1.0, 0.0);
      case AuiPageTransitionDirection.topToBottom:
        return const Offset(0.0, -1.0);
      case AuiPageTransitionDirection.bottomToTop:
        return const Offset(0.0, 1.0);
      case AuiPageTransitionDirection.center:
        return Offset.zero;
    }
  }
}

/// Page transition utilities
class AuiPageTransitionUtils {
  const AuiPageTransitionUtils._();

  /// Get default config for transition type
  static AuiPageTransitionConfig getDefaultConfig(AuiPageTransitionType type) {
    switch (type) {
      case AuiPageTransitionType.fade:
        return const AuiPageTransitionConfig(
          type: AuiPageTransitionType.fade,
          duration: Duration(milliseconds: 300),
          curve: AuiPageTransitionCurve.easeInOut,
        );
      case AuiPageTransitionType.slide:
        return const AuiPageTransitionConfig(
          type: AuiPageTransitionType.slide,
          direction: AuiPageTransitionDirection.rightToLeft,
          duration: Duration(milliseconds: 300),
          curve: AuiPageTransitionCurve.easeInOut,
        );
      case AuiPageTransitionType.scale:
        return const AuiPageTransitionConfig(
          type: AuiPageTransitionType.scale,
          scaleBegin: 0.0,
          scaleEnd: 1.0,
          duration: Duration(milliseconds: 300),
          curve: AuiPageTransitionCurve.easeInOut,
        );
      case AuiPageTransitionType.rotation:
        return const AuiPageTransitionConfig(
          type: AuiPageTransitionType.rotation,
          rotationBegin: 0.0,
          rotationEnd: 1.0,
          duration: Duration(milliseconds: 500),
          curve: AuiPageTransitionCurve.easeInOut,
        );
      case AuiPageTransitionType.flip:
        return const AuiPageTransitionConfig(
          type: AuiPageTransitionType.flip,
          flipBegin: 0.0,
          flipEnd: 3.14159,
          duration: Duration(milliseconds: 600),
          curve: AuiPageTransitionCurve.easeInOut,
        );
      case AuiPageTransitionType.zoom:
        return const AuiPageTransitionConfig(
          type: AuiPageTransitionType.zoom,
          zoomBegin: 0.0,
          zoomEnd: 1.0,
          duration: Duration(milliseconds: 300),
          curve: AuiPageTransitionCurve.easeInOut,
        );
      default:
        return const AuiPageTransitionConfig();
    }
  }

  /// Create custom transition
  static AuiPageTransition createCustomTransition({
    required Widget child,
    required Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) builder,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool opaque = true,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useRootNavigator = false,
    Offset? anchorPoint,
    EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    Clip clipBehavior = Clip.none,
    RouteSettings? settings,
  }) {
    return AuiPageTransition(
      config: AuiPageTransitionConfig(
        type: AuiPageTransitionType.custom,
        customBuilder: builder,
        duration: duration,
        reverseDuration: reverseDuration,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        opaque: opaque,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: barrierLabel,
        useRootNavigator: useRootNavigator,
        anchorPoint: anchorPoint,
        insetPadding: insetPadding,
        clipBehavior: clipBehavior,
      ),
      child: child,
      settings: settings,
    );
  }

  /// Navigate with transition
  static Future<T?> navigateWithTransition<T extends Object?>(
    BuildContext context,
    Widget page, {
    AuiPageTransitionType type = AuiPageTransitionType.slide,
    AuiPageTransitionConfig? config,
    bool replace = false,
    bool clearStack = false,
  }) {
    final effectiveConfig = config ?? getDefaultConfig(type);
    
    if (replace) {
      return Navigator.of(context).pushReplacement(
        AuiPageTransition(
          config: effectiveConfig,
          child: page,
        ) as Route<T>,
      );
    } else if (clearStack) {
      return Navigator.of(context).pushAndRemoveUntil(
        AuiPageTransition(
          config: effectiveConfig,
          child: page,
        ) as Route<T>,
        (route) => false,
      );
    } else {
      return Navigator.of(context).push(
        AuiPageTransition(
          config: effectiveConfig,
          child: page,
        ) as Route<T>,
      );
    }
  }
}
