import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Micro-interaction types
enum AuiMicroInteractionType {
  hover,
  press,
  focus,
  drag,
  swipe,
  tap,
  longPress,
  doubleTap,
  scale,
  rotate,
  fade,
  slide,
  bounce,
  shake,
  pulse,
  glow,
  ripple,
  morph,
  reveal,
  hide,
}

/// Micro-interaction states
enum AuiMicroInteractionState {
  idle,
  hover,
  pressed,
  focused,
  dragging,
  swiping,
  animating,
  completed,
  cancelled,
}

/// Micro-interaction directions
enum AuiMicroInteractionDirection {
  up,
  down,
  left,
  right,
  in_,
  out,
  clockwise,
  counterclockwise,
}

/// Micro-interaction configuration
class AuiMicroInteractionConfig {
  const AuiMicroInteractionConfig({
    this.type = AuiMicroInteractionType.hover,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.delay = Duration.zero,
    this.repeat = false,
    this.reverse = false,
    this.scale = 1.0,
    this.rotation = 0.0,
    this.opacity = 1.0,
    this.offset = Offset.zero,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.elevation = 0.0,
    this.borderRadius = 0.0,
    this.borderWidth = 0.0,
    this.blurRadius = 0.0,
    this.spreadRadius = 0.0,
    this.direction = AuiMicroInteractionDirection.in_,
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
    this.triggerOnMount = false,
    this.triggerOnUnmount = false,
    this.triggerOnVisibilityChange = false,
    this.triggerOnFocus = false,
    this.triggerOnHover = false,
    this.triggerOnPress = false,
    this.triggerOnDrag = false,
    this.triggerOnSwipe = false,
    this.triggerOnTap = false,
    this.triggerOnLongPress = false,
    this.triggerOnDoubleTap = false,
  });

  final AuiMicroInteractionType type;
  final Duration duration;
  final Curve curve;
  final Duration delay;
  final bool repeat;
  final bool reverse;
  final double scale;
  final double rotation;
  final double opacity;
  final Offset offset;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double elevation;
  final double borderRadius;
  final double borderWidth;
  final double blurRadius;
  final double spreadRadius;
  final AuiMicroInteractionDirection direction;
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
  final bool triggerOnMount;
  final bool triggerOnUnmount;
  final bool triggerOnVisibilityChange;
  final bool triggerOnFocus;
  final bool triggerOnHover;
  final bool triggerOnPress;
  final bool triggerOnDrag;
  final bool triggerOnSwipe;
  final bool triggerOnTap;
  final bool triggerOnLongPress;
  final bool triggerOnDoubleTap;

  /// Copy with new values
  AuiMicroInteractionConfig copyWith({
    AuiMicroInteractionType? type,
    Duration? duration,
    Curve? curve,
    Duration? delay,
    bool? repeat,
    bool? reverse,
    double? scale,
    double? rotation,
    double? opacity,
    Offset? offset,
    Color? color,
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    double? elevation,
    double? borderRadius,
    double? borderWidth,
    double? blurRadius,
    double? spreadRadius,
    AuiMicroInteractionDirection? direction,
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
    bool? triggerOnMount,
    bool? triggerOnUnmount,
    bool? triggerOnVisibilityChange,
    bool? triggerOnFocus,
    bool? triggerOnHover,
    bool? triggerOnPress,
    bool? triggerOnDrag,
    bool? triggerOnSwipe,
    bool? triggerOnTap,
    bool? triggerOnLongPress,
    bool? triggerOnDoubleTap,
  }) {
    return AuiMicroInteractionConfig(
      type: type ?? this.type,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      delay: delay ?? this.delay,
      repeat: repeat ?? this.repeat,
      reverse: reverse ?? this.reverse,
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      opacity: opacity ?? this.opacity,
      offset: offset ?? this.offset,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      blurRadius: blurRadius ?? this.blurRadius,
      spreadRadius: spreadRadius ?? this.spreadRadius,
      direction: direction ?? this.direction,
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
      triggerOnMount: triggerOnMount ?? this.triggerOnMount,
      triggerOnUnmount: triggerOnUnmount ?? this.triggerOnUnmount,
      triggerOnVisibilityChange: triggerOnVisibilityChange ?? this.triggerOnVisibilityChange,
      triggerOnFocus: triggerOnFocus ?? this.triggerOnFocus,
      triggerOnHover: triggerOnHover ?? this.triggerOnHover,
      triggerOnPress: triggerOnPress ?? this.triggerOnPress,
      triggerOnDrag: triggerOnDrag ?? this.triggerOnDrag,
      triggerOnSwipe: triggerOnSwipe ?? this.triggerOnSwipe,
      triggerOnTap: triggerOnTap ?? this.triggerOnTap,
      triggerOnLongPress: triggerOnLongPress ?? this.triggerOnLongPress,
      triggerOnDoubleTap: triggerOnDoubleTap ?? this.triggerOnDoubleTap,
    );
  }
}

