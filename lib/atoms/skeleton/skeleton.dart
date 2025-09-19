import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Skeleton variants for different content types
enum AuiSkeletonVariant {
  text,
  circular,
  rectangular,
  rounded,
  custom,
}

/// Skeleton sizes
enum AuiSkeletonSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Skeleton animation types
enum AuiSkeletonAnimation {
  shimmer,
  pulse,
  wave,
  none,
}

/// A comprehensive skeleton loading component
class AuiSkeleton extends StatefulWidget {
  const AuiSkeleton({
    super.key,
    this.variant = AuiSkeletonVariant.rectangular,
    this.size = AuiSkeletonSize.md,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.highlightColor,
    this.baseColor,
    this.animation = AuiSkeletonAnimation.shimmer,
    this.animationDuration,
    this.animationCurve,
    this.isLoading = true,
    this.child,
    this.semanticLabel,
  });

  final AuiSkeletonVariant variant;
  final AuiSkeletonSize size;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? highlightColor;
  final Color? baseColor;
  final AuiSkeletonAnimation animation;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final bool isLoading;
  final Widget? child;
  final String? semanticLabel;

  @override
  State<AuiSkeleton> createState() => _AuiSkeletonState();
}

class _AuiSkeletonState extends State<AuiSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve ?? Curves.easeInOut,
    ));
    
    if (widget.isLoading && widget.animation != AuiSkeletonAnimation.none) {
      _animationController.repeat();
    }
  }

  @override
  void didUpdateWidget(AuiSkeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading && widget.animation != AuiSkeletonAnimation.none) {
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading && widget.child != null) {
      return widget.child!;
    }

    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    
    // Get skeleton colors
    final skeletonColor = _getSkeletonColor(colors);
    final highlightColor = _getHighlightColor(colors);
    final baseColor = _getBaseColor(colors);
    
    // Get skeleton dimensions
    final skeletonWidth = _getSkeletonWidth();
    final skeletonHeight = _getSkeletonHeight();
    
    // Get border radius
    final skeletonBorderRadius = _getBorderRadius(spacing);
    
    Widget skeletonWidget = Container(
      width: skeletonWidth,
      height: skeletonHeight,
      decoration: BoxDecoration(
        color: skeletonColor,
        borderRadius: skeletonBorderRadius,
      ),
    );
    
    // Apply animation
    if (widget.animation != AuiSkeletonAnimation.none) {
      skeletonWidget = _applyAnimation(skeletonWidget, highlightColor, baseColor);
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      skeletonWidget = Semantics(
        label: widget.semanticLabel,
        child: skeletonWidget,
      );
    }
    
    return skeletonWidget;
  }
  
  /// Apply animation to skeleton widget
  Widget _applyAnimation(Widget skeletonWidget, Color highlightColor, Color baseColor) {
    switch (widget.animation) {
      case AuiSkeletonAnimation.shimmer:
        return _buildShimmerAnimation(skeletonWidget, highlightColor, baseColor);
      case AuiSkeletonAnimation.pulse:
        return _buildPulseAnimation(skeletonWidget, highlightColor, baseColor);
      case AuiSkeletonAnimation.wave:
        return _buildWaveAnimation(skeletonWidget, highlightColor, baseColor);
      case AuiSkeletonAnimation.none:
        return skeletonWidget;
    }
  }
  
  /// Build shimmer animation
  Widget _buildShimmerAnimation(Widget skeletonWidget, Color highlightColor, Color baseColor) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                0.0,
                _animation.value,
                1.0,
              ],
            ),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
          ),
          child: skeletonWidget,
        );
      },
    );
  }
  
  /// Build pulse animation
  Widget _buildPulseAnimation(Widget skeletonWidget, Color highlightColor, Color baseColor) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Color.lerp(baseColor, highlightColor, _animation.value),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
          ),
          child: skeletonWidget,
        );
      },
    );
  }
  
  /// Build wave animation
  Widget _buildWaveAnimation(Widget skeletonWidget, Color highlightColor, Color baseColor) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                0.0,
                _animation.value,
                1.0,
              ],
            ),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
          ),
          child: skeletonWidget,
        );
      },
    );
  }
  
  /// Get skeleton color
  Color _getSkeletonColor(AuiColorScheme colors) {
    return widget.color ?? colors.surfaceVariant;
  }
  
  /// Get highlight color
  Color _getHighlightColor(AuiColorScheme colors) {
    return widget.highlightColor ?? colors.surface;
  }
  
  /// Get base color
  Color _getBaseColor(AuiColorScheme colors) {
    return widget.baseColor ?? colors.surfaceVariant;
  }
  
  /// Get skeleton width
  double _getSkeletonWidth() {
    if (widget.width != null) return widget.width!;
    
    switch (widget.variant) {
      case AuiSkeletonVariant.text:
        return _getTextWidth();
      case AuiSkeletonVariant.circular:
        return _getCircularSize();
      case AuiSkeletonVariant.rectangular:
        return _getRectangularWidth();
      case AuiSkeletonVariant.rounded:
        return _getRoundedWidth();
      case AuiSkeletonVariant.custom:
        return 100.0; // Default width for custom
    }
  }
  
  /// Get skeleton height
  double _getSkeletonHeight() {
    if (widget.height != null) return widget.height!;
    
    switch (widget.variant) {
      case AuiSkeletonVariant.text:
        return _getTextHeight();
      case AuiSkeletonVariant.circular:
        return _getCircularSize();
      case AuiSkeletonVariant.rectangular:
        return _getRectangularHeight();
      case AuiSkeletonVariant.rounded:
        return _getRoundedHeight();
      case AuiSkeletonVariant.custom:
        return 20.0; // Default height for custom
    }
  }
  
  /// Get text width based on size
  double _getTextWidth() {
    switch (widget.size) {
      case AuiSkeletonSize.xs:
        return 60.0;
      case AuiSkeletonSize.sm:
        return 80.0;
      case AuiSkeletonSize.md:
        return 120.0;
      case AuiSkeletonSize.lg:
        return 160.0;
      case AuiSkeletonSize.xl:
        return 200.0;
    }
  }
  
  /// Get text height based on size
  double _getTextHeight() {
    switch (widget.size) {
      case AuiSkeletonSize.xs:
        return 12.0;
      case AuiSkeletonSize.sm:
        return 14.0;
      case AuiSkeletonSize.md:
        return 16.0;
      case AuiSkeletonSize.lg:
        return 18.0;
      case AuiSkeletonSize.xl:
        return 20.0;
    }
  }
  
  /// Get circular size based on size
  double _getCircularSize() {
    switch (widget.size) {
      case AuiSkeletonSize.xs:
        return 24.0;
      case AuiSkeletonSize.sm:
        return 32.0;
      case AuiSkeletonSize.md:
        return 40.0;
      case AuiSkeletonSize.lg:
        return 48.0;
      case AuiSkeletonSize.xl:
        return 56.0;
    }
  }
  
  /// Get rectangular width based on size
  double _getRectangularWidth() {
    switch (widget.size) {
      case AuiSkeletonSize.xs:
        return 80.0;
      case AuiSkeletonSize.sm:
        return 120.0;
      case AuiSkeletonSize.md:
        return 160.0;
      case AuiSkeletonSize.lg:
        return 200.0;
      case AuiSkeletonSize.xl:
        return 240.0;
    }
  }
  
  /// Get rectangular height based on size
  double _getRectangularHeight() {
    switch (widget.size) {
      case AuiSkeletonSize.xs:
        return 16.0;
      case AuiSkeletonSize.sm:
        return 20.0;
      case AuiSkeletonSize.md:
        return 24.0;
      case AuiSkeletonSize.lg:
        return 28.0;
      case AuiSkeletonSize.xl:
        return 32.0;
    }
  }
  
  /// Get rounded width based on size
  double _getRoundedWidth() {
    return _getRectangularWidth();
  }
  
  /// Get rounded height based on size
  double _getRoundedHeight() {
    return _getRectangularHeight();
  }
  
  /// Get border radius based on variant and size
  BorderRadius _getBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.variant) {
      case AuiSkeletonVariant.text:
        return BorderRadius.circular(2.0);
      case AuiSkeletonVariant.circular:
        return BorderRadius.circular(_getCircularSize() / 2);
      case AuiSkeletonVariant.rectangular:
        return BorderRadius.circular(4.0);
      case AuiSkeletonVariant.rounded:
        return BorderRadius.circular(spacing.sm);
      case AuiSkeletonVariant.custom:
        return BorderRadius.circular(4.0);
    }
  }
}

