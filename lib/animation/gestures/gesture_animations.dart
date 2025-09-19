import 'package:flutter/material.dart';

/// Gesture animation types
enum AuiGestureAnimationType {
  tap,
  longPress,
  doubleTap,
  pan,
  scale,
  rotation,
  drag,
  swipe,
  pinch,
  custom,
}

/// Gesture animation directions
enum AuiGestureAnimationDirection {
  up,
  down,
  left,
  right,
  in_,
  out,
  clockwise,
  counterclockwise,
}

/// Gesture animation configuration
class AuiGestureAnimationConfig {
  const AuiGestureAnimationConfig({
    this.type = AuiGestureAnimationType.tap,
    this.direction = AuiGestureAnimationDirection.in_,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.delay = Duration.zero,
    this.scale = 1.0,
    this.rotation = 0.0,
    this.opacity = 1.0,
    this.offset = Offset.zero,
    this.alignment = Alignment.center,
    this.perspective = 0.001,
    this.axis = Axis.vertical,
    this.intensity = 1.0,
    this.frequency = 1.0,
    this.amplitude = 1.0,
    this.damping = 0.8,
    this.stiffness = 100.0,
    this.mass = 1.0,
    this.friction = 0.1,
    this.tension = 100.0,
    this.enabled = true,
    this.autoTrigger = false,
    this.triggerOnTap = false,
    this.triggerOnLongPress = false,
    this.triggerOnDoubleTap = false,
    this.triggerOnPan = false,
    this.triggerOnScale = false,
    this.triggerOnRotation = false,
    this.triggerOnDrag = false,
    this.triggerOnSwipe = false,
    this.triggerOnPinch = false,
    this.customBuilder,
  });

  final AuiGestureAnimationType type;
  final AuiGestureAnimationDirection direction;
  final Duration duration;
  final Curve curve;
  final Duration delay;
  final double scale;
  final double rotation;
  final double opacity;
  final Offset offset;
  final Alignment alignment;
  final double perspective;
  final Axis axis;
  final double intensity;
  final double frequency;
  final double amplitude;
  final double damping;
  final double stiffness;
  final double mass;
  final double friction;
  final double tension;
  final bool enabled;
  final bool autoTrigger;
  final bool triggerOnTap;
  final bool triggerOnLongPress;
  final bool triggerOnDoubleTap;
  final bool triggerOnPan;
  final bool triggerOnScale;
  final bool triggerOnRotation;
  final bool triggerOnDrag;
  final bool triggerOnSwipe;
  final bool triggerOnPinch;
  final Widget Function(BuildContext context, Animation<double> animation, Widget child)? customBuilder;

  AuiGestureAnimationConfig copyWith({
    AuiGestureAnimationType? type,
    AuiGestureAnimationDirection? direction,
    Duration? duration,
    Curve? curve,
    Duration? delay,
    double? scale,
    double? rotation,
    double? opacity,
    Offset? offset,
    Alignment? alignment,
    double? perspective,
    Axis? axis,
    double? intensity,
    double? frequency,
    double? amplitude,
    double? damping,
    double? stiffness,
    double? mass,
    double? friction,
    double? tension,
    bool? enabled,
    bool? autoTrigger,
    bool? triggerOnTap,
    bool? triggerOnLongPress,
    bool? triggerOnDoubleTap,
    bool? triggerOnPan,
    bool? triggerOnScale,
    bool? triggerOnRotation,
    bool? triggerOnDrag,
    bool? triggerOnSwipe,
    bool? triggerOnPinch,
    Widget Function(BuildContext context, Animation<double> animation, Widget child)? customBuilder,
  }) {
    return AuiGestureAnimationConfig(
      type: type ?? this.type,
      direction: direction ?? this.direction,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      delay: delay ?? this.delay,
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      opacity: opacity ?? this.opacity,
      offset: offset ?? this.offset,
      alignment: alignment ?? this.alignment,
      perspective: perspective ?? this.perspective,
      axis: axis ?? this.axis,
      intensity: intensity ?? this.intensity,
      frequency: frequency ?? this.frequency,
      amplitude: amplitude ?? this.amplitude,
      damping: damping ?? this.damping,
      stiffness: stiffness ?? this.stiffness,
      mass: mass ?? this.mass,
      friction: friction ?? this.friction,
      tension: tension ?? this.tension,
      enabled: enabled ?? this.enabled,
      autoTrigger: autoTrigger ?? this.autoTrigger,
      triggerOnTap: triggerOnTap ?? this.triggerOnTap,
      triggerOnLongPress: triggerOnLongPress ?? this.triggerOnLongPress,
      triggerOnDoubleTap: triggerOnDoubleTap ?? this.triggerOnDoubleTap,
      triggerOnPan: triggerOnPan ?? this.triggerOnPan,
      triggerOnScale: triggerOnScale ?? this.triggerOnScale,
      triggerOnRotation: triggerOnRotation ?? this.triggerOnRotation,
      triggerOnDrag: triggerOnDrag ?? this.triggerOnDrag,
      triggerOnSwipe: triggerOnSwipe ?? this.triggerOnSwipe,
      triggerOnPinch: triggerOnPinch ?? this.triggerOnPinch,
      customBuilder: customBuilder ?? this.customBuilder,
    );
  }
}

/// A comprehensive gesture animation component
class AuiGestureAnimation extends StatefulWidget {
  const AuiGestureAnimation({
    super.key,
    required this.child,
    this.config = const AuiGestureAnimationConfig(),
    this.onCompleted,
    this.onCancelled,
    this.onTriggered,
  });