/// A comprehensive micro-interactions component
class AuiMicroInteraction extends StatefulWidget {
  const AuiMicroInteraction({
    super.key,
    required this.child,
    this.config = const AuiMicroInteractionConfig(),
    this.onStateChanged,
    this.onCompleted,
    this.onCancelled,
    this.onTriggered,
  });

  final Widget child;
  final AuiMicroInteractionConfig config;
  final ValueChanged<AuiMicroInteractionState>? onStateChanged;
  final VoidCallback? onCompleted;
  final VoidCallback? onCancelled;
  final VoidCallback? onTriggered;

  @override
  State<AuiMicroInteraction> createState() => _AuiMicroInteractionState();
}

class _AuiMicroInteractionState extends State<AuiMicroInteraction>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  AuiMicroInteractionState _state = AuiMicroInteractionState.idle;

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
        _setState(AuiMicroInteractionState.animating);
        break;
      case AnimationStatus.reverse:
        _setState(AuiMicroInteractionState.animating);
        break;
      case AnimationStatus.completed:
        _setState(AuiMicroInteractionState.completed);
        widget.onCompleted?.call();
        break;
      case AnimationStatus.dismissed:
        _setState(AuiMicroInteractionState.idle);
        break;
    }
  }

  void _setState(AuiMicroInteractionState newState) {
    if (_state != newState) {
      setState(() {
        _state = newState;
      });
      widget.onStateChanged?.call(newState);
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


  void _reverse() {
    _controller.reverse();
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
    Widget animatedChild = widget.child;
    
    // Apply transformations based on interaction type
    switch (widget.config.type) {
      case AuiMicroInteractionType.hover:
        animatedChild = _buildHoverInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.press:
        animatedChild = _buildPressInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.focus:
        animatedChild = _buildFocusInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.drag:
        animatedChild = _buildDragInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.swipe:
        animatedChild = _buildSwipeInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.tap:
        animatedChild = _buildTapInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.longPress:
        animatedChild = _buildLongPressInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.doubleTap:
        animatedChild = _buildDoubleTapInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.scale:
        animatedChild = _buildScaleInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.rotate:
        animatedChild = _buildRotateInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.fade:
        animatedChild = _buildFadeInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.slide:
        animatedChild = _buildSlideInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.bounce:
        animatedChild = _buildBounceInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.shake:
        animatedChild = _buildShakeInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.pulse:
        animatedChild = _buildPulseInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.glow:
        animatedChild = _buildGlowInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.ripple:
        animatedChild = _buildRippleInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.morph:
        animatedChild = _buildMorphInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.reveal:
        animatedChild = _buildRevealInteraction(animatedChild);
        break;
      case AuiMicroInteractionType.hide:
        animatedChild = _buildHideInteraction(animatedChild);
        break;
    }
    
    return animatedChild;
  }

  Widget _buildHoverInteraction(Widget child) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.config.triggerOnHover) {
          _trigger();
        }
      },
      onExit: (_) {
        if (widget.config.triggerOnHover) {
          _reverse();
        }
      },
      child: Transform.scale(
        scale: 1.0 + (widget.config.scale - 1.0) * _animation.value,
        child: child,
      ),
    );
  }

  Widget _buildPressInteraction(Widget child) {
    return GestureDetector(
      onTapDown: (_) {
        if (widget.config.triggerOnPress) {
          _trigger();
        }
      },
      onTapUp: (_) {
        if (widget.config.triggerOnPress) {
          _reverse();
        }
      },
      onTapCancel: () {
        if (widget.config.triggerOnPress) {
          _reverse();
        }
      },
      child: Transform.scale(
        scale: 1.0 + (widget.config.scale - 1.0) * _animation.value,
        child: child,
      ),
    );
  }

  Widget _buildFocusInteraction(Widget child) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (widget.config.triggerOnFocus) {
          if (hasFocus) {
            _trigger();
          } else {
            _reverse();
          }
        }
      },
      child: child,
    );
  }

  Widget _buildDragInteraction(Widget child) {
    return GestureDetector(
      onPanStart: (_) {
        if (widget.config.triggerOnDrag) {
          _trigger();
        }
      },
      onPanEnd: (_) {
        if (widget.config.triggerOnDrag) {
          _reverse();
        }
      },
      child: Transform.translate(
        offset: widget.config.offset * _animation.value,
        child: child,
      ),
    );
  }

  Widget _buildSwipeInteraction(Widget child) {
    return GestureDetector(
      onPanStart: (_) {
        if (widget.config.triggerOnSwipe) {
          _trigger();
        }
      },
      onPanEnd: (_) {
        if (widget.config.triggerOnSwipe) {
          _reverse();
        }
      },
      child: Transform.translate(
        offset: widget.config.offset * _animation.value,
        child: child,
      ),
    );
  }

  Widget _buildTapInteraction(Widget child) {
    return GestureDetector(
      onTap: () {
        if (widget.config.triggerOnTap) {
          _trigger();
        }
      },
      child: child,
    );
  }

  Widget _buildLongPressInteraction(Widget child) {
    return GestureDetector(
      onLongPress: () {
        if (widget.config.triggerOnLongPress) {
          _trigger();
        }
      },
      child: child,
    );
  }

  Widget _buildDoubleTapInteraction(Widget child) {
    return GestureDetector(
      onDoubleTap: () {
        if (widget.config.triggerOnDoubleTap) {
          _trigger();
        }
      },
      child: child,
    );
  }

  Widget _buildScaleInteraction(Widget child) {
    return Transform.scale(
      scale: 1.0 + (widget.config.scale - 1.0) * _animation.value,
      child: child,
    );
  }

  Widget _buildRotateInteraction(Widget child) {
    return Transform.rotate(
      angle: widget.config.rotation * _animation.value,
      child: child,
    );
  }

  Widget _buildFadeInteraction(Widget child) {
    return Opacity(
      opacity: 1.0 - (1.0 - widget.config.opacity) * _animation.value,
      child: child,
    );
  }

  Widget _buildSlideInteraction(Widget child) {
    return Transform.translate(
      offset: widget.config.offset * _animation.value,
      child: child,
    );
  }

  Widget _buildBounceInteraction(Widget child) {
    return Transform.scale(
      scale: 1.0 + (widget.config.scale - 1.0) * _animation.value,
      child: child,
    );
  }

  Widget _buildShakeInteraction(Widget child) {
    return Transform.translate(
      offset: Offset(
        widget.config.amplitude * 
        math.sin(widget.config.frequency * _animation.value * 2 * 3.14159) * 
        _animation.value,
        0,
      ),
      child: child,
    );
  }

  Widget _buildPulseInteraction(Widget child) {
    return Transform.scale(
      scale: 1.0 + (widget.config.scale - 1.0) * 
        (0.5 + 0.5 * math.cos(widget.config.frequency * _animation.value * 2 * 3.14159)),
      child: child,
    );
  }

  Widget _buildGlowInteraction(Widget child) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: widget.config.shadowColor ?? Colors.blue,
            blurRadius: widget.config.blurRadius * _animation.value,
            spreadRadius: widget.config.spreadRadius * _animation.value,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildRippleInteraction(Widget child) {
    return CustomPaint(
      painter: _RipplePainter(
        progress: _animation.value,
        color: widget.config.color ?? Colors.blue,
        radius: widget.config.borderRadius * _animation.value,
      ),
      child: child,
    );
  }

  Widget _buildMorphInteraction(Widget child) {
    return AnimatedContainer(
      duration: widget.config.duration,
      curve: widget.config.curve,
      decoration: BoxDecoration(
        color: widget.config.backgroundColor,
        borderRadius: BorderRadius.circular(widget.config.borderRadius * _animation.value),
        border: widget.config.borderWidth > 0
            ? Border.all(
                color: widget.config.borderColor ?? Colors.black,
                width: widget.config.borderWidth * _animation.value,
              )
            : null,
        boxShadow: widget.config.elevation > 0
            ? [
                BoxShadow(
                  color: widget.config.shadowColor ?? Colors.black,
                  blurRadius: widget.config.blurRadius * _animation.value,
                  spreadRadius: widget.config.spreadRadius * _animation.value,
                  offset: Offset(0, widget.config.elevation * _animation.value),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }

  Widget _buildRevealInteraction(Widget child) {
    return ClipRect(
      child: Align(
        alignment: _getAlignmentFromDirection(widget.config.direction),
        heightFactor: _getHeightFactorFromDirection(widget.config.direction) * _animation.value,
        widthFactor: _getWidthFactorFromDirection(widget.config.direction) * _animation.value,
        child: child,
      ),
    );
  }

  Widget _buildHideInteraction(Widget child) {
    return ClipRect(
      child: Align(
        alignment: _getAlignmentFromDirection(widget.config.direction),
        heightFactor: _getHeightFactorFromDirection(widget.config.direction) * (1.0 - _animation.value),
        widthFactor: _getWidthFactorFromDirection(widget.config.direction) * (1.0 - _animation.value),
        child: child,
      ),
    );
  }

  Alignment _getAlignmentFromDirection(AuiMicroInteractionDirection direction) {
    switch (direction) {
      case AuiMicroInteractionDirection.up:
        return Alignment.bottomCenter;
      case AuiMicroInteractionDirection.down:
        return Alignment.topCenter;
      case AuiMicroInteractionDirection.left:
        return Alignment.centerRight;
      case AuiMicroInteractionDirection.right:
        return Alignment.centerLeft;
      case AuiMicroInteractionDirection.in_:
        return Alignment.center;
      case AuiMicroInteractionDirection.out:
        return Alignment.center;
      case AuiMicroInteractionDirection.clockwise:
        return Alignment.center;
      case AuiMicroInteractionDirection.counterclockwise:
        return Alignment.center;
    }
  }

  double _getHeightFactorFromDirection(AuiMicroInteractionDirection direction) {
    switch (direction) {
      case AuiMicroInteractionDirection.up:
      case AuiMicroInteractionDirection.down:
        return 1.0;
      case AuiMicroInteractionDirection.left:
      case AuiMicroInteractionDirection.right:
        return 1.0;
      case AuiMicroInteractionDirection.in_:
      case AuiMicroInteractionDirection.out:
        return 1.0;
      case AuiMicroInteractionDirection.clockwise:
      case AuiMicroInteractionDirection.counterclockwise:
        return 1.0;
    }
  }

  double _getWidthFactorFromDirection(AuiMicroInteractionDirection direction) {
    switch (direction) {
      case AuiMicroInteractionDirection.up:
      case AuiMicroInteractionDirection.down:
        return 1.0;
      case AuiMicroInteractionDirection.left:
      case AuiMicroInteractionDirection.right:
        return 1.0;
      case AuiMicroInteractionDirection.in_:
      case AuiMicroInteractionDirection.out:
        return 1.0;
      case AuiMicroInteractionDirection.clockwise:
      case AuiMicroInteractionDirection.counterclockwise:
        return 1.0;
    }
  }
}

/// Ripple painter for ripple interaction
class _RipplePainter extends CustomPainter {
  const _RipplePainter({
    required this.progress,
    required this.color,
    required this.radius,
  });

  final double progress;
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha:0.3 * (1.0 - progress))
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final currentRadius = radius * progress;

    canvas.drawCircle(center, currentRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Micro-interaction utilities
class AuiMicroInteractionUtils {
  const AuiMicroInteractionUtils._();

  /// Get default config for interaction type
  static AuiMicroInteractionConfig getDefaultConfig(AuiMicroInteractionType type) {
    switch (type) {
      case AuiMicroInteractionType.hover:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.hover,
          scale: 1.05,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnHover: true,
        );
      case AuiMicroInteractionType.press:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.press,
          scale: 0.95,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          triggerOnPress: true,
        );
      case AuiMicroInteractionType.focus:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.focus,
          elevation: 2.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnFocus: true,
        );
      case AuiMicroInteractionType.drag:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.drag,
          scale: 1.1,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          triggerOnDrag: true,
        );
      case AuiMicroInteractionType.swipe:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.swipe,
          offset: Offset(20, 0),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnSwipe: true,
        );
      case AuiMicroInteractionType.tap:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.tap,
          scale: 0.9,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          triggerOnTap: true,
        );
      case AuiMicroInteractionType.longPress:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.longPress,
          scale: 1.1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          triggerOnLongPress: true,
        );
      case AuiMicroInteractionType.doubleTap:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.doubleTap,
          scale: 1.2,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          triggerOnDoubleTap: true,
        );
      case AuiMicroInteractionType.scale:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.scale,
          scale: 1.2,
          duration: Duration(milliseconds: 300),
          curve: Curves.elasticOut,
        );
      case AuiMicroInteractionType.rotate:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.rotate,
          rotation: 0.5,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.fade:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.fade,
          opacity: 0.0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.slide:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.slide,
          offset: Offset(0, -50),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.bounce:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.bounce,
          scale: 1.3,
          duration: Duration(milliseconds: 600),
          curve: Curves.elasticOut,
        );
      case AuiMicroInteractionType.shake:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.shake,
          amplitude: 10.0,
          frequency: 2.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.pulse:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.pulse,
          scale: 1.1,
          frequency: 2.0,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          repeat: true,
        );
      case AuiMicroInteractionType.glow:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.glow,
          blurRadius: 20.0,
          spreadRadius: 5.0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.ripple:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.ripple,
          borderRadius: 100.0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.morph:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.morph,
          borderRadius: 20.0,
          elevation: 4.0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.reveal:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.reveal,
          direction: AuiMicroInteractionDirection.up,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiMicroInteractionType.hide:
        return const AuiMicroInteractionConfig(
          type: AuiMicroInteractionType.hide,
          direction: AuiMicroInteractionDirection.down,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    }
  }

  /// Create spring animation curve
  static Curve createSpringCurve({
    double damping = 0.8,
    double stiffness = 100.0,
    double mass = 1.0,
  }) {
    return Curves.easeInOut; // Simplified for now
  }

  /// Create bounce animation curve
  static Curve createBounceCurve({
    double intensity = 1.0,
    double frequency = 1.0,
  }) {
    return Curves.elasticOut;
  }

  /// Create elastic animation curve
  static Curve createElasticCurve({
    double damping = 0.8,
    double stiffness = 100.0,
  }) {
    return Curves.elasticOut;
  }
}
