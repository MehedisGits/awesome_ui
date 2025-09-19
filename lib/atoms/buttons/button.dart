import 'package:flutter/material.dart';
import '../../foundation/theme.dart';
import '../../foundation/motion.dart';
import '../../foundation/elevation.dart';

/// Button variants for different use cases
enum AuiButtonVariant {
  solid,
  tonal,
  outline,
  ghost,
  link,
}

/// Button emphasis levels
enum AuiButtonEmphasis {
  primary,
  secondary,
  danger,
  warning,
  success,
  neutral,
}

/// Button sizes
enum AuiButtonSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Button states
enum AuiButtonState {
  enabled,
  disabled,
  loading,
  pressed,
  hovered,
  focused,
}

/// A comprehensive button component with multiple variants, sizes, and states
class AuiButton extends StatefulWidget {
  const AuiButton({
    super.key,
    required this.child,
    this.onPressed,
    this.variant = AuiButtonVariant.solid,
    this.emphasis = AuiButtonEmphasis.primary,
    this.size = AuiButtonSize.md,
    this.icon,
    this.iconPosition = AuiIconPosition.start,
    this.fullWidth = false,
    this.loading = false,
    this.disabled = false,
    this.tooltip,
    this.semanticLabel,
    this.focusNode,
    this.autofocus = false,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
  });
  
  final Widget child;
  final VoidCallback? onPressed;
  final AuiButtonVariant variant;
  final AuiButtonEmphasis emphasis;
  final AuiButtonSize size;
  final Widget? icon;
  final AuiIconPosition iconPosition;
  final bool fullWidth;
  final bool loading;
  final bool disabled;
  final String? tooltip;
  final String? semanticLabel;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  
  @override
  State<AuiButton> createState() => _AuiButtonState();
}

