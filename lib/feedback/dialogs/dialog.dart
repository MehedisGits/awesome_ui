import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Dialog variants
enum AuiDialogVariant {
  filled,
  outlined,
  elevated,
  tonal,
  minimal,
}

/// Dialog sizes
enum AuiDialogSize {
  xs,
  sm,
  md,
  lg,
  xl,
  fullscreen,
}

/// Dialog types
enum AuiDialogType {
  alert,
  confirmation,
  information,
  warning,
  error,
  success,
  custom,
}

/// Dialog states
enum AuiDialogState {
  enabled,
  disabled,
  loading,
  error,
}

/// Dialog button configuration
class AuiDialogButton {
  const AuiDialogButton({
    required this.text,
    this.onPressed,
    this.icon,
    this.variant = AuiDialogButtonVariant.filled,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.semanticLabel,
    this.tooltip,
    this.enabled = true,
    this.visible = true,
    this.isDestructive = false,
    this.isPrimary = false,
    this.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final AuiDialogButtonVariant variant;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? semanticLabel;
  final String? tooltip;
  final bool enabled;
  final bool visible;
  final bool isDestructive;
  final bool isPrimary;
  final Key? key;
}

/// Dialog button variants
enum AuiDialogButtonVariant {
  filled,
  outlined,
  text,
  tonal,
}

/// A comprehensive dialog component
class AuiDialog extends StatefulWidget {
  const AuiDialog({
    super.key,
    this.title,
    this.subtitle,
    this.content,
    this.actions,
    this.icon,
    this.image,
    this.variant = AuiDialogVariant.elevated,
    this.size = AuiDialogSize.md,
    this.type = AuiDialogType.custom,
    this.state = AuiDialogState.enabled,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel,
    this.useSafeArea = true,
    this.useRootNavigator = false,
    this.anchorPoint,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
    this.titleStyle,
    this.subtitleStyle,
    this.contentStyle,
    this.iconSize,
    this.imageSize,
    this.spacing,
    this.maxWidth,
    this.maxHeight,
    this.constraints,
    this.gradient,
    this.border,
    this.animationDuration,
    this.animationCurve,
    this.onClose,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? content;
  final List<AuiDialogButton>? actions;
  final Widget? icon;
  final ImageProvider? image;
  final AuiDialogVariant variant;
  final AuiDialogSize size;
  final AuiDialogType type;
  final AuiDialogState state;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final bool barrierDismissible;
  final Color? barrierColor;
  final String? barrierLabel;
  final bool useSafeArea;
  final bool useRootNavigator;
  final Offset? anchorPoint;
  final EdgeInsets insetPadding;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? contentStyle;
  final double? iconSize;
  final double? imageSize;
  final double? spacing;
  final double? maxWidth;
  final double? maxHeight;
  final BoxConstraints? constraints;
  final Gradient? gradient;
  final Border? border;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final VoidCallback? onClose;

  @override
  State<AuiDialog> createState() => _AuiDialogState();

  /// Show dialog
  static Future<T?> show<T>({
    required BuildContext context,
    required AuiDialog dialog,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = false,
    Offset? anchorPoint,
    EdgeInsets? insetPadding,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? dialog.barrierColor,
      barrierLabel: barrierLabel ?? dialog.barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      builder: (context) => dialog,
    );
  }
}

class _AuiDialogState extends State<AuiDialog> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve ?? Curves.easeInOut,
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    final elevation = theme.elevation;
    
    // Get dialog colors
    final dialogBackgroundColor = _getDialogBackgroundColor(colors);
    final dialogBorderColor = _getDialogBorderColor(colors);
    
    // Get dialog elevation
    final dialogElevation = _getDialogElevation(elevation);
    
    // Get dialog border radius
    final dialogBorderRadius = _getDialogBorderRadius(spacing);
    
    // Get dialog padding
    final dialogPadding = _getDialogPadding(spacing);
    
    // Get dialog spacing
    final dialogSpacing = _getDialogSpacing(spacing);
    
    // Get dialog constraints
    final dialogConstraints = _getDialogConstraints();
    
    // Get icon widget
    final iconWidget = _getIconWidget(colors);
    
    // Get title widget
    final titleWidget = _getTitleWidget(colors);
    
    // Get subtitle widget
    final subtitleWidget = _getSubtitleWidget(colors);
    
    // Get content widget
    final contentWidget = _getContentWidget(colors);
    
    // Get actions widget
    final actionsWidget = _getActionsWidget(colors, dialogSpacing);
    
    Widget dialog = AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Opacity(
            opacity: _animation.value,
            child: Container(
              constraints: dialogConstraints,
              padding: dialogPadding,
              decoration: BoxDecoration(
                color: dialogBackgroundColor,
                borderRadius: dialogBorderRadius,
                border: dialogBorderColor != null 
                    ? Border.all(color: dialogBorderColor, width: 1.0)
                    : null,
                gradient: widget.gradient,
                boxShadow: _getDialogShadows(colors, dialogElevation),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconWidget != null) ...[
                    iconWidget,
                    SizedBox(height: dialogSpacing),
                  ],
                  if (titleWidget != null) ...[
                    titleWidget,
                    if (subtitleWidget != null || contentWidget != null)
                      SizedBox(height: dialogSpacing * 0.5),
                  ],
                  if (subtitleWidget != null) ...[
                    subtitleWidget,
                    if (contentWidget != null)
                      SizedBox(height: dialogSpacing * 0.5),
                  ],
                  if (contentWidget != null) ...[
                    contentWidget,
                    if (actionsWidget != null)
                      SizedBox(height: dialogSpacing),
                  ],
                  if (actionsWidget != null) ...[
                    actionsWidget,
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
    
    // Add shape if needed
    if (widget.shape != null) {
      dialog = ClipPath(
        clipper: _ShapeClipper(widget.shape!),
        child: dialog,
      );
    }
    
    // Add border if needed
    if (widget.border != null) {
      dialog = Container(
        decoration: BoxDecoration(
          border: widget.border,
        ),
        child: dialog,
      );
    }
    
    // Add margin
    if (widget.margin != null) {
      dialog = Padding(
        padding: widget.margin!,
        child: dialog,
      );
    }
    
    // Add semantics
    if (widget.semanticLabel != null) {
      dialog = Semantics(
        label: widget.semanticLabel,
        child: dialog,
      );
    }
    
    // Add tooltip
    if (widget.tooltip != null) {
      dialog = Tooltip(
        message: widget.tooltip!,
        child: dialog,
      );
    }
    
    return dialog;
  }
  
  /// Get dialog background color
  Color _getDialogBackgroundColor(AuiColorScheme colors) {
    if (widget.state == AuiDialogState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (widget.variant) {
      case AuiDialogVariant.filled:
        return widget.backgroundColor ?? colors.surface;
      case AuiDialogVariant.outlined:
        return widget.backgroundColor ?? colors.surface;
      case AuiDialogVariant.elevated:
        return widget.backgroundColor ?? colors.surface;
      case AuiDialogVariant.tonal:
        return widget.backgroundColor ?? colors.surfaceVariant;
      case AuiDialogVariant.minimal:
        return Colors.transparent;
    }
  }
  
  /// Get dialog foreground color
  Color _getDialogForegroundColor(AuiColorScheme colors) {
    if (widget.state == AuiDialogState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    return widget.foregroundColor ?? colors.onSurface;
  }
  
  /// Get dialog border color
  Color? _getDialogBorderColor(AuiColorScheme colors) {
    if (widget.state == AuiDialogState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (widget.variant) {
      case AuiDialogVariant.filled:
        return null;
      case AuiDialogVariant.outlined:
        return widget.borderColor ?? colors.outline;
      case AuiDialogVariant.elevated:
        return null;
      case AuiDialogVariant.tonal:
        return null;
      case AuiDialogVariant.minimal:
        return null;
    }
  }
  
  /// Get dialog elevation
  double _getDialogElevation(AuiElevationScheme elevation) {
    if (widget.elevation != null) return widget.elevation!;
    
    switch (widget.variant) {
      case AuiDialogVariant.filled:
        return elevation.level0;
      case AuiDialogVariant.outlined:
        return elevation.level0;
      case AuiDialogVariant.elevated:
        return elevation.level3;
      case AuiDialogVariant.tonal:
        return elevation.level0;
      case AuiDialogVariant.minimal:
        return elevation.level0;
    }
  }
  
  /// Get dialog border radius
  BorderRadius _getDialogBorderRadius(AuiSpacingScheme spacing) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    
    switch (widget.size) {
      case AuiDialogSize.xs:
        return BorderRadius.circular(spacing.sm);
      case AuiDialogSize.sm:
        return BorderRadius.circular(spacing.md);
      case AuiDialogSize.md:
        return BorderRadius.circular(spacing.lg);
      case AuiDialogSize.lg:
        return BorderRadius.circular(spacing.xl);
      case AuiDialogSize.xl:
        return BorderRadius.circular(spacing.xxl);
      case AuiDialogSize.fullscreen:
        return BorderRadius.zero;
    }
  }
  
  /// Get dialog padding
  EdgeInsets _getDialogPadding(AuiSpacingScheme spacing) {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.size) {
      case AuiDialogSize.xs:
        return EdgeInsets.all(spacing.md);
      case AuiDialogSize.sm:
        return EdgeInsets.all(spacing.lg);
      case AuiDialogSize.md:
        return EdgeInsets.all(spacing.xl);
      case AuiDialogSize.lg:
        return EdgeInsets.all(spacing.xxl);
      case AuiDialogSize.xl:
        return EdgeInsets.all(spacing.xxxl);
      case AuiDialogSize.fullscreen:
        return EdgeInsets.zero;
    }
  }
  
  /// Get dialog spacing
  double _getDialogSpacing(AuiSpacingScheme spacing) {
    if (widget.spacing != null) return widget.spacing!;
    
    switch (widget.size) {
      case AuiDialogSize.xs:
        return spacing.sm;
      case AuiDialogSize.sm:
        return spacing.md;
      case AuiDialogSize.md:
        return spacing.lg;
      case AuiDialogSize.lg:
        return spacing.xl;
      case AuiDialogSize.xl:
        return spacing.xxl;
      case AuiDialogSize.fullscreen:
        return spacing.lg;
    }
  }
  
  /// Get dialog constraints
  BoxConstraints _getDialogConstraints() {
    if (widget.constraints != null) return widget.constraints!;
    
    switch (widget.size) {
      case AuiDialogSize.xs:
        return BoxConstraints(
          maxWidth: widget.maxWidth ?? 300.0,
          maxHeight: widget.maxHeight ?? 200.0,
        );
      case AuiDialogSize.sm:
        return BoxConstraints(
          maxWidth: widget.maxWidth ?? 400.0,
          maxHeight: widget.maxHeight ?? 300.0,
        );
      case AuiDialogSize.md:
        return BoxConstraints(
          maxWidth: widget.maxWidth ?? 500.0,
          maxHeight: widget.maxHeight ?? 400.0,
        );
      case AuiDialogSize.lg:
        return BoxConstraints(
          maxWidth: widget.maxWidth ?? 600.0,
          maxHeight: widget.maxHeight ?? 500.0,
        );
      case AuiDialogSize.xl:
        return BoxConstraints(
          maxWidth: widget.maxWidth ?? 700.0,
          maxHeight: widget.maxHeight ?? 600.0,
        );
      case AuiDialogSize.fullscreen:
        return BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        );
    }
  }
  
  /// Get icon widget
  Widget? _getIconWidget(AuiColorScheme colors) {
    if (widget.icon != null) return widget.icon;
    if (widget.image != null) {
      return Image(
        image: widget.image!,
        width: widget.imageSize ?? _getImageSize(),
        height: widget.imageSize ?? _getImageSize(),
      );
    }
    
    // Default icon based on type
    switch (widget.type) {
      case AuiDialogType.alert:
        return Icon(
          Icons.warning_amber_outlined,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.warning,
        );
      case AuiDialogType.confirmation:
        return Icon(
          Icons.help_outline,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.primary,
        );
      case AuiDialogType.information:
        return Icon(
          Icons.info_outline,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.info,
        );
      case AuiDialogType.warning:
        return Icon(
          Icons.warning_outlined,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.warning,
        );
      case AuiDialogType.error:
        return Icon(
          Icons.error_outline,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.error,
        );
      case AuiDialogType.success:
        return Icon(
          Icons.check_circle_outline,
          size: widget.iconSize ?? _getIconSize(),
          color: colors.success,
        );
      case AuiDialogType.custom:
        return null;
    }
  }
  
  /// Get title widget
  Widget? _getTitleWidget(AuiColorScheme colors) {
    if (widget.title == null) return null;
    
    return DefaultTextStyle(
      style: widget.titleStyle ?? _getTitleTextStyle(colors),
      child: widget.title!,
    );
  }
  
  /// Get subtitle widget
  Widget? _getSubtitleWidget(AuiColorScheme colors) {
    if (widget.subtitle == null) return null;
    
    return DefaultTextStyle(
      style: widget.subtitleStyle ?? _getSubtitleTextStyle(colors),
      child: widget.subtitle!,
    );
  }
  
  /// Get content widget
  Widget? _getContentWidget(AuiColorScheme colors) {
    if (widget.content == null) return null;
    
    return DefaultTextStyle(
      style: widget.contentStyle ?? _getContentTextStyle(colors),
      child: widget.content!,
    );
  }
  
  /// Get actions widget
  Widget? _getActionsWidget(AuiColorScheme colors, double spacing) {
    if (widget.actions == null || widget.actions!.isEmpty) return null;
    
    final visibleActions = widget.actions!.where((action) => action.visible).toList();
    if (visibleActions.isEmpty) return null;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: visibleActions.map((action) {
        return Padding(
          padding: EdgeInsets.only(
            left: action == visibleActions.first ? 0 : spacing * 0.5,
          ),
          child: _AuiDialogButton(
            button: action,
            colors: colors,
            spacing: spacing,
          ),
        );
      }).toList(),
    );
  }
  
  /// Get title text style
  TextStyle _getTitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getDialogForegroundColor(colors),
      fontSize: _getTitleFontSize(),
      fontWeight: FontWeight.w600,
    );
  }
  
  /// Get subtitle text style
  TextStyle _getSubtitleTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getDialogForegroundColor(colors).withValues(alpha:0.8),
      fontSize: _getSubtitleFontSize(),
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get content text style
  TextStyle _getContentTextStyle(AuiColorScheme colors) {
    return TextStyle(
      color: _getDialogForegroundColor(colors),
      fontSize: _getContentFontSize(),
      fontWeight: FontWeight.w400,
    );
  }
  
  /// Get title font size
  double _getTitleFontSize() {
    switch (widget.size) {
      case AuiDialogSize.xs:
        return 16.0;
      case AuiDialogSize.sm:
        return 18.0;
      case AuiDialogSize.md:
        return 20.0;
      case AuiDialogSize.lg:
        return 22.0;
      case AuiDialogSize.xl:
        return 24.0;
      case AuiDialogSize.fullscreen:
        return 28.0;
    }
  }
  
  /// Get subtitle font size
  double _getSubtitleFontSize() {
    switch (widget.size) {
      case AuiDialogSize.xs:
        return 12.0;
      case AuiDialogSize.sm:
        return 14.0;
      case AuiDialogSize.md:
        return 16.0;
      case AuiDialogSize.lg:
        return 18.0;
      case AuiDialogSize.xl:
        return 20.0;
      case AuiDialogSize.fullscreen:
        return 22.0;
    }
  }
  
  /// Get content font size
  double _getContentFontSize() {
    switch (widget.size) {
      case AuiDialogSize.xs:
        return 12.0;
      case AuiDialogSize.sm:
        return 14.0;
      case AuiDialogSize.md:
        return 16.0;
      case AuiDialogSize.lg:
        return 18.0;
      case AuiDialogSize.xl:
        return 20.0;
      case AuiDialogSize.fullscreen:
        return 22.0;
    }
  }
  
  /// Get icon size
  double _getIconSize() {
    switch (widget.size) {
      case AuiDialogSize.xs:
        return 24.0;
      case AuiDialogSize.sm:
        return 32.0;
      case AuiDialogSize.md:
        return 40.0;
      case AuiDialogSize.lg:
        return 48.0;
      case AuiDialogSize.xl:
        return 56.0;
      case AuiDialogSize.fullscreen:
        return 64.0;
    }
  }
  
  /// Get image size
  double _getImageSize() {
    switch (widget.size) {
      case AuiDialogSize.xs:
        return 48.0;
      case AuiDialogSize.sm:
        return 64.0;
      case AuiDialogSize.md:
        return 80.0;
      case AuiDialogSize.lg:
        return 96.0;
      case AuiDialogSize.xl:
        return 112.0;
      case AuiDialogSize.fullscreen:
        return 128.0;
    }
  }
  
  /// Get dialog shadows
  List<BoxShadow> _getDialogShadows(AuiColorScheme colors, double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.2),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
      BoxShadow(
        color: widget.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.25),
        blurRadius: elevation,
        spreadRadius: 0,
      ),
    ];
  }
}