/// Skeleton text component
class AuiSkeletonText extends StatelessWidget {
  const AuiSkeletonText({
    super.key,
    this.lines = 1,
    this.size = AuiSkeletonSize.md,
    this.width,
    this.height,
    this.spacing = 8.0,
    this.color,
    this.highlightColor,
    this.baseColor,
    this.animation = AuiSkeletonAnimation.shimmer,
    this.animationDuration,
    this.animationCurve,
    this.isLoading = true,
    this.children,
  });

  final int lines;
  final AuiSkeletonSize size;
  final double? width;
  final double? height;
  final double spacing;
  final Color? color;
  final Color? highlightColor;
  final Color? baseColor;
  final AuiSkeletonAnimation animation;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final bool isLoading;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    if (!isLoading && children != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children!,
      );
    }

    final skeletons = List.generate(lines, (index) {
      return AuiSkeleton(
        variant: AuiSkeletonVariant.text,
        size: size,
        width: width,
        height: height,
        color: color,
        highlightColor: highlightColor,
        baseColor: baseColor,
        animation: animation,
        animationDuration: animationDuration,
        animationCurve: animationCurve,
        isLoading: isLoading,
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skeletons
          .expand((skeleton) => [skeleton, SizedBox(height: spacing)])
          .take(skeletons.length * 2 - 1)
          .toList(),
    );
  }
}