class _AuiButtonState extends State<AuiButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  
  bool _isPressed = false;
  bool _isHovered = false;
  bool _isFocused = false;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AuiMotion.fast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: AuiCurves.standardDecelerate,
    ));
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
  void _handleTapDown(TapDownDetails details) {
    if (!_isDisabled) {
      setState(() {
        _isPressed = true;
      });
      _animationController.forward();
    }
  }
  
  void _handleTapUp(TapUpDetails details) {
    if (!_isDisabled) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
  }
  
  void _handleTapCancel() {
    if (!_isDisabled) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
  }
  
  void _handleTap() {
    if (!_isDisabled && widget.onPressed != null) {
      widget.onPressed!();
    }
  }
  
  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    widget.onHover?.call(isHovered);
  }
  
  void _handleFocusChange(bool isFocused) {
    setState(() {
      _isFocused = isFocused;
    });
    widget.onFocusChange?.call(isFocused);
  }
  
  bool get _isDisabled => widget.disabled || widget.loading || widget.onPressed == null;
  
  AuiButtonState get _currentState {
    if (_isDisabled) return AuiButtonState.disabled;
    if (widget.loading) return AuiButtonState.loading;
    if (_isPressed) return AuiButtonState.pressed;
    if (_isHovered) return AuiButtonState.hovered;
    if (_isFocused) return AuiButtonState.focused;
    return AuiButtonState.enabled;
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final typography = theme.typography;
    
    final buttonStyle = _getButtonStyle(colors, spacing, typography);
    final content = _buildContent(typography);
    
    Widget button = GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: widget.fullWidth ? double.infinity : null,
              height: buttonStyle.height,
              decoration: BoxDecoration(
                color: buttonStyle.backgroundColor,
                borderRadius: BorderRadius.circular(buttonStyle.borderRadius),
                border: buttonStyle.border,
                boxShadow: buttonStyle.shadows,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _isDisabled ? null : _handleTap,
                  onLongPress: _isDisabled ? null : widget.onLongPress,
                  onHover: _handleHover,
                  onFocusChange: _handleFocusChange,
                  focusNode: widget.focusNode,
                  autofocus: widget.autofocus,
                  borderRadius: BorderRadius.circular(buttonStyle.borderRadius),
                  child: Center(
                    child: content,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    
    if (widget.tooltip != null && !_isDisabled) {
      button = Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }
    
    return Semantics(
      label: widget.semanticLabel,
      button: true,
      enabled: !_isDisabled,
      child: button,
    );
  }
  
  AuiButtonStyle _getButtonStyle(
    AuiColorScheme colors,
    AuiSpacingScheme spacing,
    AuiTypographyScheme typography,
  ) {
    final state = _currentState;
    final variant = widget.variant;
    final emphasis = widget.emphasis;
    final size = widget.size;
    
    // Get colors based on variant and emphasis
    Color backgroundColor;
    Color foregroundColor;
    Color? borderColor;
    List<BoxShadow> shadows;
    
    switch (variant) {
      case AuiButtonVariant.solid:
        backgroundColor = _getSolidColor(colors, emphasis, state);
        foregroundColor = _getSolidForegroundColor(colors, emphasis, state);
        borderColor = null;
        shadows = _getSolidShadows(emphasis, state);
        break;
      case AuiButtonVariant.tonal:
        backgroundColor = _getTonalColor(colors, emphasis, state);
        foregroundColor = _getTonalForegroundColor(colors, emphasis, state);
        borderColor = null;
        shadows = _getTonalShadows(emphasis, state);
        break;
      case AuiButtonVariant.outline:
        backgroundColor = _getOutlineColor(colors, emphasis, state);
        foregroundColor = _getOutlineForegroundColor(colors, emphasis, state);
        borderColor = _getOutlineBorderColor(colors, emphasis, state);
        shadows = _getOutlineShadows(emphasis, state);
        break;
      case AuiButtonVariant.ghost:
        backgroundColor = _getGhostColor(colors, emphasis, state);
        foregroundColor = _getGhostForegroundColor(colors, emphasis, state);
        borderColor = null;
        shadows = _getGhostShadows(emphasis, state);
        break;
      case AuiButtonVariant.link:
        backgroundColor = Colors.transparent;
        foregroundColor = _getLinkForegroundColor(colors, emphasis, state);
        borderColor = null;
        shadows = [];
        break;
    }
    
    // Get size properties
    final height = _getHeight(size);
    final borderRadius = _getBorderRadius(size);
    final padding = _getPadding(size, spacing);
    
    return AuiButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      shadows: shadows,
      height: height,
      borderRadius: borderRadius,
      padding: padding,
    );
  }
  
  Widget _buildContent(AuiTypographyScheme typography) {
    final size = widget.size;
    final textStyle = _getTextStyle(typography, size);
    final iconSize = _getIconSize(size);
    
    final children = <Widget>[];
    
    if (widget.loading) {
      children.add(
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              _getButtonStyle(
                context.auiTheme.colors,
                context.auiTheme.spacing,
                typography,
              ).foregroundColor,
            ),
          ),
        ),
      );
      if (widget.child is Text) {
        children.add(SizedBox(width: _getSpacing(size)));
        children.add(DefaultTextStyle(
          style: textStyle,
          child: widget.child,
        ));
      }
    } else {
      if (widget.icon != null && widget.iconPosition == AuiIconPosition.start) {
        children.add(
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: IconTheme(
              data: IconThemeData(
                size: iconSize,
                color: _getButtonStyle(
                  context.auiTheme.colors,
                  context.auiTheme.spacing,
                  typography,
                ).foregroundColor,
              ),
              child: widget.icon!,
            ),
          ),
        );
        children.add(SizedBox(width: _getSpacing(size)));
      }
      
      children.add(
        DefaultTextStyle(
          style: textStyle,
          child: widget.child,
        ),
      );
      
      if (widget.icon != null && widget.iconPosition == AuiIconPosition.end) {
        children.add(SizedBox(width: _getSpacing(size)));
        children.add(
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: IconTheme(
              data: IconThemeData(
                size: iconSize,
                color: _getButtonStyle(
                  context.auiTheme.colors,
                  context.auiTheme.spacing,
                  typography,
                ).foregroundColor,
              ),
              child: widget.icon!,
            ),
          ),
        );
      }
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
  
  // Color getters for different variants
  Color _getSolidColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.primary;
      case AuiButtonEmphasis.secondary:
        return colors.secondary;
      case AuiButtonEmphasis.danger:
        return colors.error;
      case AuiButtonEmphasis.warning:
        return colors.warning;
      case AuiButtonEmphasis.success:
        return colors.success;
      case AuiButtonEmphasis.neutral:
        return colors.surfaceVariant;
    }
  }
  
  Color _getSolidForegroundColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.onSurfaceVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.onPrimary;
      case AuiButtonEmphasis.secondary:
        return colors.onSecondary;
      case AuiButtonEmphasis.danger:
        return colors.onError;
      case AuiButtonEmphasis.warning:
        return colors.onWarning;
      case AuiButtonEmphasis.success:
        return colors.onSuccess;
      case AuiButtonEmphasis.neutral:
        return colors.onSurfaceVariant;
    }
  }
  
  Color _getTonalColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.primaryContainer;
      case AuiButtonEmphasis.secondary:
        return colors.secondaryContainer;
      case AuiButtonEmphasis.danger:
        return colors.errorContainer;
      case AuiButtonEmphasis.warning:
        return colors.warningContainer;
      case AuiButtonEmphasis.success:
        return colors.successContainer;
      case AuiButtonEmphasis.neutral:
        return colors.surfaceVariant;
    }
  }
  
  Color _getTonalForegroundColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.onSurfaceVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.onPrimaryContainer;
      case AuiButtonEmphasis.secondary:
        return colors.onSecondaryContainer;
      case AuiButtonEmphasis.danger:
        return colors.onErrorContainer;
      case AuiButtonEmphasis.warning:
        return colors.onWarningContainer;
      case AuiButtonEmphasis.success:
        return colors.onSuccessContainer;
      case AuiButtonEmphasis.neutral:
        return colors.onSurfaceVariant;
    }
  }
  
  Color _getOutlineColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    return Colors.transparent;
  }
  
  Color _getOutlineForegroundColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.onSurfaceVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.primary;
      case AuiButtonEmphasis.secondary:
        return colors.secondary;
      case AuiButtonEmphasis.danger:
        return colors.error;
      case AuiButtonEmphasis.warning:
        return colors.warning;
      case AuiButtonEmphasis.success:
        return colors.success;
      case AuiButtonEmphasis.neutral:
        return colors.onSurfaceVariant;
    }
  }
  
  Color _getOutlineBorderColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.outlineVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.primary;
      case AuiButtonEmphasis.secondary:
        return colors.secondary;
      case AuiButtonEmphasis.danger:
        return colors.error;
      case AuiButtonEmphasis.warning:
        return colors.warning;
      case AuiButtonEmphasis.success:
        return colors.success;
      case AuiButtonEmphasis.neutral:
        return colors.outline;
    }
  }
  
  Color _getGhostColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return Colors.transparent;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.primary.withValues(alpha: 0.1);
      case AuiButtonEmphasis.secondary:
        return colors.secondary.withValues(alpha: 0.1);
      case AuiButtonEmphasis.danger:
        return colors.error.withValues(alpha: 0.1);
      case AuiButtonEmphasis.warning:
        return colors.warning.withValues(alpha: 0.1);
      case AuiButtonEmphasis.success:
        return colors.success.withValues(alpha: 0.1);
      case AuiButtonEmphasis.neutral:
        return colors.surfaceVariant.withValues(alpha: 0.1);
    }
  }
  
  Color _getGhostForegroundColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.onSurfaceVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.primary;
      case AuiButtonEmphasis.secondary:
        return colors.secondary;
      case AuiButtonEmphasis.danger:
        return colors.error;
      case AuiButtonEmphasis.warning:
        return colors.warning;
      case AuiButtonEmphasis.success:
        return colors.success;
      case AuiButtonEmphasis.neutral:
        return colors.onSurfaceVariant;
    }
  }
  
  Color _getLinkForegroundColor(AuiColorScheme colors, AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) {
      return colors.onSurfaceVariant;
    }
    
    switch (emphasis) {
      case AuiButtonEmphasis.primary:
        return colors.primary;
      case AuiButtonEmphasis.secondary:
        return colors.secondary;
      case AuiButtonEmphasis.danger:
        return colors.error;
      case AuiButtonEmphasis.warning:
        return colors.warning;
      case AuiButtonEmphasis.success:
        return colors.success;
      case AuiButtonEmphasis.neutral:
        return colors.onSurfaceVariant;
    }
  }
  
  // Shadow getters
  List<BoxShadow> _getSolidShadows(AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) return [];
    return AuiShadows.level1;
  }
  
  List<BoxShadow> _getTonalShadows(AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) return [];
    return AuiShadows.level0;
  }
  
  List<BoxShadow> _getOutlineShadows(AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) return [];
    return AuiShadows.level0;
  }
  
  List<BoxShadow> _getGhostShadows(AuiButtonEmphasis emphasis, AuiButtonState state) {
    if (state == AuiButtonState.disabled) return [];
    return AuiShadows.level0;
  }
  
  // Size getters
  double _getHeight(AuiButtonSize size) {
    switch (size) {
      case AuiButtonSize.xs:
        return 24.0;
      case AuiButtonSize.sm:
        return 32.0;
      case AuiButtonSize.md:
        return 40.0;
      case AuiButtonSize.lg:
        return 48.0;
      case AuiButtonSize.xl:
        return 56.0;
    }
  }
  
  double _getBorderRadius(AuiButtonSize size) {
    switch (size) {
      case AuiButtonSize.xs:
        return 4.0;
      case AuiButtonSize.sm:
        return 6.0;
      case AuiButtonSize.md:
        return 8.0;
      case AuiButtonSize.lg:
        return 10.0;
      case AuiButtonSize.xl:
        return 12.0;
    }
  }
  
  EdgeInsets _getPadding(AuiButtonSize size, AuiSpacingScheme spacing) {
    switch (size) {
      case AuiButtonSize.xs:
        return EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs);
      case AuiButtonSize.sm:
        return EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm);
      case AuiButtonSize.md:
        return EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.sm);
      case AuiButtonSize.lg:
        return EdgeInsets.symmetric(horizontal: spacing.xl, vertical: spacing.md);
      case AuiButtonSize.xl:
        return EdgeInsets.symmetric(horizontal: spacing.xxl, vertical: spacing.md);
    }
  }
  
  TextStyle _getTextStyle(AuiTypographyScheme typography, AuiButtonSize size) {
    switch (size) {
      case AuiButtonSize.xs:
        return typography.buttonSmall;
      case AuiButtonSize.sm:
        return typography.buttonSmall;
      case AuiButtonSize.md:
        return typography.buttonMedium;
      case AuiButtonSize.lg:
        return typography.buttonLarge;
      case AuiButtonSize.xl:
        return typography.buttonLarge;
    }
  }
  
  double _getIconSize(AuiButtonSize size) {
    switch (size) {
      case AuiButtonSize.xs:
        return 16.0;
      case AuiButtonSize.sm:
        return 18.0;
      case AuiButtonSize.md:
        return 20.0;
      case AuiButtonSize.lg:
        return 22.0;
      case AuiButtonSize.xl:
        return 24.0;
    }
  }
  
  double _getSpacing(AuiButtonSize size) {
    switch (size) {
      case AuiButtonSize.xs:
        return 4.0;
      case AuiButtonSize.sm:
        return 6.0;
      case AuiButtonSize.md:
        return 8.0;
      case AuiButtonSize.lg:
        return 10.0;
      case AuiButtonSize.xl:
        return 12.0;
    }
  }
}

