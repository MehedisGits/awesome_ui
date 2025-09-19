import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Animation types
enum AuiAnimationType {
  fade,
  scale,
  slide,
  rotate,
  bounce,
  shake,
  pulse,
  glow,
  ripple,
  morph,
  reveal,
  hide,
  custom,
}

/// Animation directions
enum AuiAnimationDirection {
  up,
  down,
  left,
  right,
  in_,
  out,
  clockwise,
  counterclockwise,
}

/// Animation configuration
class AuiAnimationConfig {
  const AuiAnimationConfig({
    this.type = AuiAnimationType.fade,
    this.direction = AuiAnimationDirection.in_,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.delay = Duration.zero,
    this.repeat = false,
    this.reverse = false,
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
    this.customBuilder,
  });

  final AuiAnimationType type;
  final AuiAnimationDirection direction;
  final Duration duration;
  final Curve curve;
  final Duration delay;
  final bool repeat;
  final bool reverse;
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
  final Widget Function(BuildContext context, Animation<double> animation, Widget child)? customBuilder;

  AuiAnimationConfig copyWith({
    AuiAnimationType? type,
    AuiAnimationDirection? direction,
    Duration? duration,
    Curve? curve,
    Duration? delay,
    bool? repeat,
    bool? reverse,
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
    Widget Function(BuildContext context, Animation<double> animation, Widget child)? customBuilder,
  }) {
    return AuiAnimationConfig(
      type: type ?? this.type,
      direction: direction ?? this.direction,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      delay: delay ?? this.delay,
      repeat: repeat ?? this.repeat,
      reverse: reverse ?? this.reverse,
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
      customBuilder: customBuilder ?? this.customBuilder,
    );
  }
}

/// A comprehensive animation component
class AuiAnimation extends StatefulWidget {
  const AuiAnimation({
    super.key,
    required this.child,
    this.config = const AuiAnimationConfig(),
    this.onCompleted,
    this.onCancelled,
    this.onTriggered,
  });

  final Widget child;
  final AuiAnimationConfig config;
  final VoidCallback? onCompleted;
  final VoidCallback? onCancelled;
  final VoidCallback? onTriggered;

  @override
  State<AuiAnimation> createState() => _AuiAnimationState();
}