  final Widget child;
  final AuiGestureAnimationConfig config;
  final VoidCallback? onCompleted;
  final VoidCallback? onCancelled;
  final VoidCallback? onTriggered;

  @override
  State<AuiGestureAnimation> createState() => _AuiGestureAnimationState();
}

class _AuiGestureAnimationState extends State<AuiGestureAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeController();
    _setupTriggers();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeController() {
    _controller = AnimationController(
      duration: widget.config.duration,
      vsync: this,
    );
    
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.config.curve,
    );
    
    _controller.addStatusListener(_onAnimationStatusChanged);
  }

  void _setupTriggers() {
    if (widget.config.autoTrigger) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _trigger();
      });
    }
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
        break;
      case AnimationStatus.reverse:
        break;
      case AnimationStatus.completed:
        widget.onCompleted?.call();
        break;
      case AnimationStatus.dismissed:
        break;
    }
  }

  void _trigger() {
    if (!widget.config.enabled) return;
    
    widget.onTriggered?.call();
    
    if (widget.config.delay > Duration.zero) {
      Future.delayed(widget.config.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.config.enabled) return widget.child;
    
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return _buildAnimatedChild();
      },
    );
  }

  Widget _buildAnimatedChild() {
    if (widget.config.customBuilder != null) {
      return widget.config.customBuilder!(context, _animation, widget.child);
    }

    switch (widget.config.type) {
      case AuiGestureAnimationType.tap:
        return _buildTapGesture();
      case AuiGestureAnimationType.longPress:
        return _buildLongPressGesture();
      case AuiGestureAnimationType.doubleTap:
        return _buildDoubleTapGesture();
      case AuiGestureAnimationType.pan:
        return _buildPanGesture();
      case AuiGestureAnimationType.scale:
        return _buildScaleGesture();
      case AuiGestureAnimationType.rotation:
        return _buildRotationGesture();
      case AuiGestureAnimationType.drag:
        return _buildDragGesture();
      case AuiGestureAnimationType.swipe:
        return _buildSwipeGesture();
      case AuiGestureAnimationType.pinch:
        return _buildPinchGesture();
      case AuiGestureAnimationType.custom:
        return widget.child;
    }
  }

  Widget _buildTapGesture() {
    return GestureDetector(
      onTap: () {
        if (widget.config.triggerOnTap) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildLongPressGesture() {
    return GestureDetector(
      onLongPress: () {
        if (widget.config.triggerOnLongPress) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildDoubleTapGesture() {
    return GestureDetector(
      onDoubleTap: () {
        if (widget.config.triggerOnDoubleTap) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildPanGesture() {
    return GestureDetector(
      onPanStart: (_) {
        if (widget.config.triggerOnPan) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildScaleGesture() {
    return GestureDetector(
      onScaleStart: (_) {
        if (widget.config.triggerOnScale) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildRotationGesture() {
    return GestureDetector(
      onScaleStart: (_) {
        if (widget.config.triggerOnRotation) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildDragGesture() {
    return GestureDetector(
      onPanStart: (_) {
        if (widget.config.triggerOnDrag) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildSwipeGesture() {
    return GestureDetector(
      onPanStart: (_) {
        if (widget.config.triggerOnSwipe) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildPinchGesture() {
    return GestureDetector(
      onScaleStart: (_) {
        if (widget.config.triggerOnPinch) {
          _trigger();
        }
      },
      child: _buildAnimation(),
    );
  }

  Widget _buildAnimation() {
    return Transform.scale(
      scale: 1.0 + (widget.config.scale - 1.0) * _animation.value,
      child: Transform.rotate(
        angle: widget.config.rotation * _animation.value,
        child: Transform.translate(
          offset: widget.config.offset * _animation.value,
          child: Opacity(
            opacity: 1.0 - (1.0 - widget.config.opacity) * _animation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

/// Gesture animation utilities
class AuiGestureAnimationUtils {
  const AuiGestureAnimationUtils._();

  /// Get default config for gesture animation type
  static AuiGestureAnimationConfig getDefaultConfig(AuiGestureAnimationType type) {
    switch (type) {
      case AuiGestureAnimationType.tap:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.tap,
          scale: 0.95,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          triggerOnTap: true,
        );
      case AuiGestureAnimationType.longPress:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.longPress,
          scale: 1.1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnLongPress: true,
        );
      case AuiGestureAnimationType.doubleTap:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.doubleTap,
          scale: 1.2,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          triggerOnDoubleTap: true,
        );
      case AuiGestureAnimationType.pan:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.pan,
          scale: 1.05,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          triggerOnPan: true,
        );
      case AuiGestureAnimationType.scale:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.scale,
          scale: 1.1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnScale: true,
        );
      case AuiGestureAnimationType.rotation:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.rotation,
          rotation: 0.1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnRotation: true,
        );
      case AuiGestureAnimationType.drag:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.drag,
          scale: 1.05,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          triggerOnDrag: true,
        );
      case AuiGestureAnimationType.swipe:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.swipe,
          offset: Offset(20, 0),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnSwipe: true,
        );
      case AuiGestureAnimationType.pinch:
        return const AuiGestureAnimationConfig(
          type: AuiGestureAnimationType.pinch,
          scale: 1.1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnPinch: true,
        );
      case AuiGestureAnimationType.custom:
        return const AuiGestureAnimationConfig();
    }
  }
}