/// Skeleton card component
class AuiSkeletonCard extends StatelessWidget {
  const AuiSkeletonCard({
    super.key,
    this.size = AuiSkeletonSize.md,
    this.width,
    this.height,
    this.padding = 16.0,
    this.spacing = 12.0,
    this.color,
    this.highlightColor,
    this.baseColor,
    this.animation = AuiSkeletonAnimation.shimmer,
    this.animationDuration,
    this.animationCurve,
    this.isLoading = true,
    this.child,
  });

  final AuiSkeletonSize size;
  final double? width;
  final double? height;
  final double padding;
  final double spacing;
  final Color? color;
  final Color? highlightColor;
  final Color? baseColor;
  final AuiSkeletonAnimation animation;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (!isLoading && child != null) {
      return child!;
    }

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuiSkeleton(
            variant: AuiSkeletonVariant.rectangular,
            size: size,
            height: 20.0,
            color: color,
            highlightColor: highlightColor,
            baseColor: baseColor,
            animation: animation,
            animationDuration: animationDuration,
            animationCurve: animationCurve,
            isLoading: isLoading,
          ),
          SizedBox(height: spacing),
          AuiSkeletonText(
            lines: 3,
            size: size,
            color: color,
            highlightColor: highlightColor,
            baseColor: baseColor,
            animation: animation,
            animationDuration: animationDuration,
            animationCurve: animationCurve,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}

/// Skeleton utilities
class AuiSkeletonUtils {
  const AuiSkeletonUtils._();
  
  /// Get skeleton size from enum
  static double getSkeletonSize(AuiSkeletonSize size) {
    switch (size) {
      case AuiSkeletonSize.xs:
        return 12.0;
      case AuiSkeletonSize.sm:
        return 16.0;
      case AuiSkeletonSize.md:
        return 20.0;
      case AuiSkeletonSize.lg:
        return 24.0;
      case AuiSkeletonSize.xl:
        return 28.0;
    }
  }
  
  /// Get skeleton color
  static Color getSkeletonColor(AuiColorScheme colors) {
    return colors.surfaceVariant;
  }
  
  /// Get highlight color
  static Color getHighlightColor(AuiColorScheme colors) {
    return colors.surface;
  }
  
  /// Get base color
  static Color getBaseColor(AuiColorScheme colors) {
    return colors.surfaceVariant;
  }
  
  /// Get animation duration
  static Duration getAnimationDuration() {
    return const Duration(milliseconds: 1500);
  }
  
  /// Get animation curve
  static Curve getAnimationCurve() {
    return Curves.easeInOut;
  }
}