class _AuiAnimationState extends State<AuiAnimation>
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
      case AuiAnimationType.fade:
        return _buildFadeAnimation();
      case AuiAnimationType.scale:
        return _buildScaleAnimation();
      case AuiAnimationType.slide:
        return _buildSlideAnimation();
      case AuiAnimationType.rotate:
        return _buildRotateAnimation();
      case AuiAnimationType.bounce:
        return _buildBounceAnimation();
      case AuiAnimationType.shake:
        return _buildShakeAnimation();
      case AuiAnimationType.pulse:
        return _buildPulseAnimation();
      case AuiAnimationType.glow:
        return _buildGlowAnimation();
      case AuiAnimationType.ripple:
        return _buildRippleAnimation();
      case AuiAnimationType.morph:
        return _buildMorphAnimation();
      case AuiAnimationType.reveal:
        return _buildRevealAnimation();
      case AuiAnimationType.hide:
        return _buildHideAnimation();
      case AuiAnimationType.custom:
        return widget.child;
    }
  }

  Widget _buildFadeAnimation() {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.0,
        end: widget.config.opacity,
      ).animate(_animation),
      child: widget.child,
    );
  }

  Widget _buildScaleAnimation() {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: widget.config.scale,
      ).animate(_animation),
      alignment: widget.config.alignment,
      child: widget.child,
    );
  }

  Widget _buildSlideAnimation() {
    return SlideTransition(
      position: Tween<Offset>(
        begin: _getSlideOffset(widget.config.direction),
        end: Offset.zero,
      ).animate(_animation),
      child: widget.child,
    );
  }

  Widget _buildRotateAnimation() {
    return RotationTransition(
      turns: Tween<double>(
        begin: 0.0,
        end: widget.config.rotation,
      ).animate(_animation),
      child: widget.child,
    );
  }

  Widget _buildBounceAnimation() {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: widget.config.scale,
      ).animate(CurvedAnimation(
        parent: _animation,
        curve: Curves.elasticOut,
      )),
      alignment: widget.config.alignment,
      child: widget.child,
    );
  }

  Widget _buildShakeAnimation() {
    return Transform.translate(
      offset: Offset(
        widget.config.amplitude * 
        math.sin(widget.config.frequency * _animation.value * 2 * 3.14159) * 
        _animation.value,
        0,
      ),
      child: widget.child,
    );
  }

  Widget _buildPulseAnimation() {
    return Transform.scale(
      scale: 1.0 + (widget.config.scale - 1.0) * 
        (0.5 + 0.5 * math.cos(widget.config.frequency * _animation.value * 2 * 3.14159)),
      child: widget.child,
    );
  }

  Widget _buildGlowAnimation() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 20.0 * _animation.value,
            spreadRadius: 5.0 * _animation.value,
          ),
        ],
      ),
      child: widget.child,
    );
  }

  Widget _buildRippleAnimation() {
    return CustomPaint(
      painter: _RipplePainter(
        progress: _animation.value,
        color: Colors.blue,
        radius: 100.0 * _animation.value,
      ),
      child: widget.child,
    );
  }

  Widget _buildMorphAnimation() {
    return AnimatedContainer(
      duration: widget.config.duration,
      curve: widget.config.curve,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0 * _animation.value),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0 * _animation.value,
            spreadRadius: 2.0 * _animation.value,
            offset: Offset(0, 4.0 * _animation.value),
          ),
        ],
      ),
      child: widget.child,
    );
  }

  Widget _buildRevealAnimation() {
    return ClipRect(
      child: Align(
        alignment: _getAlignmentFromDirection(widget.config.direction),
        heightFactor: _getHeightFactorFromDirection(widget.config.direction) * _animation.value,
        widthFactor: _getWidthFactorFromDirection(widget.config.direction) * _animation.value,
        child: widget.child,
      ),
    );
  }

  Widget _buildHideAnimation() {
    return ClipRect(
      child: Align(
        alignment: _getAlignmentFromDirection(widget.config.direction),
        heightFactor: _getHeightFactorFromDirection(widget.config.direction) * (1.0 - _animation.value),
        widthFactor: _getWidthFactorFromDirection(widget.config.direction) * (1.0 - _animation.value),
        child: widget.child,
      ),
    );
  }

  Offset _getSlideOffset(AuiAnimationDirection direction) {
    switch (direction) {
      case AuiAnimationDirection.up:
        return const Offset(0.0, 1.0);
      case AuiAnimationDirection.down:
        return const Offset(0.0, -1.0);
      case AuiAnimationDirection.left:
        return const Offset(1.0, 0.0);
      case AuiAnimationDirection.right:
        return const Offset(-1.0, 0.0);
      case AuiAnimationDirection.in_:
        return const Offset(0.0, 0.0);
      case AuiAnimationDirection.out:
        return const Offset(0.0, 0.0);
      case AuiAnimationDirection.clockwise:
        return const Offset(0.0, 0.0);
      case AuiAnimationDirection.counterclockwise:
        return const Offset(0.0, 0.0);
    }
  }

  Alignment _getAlignmentFromDirection(AuiAnimationDirection direction) {
    switch (direction) {
      case AuiAnimationDirection.up:
        return Alignment.bottomCenter;
      case AuiAnimationDirection.down:
        return Alignment.topCenter;
      case AuiAnimationDirection.left:
        return Alignment.centerRight;
      case AuiAnimationDirection.right:
        return Alignment.centerLeft;
      case AuiAnimationDirection.in_:
        return Alignment.center;
      case AuiAnimationDirection.out:
        return Alignment.center;
      case AuiAnimationDirection.clockwise:
        return Alignment.center;
      case AuiAnimationDirection.counterclockwise:
        return Alignment.center;
    }
  }

  double _getHeightFactorFromDirection(AuiAnimationDirection direction) {
    switch (direction) {
      case AuiAnimationDirection.up:
      case AuiAnimationDirection.down:
        return 1.0;
      case AuiAnimationDirection.left:
      case AuiAnimationDirection.right:
        return 1.0;
      case AuiAnimationDirection.in_:
      case AuiAnimationDirection.out:
        return 1.0;
      case AuiAnimationDirection.clockwise:
      case AuiAnimationDirection.counterclockwise:
        return 1.0;
    }
  }

  double _getWidthFactorFromDirection(AuiAnimationDirection direction) {
    switch (direction) {
      case AuiAnimationDirection.up:
      case AuiAnimationDirection.down:
        return 1.0;
      case AuiAnimationDirection.left:
      case AuiAnimationDirection.right:
        return 1.0;
      case AuiAnimationDirection.in_:
      case AuiAnimationDirection.out:
        return 1.0;
      case AuiAnimationDirection.clockwise:
      case AuiAnimationDirection.counterclockwise:
        return 1.0;
    }
  }
}

/// Ripple painter for ripple animation
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

/// Animation utilities
class AuiAnimationUtils {
  const AuiAnimationUtils._();

  /// Get default config for animation type
  static AuiAnimationConfig getDefaultConfig(AuiAnimationType type) {
    switch (type) {
      case AuiAnimationType.fade:
        return const AuiAnimationConfig(
          type: AuiAnimationType.fade,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.scale:
        return const AuiAnimationConfig(
          type: AuiAnimationType.scale,
          scale: 1.0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.slide:
        return const AuiAnimationConfig(
          type: AuiAnimationType.slide,
          direction: AuiAnimationDirection.up,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.rotate:
        return const AuiAnimationConfig(
          type: AuiAnimationType.rotate,
          rotation: 1.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.bounce:
        return const AuiAnimationConfig(
          type: AuiAnimationType.bounce,
          scale: 1.0,
          duration: Duration(milliseconds: 600),
          curve: Curves.elasticOut,
        );
      case AuiAnimationType.shake:
        return const AuiAnimationConfig(
          type: AuiAnimationType.shake,
          amplitude: 10.0,
          frequency: 2.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.pulse:
        return const AuiAnimationConfig(
          type: AuiAnimationType.pulse,
          scale: 1.1,
          frequency: 2.0,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          repeat: true,
        );
      case AuiAnimationType.glow:
        return const AuiAnimationConfig(
          type: AuiAnimationType.glow,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.ripple:
        return const AuiAnimationConfig(
          type: AuiAnimationType.ripple,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.morph:
        return const AuiAnimationConfig(
          type: AuiAnimationType.morph,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.reveal:
        return const AuiAnimationConfig(
          type: AuiAnimationType.reveal,
          direction: AuiAnimationDirection.up,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.hide:
        return const AuiAnimationConfig(
          type: AuiAnimationType.hide,
          direction: AuiAnimationDirection.down,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      case AuiAnimationType.custom:
        return const AuiAnimationConfig();
    }
  }
}