/// Individual dialog button widget
class _AuiDialogButton extends StatelessWidget {
  const _AuiDialogButton({
    required this.button,
    required this.colors,
    required this.spacing,
  });

  final AuiDialogButton button;
  final AuiColorScheme colors;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    // Get button colors
    final buttonBackgroundColor = _getButtonBackgroundColor();
    final buttonForegroundColor = _getButtonForegroundColor();
    final buttonBorderColor = _getButtonBorderColor();
    
    // Get button elevation
    final buttonElevation = _getButtonElevation();
    
    // Get button border radius
    final buttonBorderRadius = _getButtonBorderRadius();
    
    // Get button padding
    final buttonPadding = _getButtonPadding();
    
    Widget buttonWidget = Container(
      padding: buttonPadding,
      decoration: BoxDecoration(
        color: buttonBackgroundColor,
        borderRadius: buttonBorderRadius,
        border: buttonBorderColor != null 
            ? Border.all(color: buttonBorderColor, width: 1.0)
            : null,
        boxShadow: _getButtonShadows(buttonElevation),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (button.icon != null) ...[
            button.icon!,
            SizedBox(width: spacing * 0.25),
          ],
          Text(
            button.text,
            style: TextStyle(
              color: buttonForegroundColor,
              fontSize: _getButtonFontSize(),
              fontWeight: button.isPrimary ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
    
    // Add tap functionality
    if (button.onPressed != null && button.enabled) {
      buttonWidget = GestureDetector(
        onTap: button.onPressed,
        child: buttonWidget,
      );
    }
    
    // Add margin
    if (button.margin != null) {
      buttonWidget = Padding(
        padding: button.margin!,
        child: buttonWidget,
      );
    }
    
    // Add semantics
    if (button.semanticLabel != null) {
      buttonWidget = Semantics(
        label: button.semanticLabel,
        child: buttonWidget,
      );
    }
    
    // Add tooltip
    if (button.tooltip != null) {
      buttonWidget = Tooltip(
        message: button.tooltip!,
        child: buttonWidget,
      );
    }
    
    return buttonWidget;
  }
  
  /// Get button background color
  Color? _getButtonBackgroundColor() {
    if (button.backgroundColor != null) return button.backgroundColor;
    
    switch (button.variant) {
      case AuiDialogButtonVariant.filled:
        if (button.isPrimary) {
          return button.isDestructive ? colors.error : colors.primary;
        }
        return colors.surfaceVariant;
      case AuiDialogButtonVariant.outlined:
        return null;
      case AuiDialogButtonVariant.text:
        return null;
      case AuiDialogButtonVariant.tonal:
        if (button.isPrimary) {
          return button.isDestructive ? colors.errorContainer : colors.primaryContainer;
        }
        return colors.surfaceVariant;
    }
  }
  
  /// Get button foreground color
  Color _getButtonForegroundColor() {
    if (button.textColor != null) return button.textColor!;
    
    switch (button.variant) {
      case AuiDialogButtonVariant.filled:
        if (button.isPrimary) {
          return button.isDestructive ? colors.onError : colors.onPrimary;
        }
        return colors.onSurfaceVariant;
      case AuiDialogButtonVariant.outlined:
        return button.isDestructive ? colors.error : colors.primary;
      case AuiDialogButtonVariant.text:
        return button.isDestructive ? colors.error : colors.primary;
      case AuiDialogButtonVariant.tonal:
        if (button.isPrimary) {
          return button.isDestructive ? colors.onErrorContainer : colors.onPrimaryContainer;
        }
        return colors.onSurfaceVariant;
    }
  }
  
  /// Get button border color
  Color? _getButtonBorderColor() {
    if (button.borderColor != null) return button.borderColor;
    
    switch (button.variant) {
      case AuiDialogButtonVariant.filled:
        return null;
      case AuiDialogButtonVariant.outlined:
        return button.isDestructive ? colors.error : colors.primary;
      case AuiDialogButtonVariant.text:
        return null;
      case AuiDialogButtonVariant.tonal:
        return null;
    }
  }
  
  /// Get button elevation
  double _getButtonElevation() {
    if (button.elevation != null) return button.elevation!;
    
    switch (button.variant) {
      case AuiDialogButtonVariant.filled:
        return button.isPrimary ? 1.0 : 0.0;
      case AuiDialogButtonVariant.outlined:
        return 0.0;
      case AuiDialogButtonVariant.text:
        return 0.0;
      case AuiDialogButtonVariant.tonal:
        return 0.0;
    }
  }
  
  /// Get button border radius
  BorderRadius _getButtonBorderRadius() {
    if (button.borderRadius != null) return button.borderRadius!;
    return BorderRadius.circular(8.0);
  }
  
  /// Get button padding
  EdgeInsets _getButtonPadding() {
    if (button.padding != null) return button.padding!;
    return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  }
  
  /// Get button font size
  double _getButtonFontSize() {
    return 14.0;
  }
  
  /// Get button shadows
  List<BoxShadow> _getButtonShadows(double elevation) {
    if (elevation == 0) return [];
    
    return [
      BoxShadow(
        color: button.shadowColor ?? colors.shadow.withValues(alpha:0.1),
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}

/// Shape clipper for custom dialog shapes
class _ShapeClipper extends CustomClipper<Path> {
  const _ShapeClipper(this.shape);
  
  final ShapeBorder shape;
  
  @override
  Path getClip(Size size) {
    return shape.getOuterPath(Rect.fromLTWH(0, 0, size.width, size.height));
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// Dialog utilities
class AuiDialogUtils {
  const AuiDialogUtils._();
  
  /// Get dialog constraints for size
  static BoxConstraints getDialogConstraints(AuiDialogSize size, {double? maxWidth, double? maxHeight}) {
    switch (size) {
      case AuiDialogSize.xs:
        return BoxConstraints(
          maxWidth: maxWidth ?? 300.0,
          maxHeight: maxHeight ?? 200.0,
        );
      case AuiDialogSize.sm:
        return BoxConstraints(
          maxWidth: maxWidth ?? 400.0,
          maxHeight: maxHeight ?? 300.0,
        );
      case AuiDialogSize.md:
        return BoxConstraints(
          maxWidth: maxWidth ?? 500.0,
          maxHeight: maxHeight ?? 400.0,
        );
      case AuiDialogSize.lg:
        return BoxConstraints(
          maxWidth: maxWidth ?? 600.0,
          maxHeight: maxHeight ?? 500.0,
        );
      case AuiDialogSize.xl:
        return BoxConstraints(
          maxWidth: maxWidth ?? 700.0,
          maxHeight: maxHeight ?? 600.0,
        );
      case AuiDialogSize.fullscreen:
        return BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        );
    }
  }
  
  /// Get icon size for size
  static double getIconSize(AuiDialogSize size) {
    switch (size) {
      case AuiDialogSize.xs:
        return 24.0;
      case AuiDialogSize.sm:
        return 32.0;
      case AuiDialogSize.md:
        return 40.0;
      case AuiDialogSize.lg:
        return 48.0;
      case AuiDialogSize.xl:
        return 56.0;
      case AuiDialogSize.fullscreen:
        return 64.0;
    }
  }
  
  /// Get title font size for size
  static double getTitleFontSize(AuiDialogSize size) {
    switch (size) {
      case AuiDialogSize.xs:
        return 16.0;
      case AuiDialogSize.sm:
        return 18.0;
      case AuiDialogSize.md:
        return 20.0;
      case AuiDialogSize.lg:
        return 22.0;
      case AuiDialogSize.xl:
        return 24.0;
      case AuiDialogSize.fullscreen:
        return 28.0;
    }
  }
}