/// Icon position for buttons
enum AuiIconPosition {
  start,
  end,
}

/// Button style data class
class AuiButtonStyle {
  const AuiButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
    this.border,
    required this.shadows,
    required this.height,
    required this.borderRadius,
    required this.padding,
  });
  
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final Border? border;
  final List<BoxShadow> shadows;
  final double height;
  final double borderRadius;
  final EdgeInsets padding;
}

/// Convenience constructors for common button types
class AuiButtonHelpers {
  /// Primary solid button
  static Widget primary({
    required Widget child,
    VoidCallback? onPressed,
    AuiButtonSize size = AuiButtonSize.md,
    Widget? icon,
    AuiIconPosition iconPosition = AuiIconPosition.start,
    bool fullWidth = false,
    bool loading = false,
    bool disabled = false,
    String? tooltip,
    String? semanticLabel,
    FocusNode? focusNode,
    bool autofocus = false,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
  }) {
    return AuiButton(
      onPressed: onPressed,
      variant: AuiButtonVariant.solid,
      emphasis: AuiButtonEmphasis.primary,
      size: size,
      icon: icon,
      iconPosition: iconPosition,
      fullWidth: fullWidth,
      loading: loading,
      disabled: disabled,
      tooltip: tooltip,
      semanticLabel: semanticLabel,
      focusNode: focusNode,
      autofocus: autofocus,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      child: child,
    );
  }
}