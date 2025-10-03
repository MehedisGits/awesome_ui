import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_core/ui_core.dart';
import 'button_variants.dart' as button_variants;
import 'button_sizes.dart';
import 'button_states.dart';

// Re-export the enums for convenience
typedef ButtonVariant = button_variants.ButtonVariant;
typedef ButtonSize = button_variants.ButtonSize;
typedef ButtonState = button_variants.ButtonState;
typedef ButtonIconPosition = button_variants.ButtonIconPosition;

/// Cross-platform button component for the Awesome UI library.
/// 
/// Provides a unified button API that adapts to different platforms
/// (Material 3, Cupertino, Web) while maintaining consistent behavior
/// and accessibility across all platforms.
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.md,
    this.isFullWidth = false,
    this.isLoading = false,
    this.isDisabled = false,
    this.semanticLabel,
    this.semanticHint,
    this.focusNode,
    this.autofocus = false,
  }) : assert(
          child != null || text != null,
          'Either child or text must be provided',
        );

  /// The callback that is called when the button is pressed
  final VoidCallback? onPressed;

  /// The widget to display inside the button
  final Widget? child;

  /// The text to display inside the button
  final String? text;

  /// The icon to display inside the button
  final IconData? icon;

  /// The visual style variant of the button
  final ButtonVariant variant;

  /// The size of the button
  final ButtonSize size;

  /// Whether the button should take the full width of its parent
  final bool isFullWidth;

  /// Whether the button is in a loading state
  final bool isLoading;

  /// Whether the button is disabled
  final bool isDisabled;

  /// The semantic label for accessibility
  final String? semanticLabel;

  /// The semantic hint for accessibility
  final String? semanticHint;

  /// The focus node for the button
  final FocusNode? focusNode;

  /// Whether the button should automatically receive focus
  final bool autofocus;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with ComponentMixin, AccessibilityMixin {
  late FocusNode _focusNode;
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = _createButtonStyle();
    final state = _determineButtonState();
    
    return _buildPlatformButton(style, state);
  }

  /// Create the button style configuration
  button_variants.ButtonStyle _createButtonStyle() {
    return button_variants.ButtonStyle(
      variant: widget.variant,
      size: widget.size,
      state: _determineButtonState(),
      iconPosition: _determineIconPosition(),
      isFullWidth: widget.isFullWidth,
      isLoading: widget.isLoading,
      isDisabled: widget.isDisabled,
    );
  }

  /// Determine the current button state
  ButtonState _determineButtonState() {
    if (widget.isDisabled) return ButtonState.disabled;
    if (widget.isLoading) return ButtonState.loading;
    if (_isPressed) return ButtonState.pressed;
    if (_isHovered) return ButtonState.hovered;
    if (_focusNode.hasFocus) return ButtonState.focused;
    return ButtonState.normal;
  }

  /// Determine the icon position based on available content
  ButtonIconPosition _determineIconPosition() {
    if (widget.icon != null && widget.text == null && widget.child == null) {
      return ButtonIconPosition.only;
    }
    return ButtonIconPosition.leading;
  }

  /// Build the platform-specific button
  Widget _buildPlatformButton(button_variants.ButtonStyle style, ButtonState state) {
    switch (resolvedPlatformStyle) {
      case PlatformStyle.material:
        return _buildMaterialButton(style, state);
      case PlatformStyle.cupertino:
        return _buildCupertinoButton(style, state);
      case PlatformStyle.web:
        return _buildWebButton(style, state);
      case PlatformStyle.adaptive:
        return _buildAdaptiveButton(style, state);
    }
  }

  /// Build Material 3 button
  Widget _buildMaterialButton(button_variants.ButtonStyle style, ButtonState state) {
    final buttonStyle = _createMaterialButtonStyle(style, state);
    
    Widget button;
    
    switch (style.variant) {
      case ButtonVariant.primary:
        button = ElevatedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.secondary:
        button = ElevatedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.tonal:
        button = FilledButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.ghost:
        button = OutlinedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.destructive:
        button = ElevatedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.outlined:
        button = OutlinedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
    }

    return _wrapWithAccessibility(button, style, state);
  }

  /// Build Cupertino button
  Widget _buildCupertinoButton(button_variants.ButtonStyle style, ButtonState state) {
    return _wrapWithAccessibility(
      CupertinoButton(
        onPressed: _isInteractive ? _handlePressed : null,
        padding: ButtonSizes.getPadding(style.size),
        child: _buildButtonContent(style),
      ),
      style,
      state,
    );
  }

  /// Build Web-optimized button
  Widget _buildWebButton(button_variants.ButtonStyle style, ButtonState state) {
    final buttonStyle = _createWebButtonStyle(style, state);
    
    Widget button;
    
    switch (style.variant) {
      case ButtonVariant.primary:
        button = ElevatedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.secondary:
        button = ElevatedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.tonal:
        button = FilledButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.ghost:
        button = OutlinedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.destructive:
        button = ElevatedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
      case ButtonVariant.outlined:
        button = OutlinedButton(
          onPressed: _isInteractive ? _handlePressed : null,
          style: buttonStyle,
          child: _buildButtonContent(style),
        );
        break;
    }

    return _wrapWithAccessibility(button, style, state);
  }

  /// Build adaptive button (chooses platform automatically)
  Widget _buildAdaptiveButton(button_variants.ButtonStyle style, ButtonState state) {
    final currentStyle = PlatformStyleUtils.getCurrentPlatformStyle();
    switch (currentStyle) {
      case PlatformStyle.material:
        return _buildMaterialButton(style, state);
      case PlatformStyle.cupertino:
        return _buildCupertinoButton(style, state);
      case PlatformStyle.web:
        return _buildWebButton(style, state);
      case PlatformStyle.adaptive:
        return _buildMaterialButton(style, state); // Fallback
    }
  }

  /// Create Material button style
  ButtonStyle _createMaterialButtonStyle(button_variants.ButtonStyle style, ButtonState state) {
    final backgroundColor = ButtonStates.getBackgroundColor(
      style.variant,
      state,
      colors,
    );
    final foregroundColor = ButtonStates.getForegroundColor(
      style.variant,
      state,
      colors,
    );
    final overlayColor = ButtonStates.getOverlayColor(
      style.variant,
      state,
      colors,
    );
    final elevation = ButtonStates.getElevation(
      style.variant,
      state,
      style.size,
    );

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(foregroundColor),
      overlayColor: WidgetStateProperty.all(overlayColor),
      elevation: WidgetStateProperty.all(elevation),
      padding: WidgetStateProperty.all(ButtonSizes.getPadding(style.size)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: ButtonSizes.getBorderRadius(style.size),
        ),
      ),
      minimumSize: WidgetStateProperty.all(
        ButtonSizes.getConstraints(style.size, isFullWidth: style.isFullWidth).constrain(Size.zero),
      ),
      maximumSize: WidgetStateProperty.all(
        ButtonSizes.getConstraints(style.size, isFullWidth: style.isFullWidth).constrain(Size.infinite),
      ),
    );
  }


  /// Create Web button style
  ButtonStyle _createWebButtonStyle(button_variants.ButtonStyle style, ButtonState state) {
    final backgroundColor = ButtonStates.getBackgroundColor(
      style.variant,
      state,
      colors,
    );
    final foregroundColor = ButtonStates.getForegroundColor(
      style.variant,
      state,
      colors,
    );
    final overlayColor = ButtonStates.getOverlayColor(
      style.variant,
      state,
      colors,
    );
    final elevation = ButtonStates.getElevation(
      style.variant,
      state,
      style.size,
    );

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(foregroundColor),
      overlayColor: WidgetStateProperty.all(overlayColor),
      elevation: WidgetStateProperty.all(elevation),
      padding: WidgetStateProperty.all(ButtonSizes.getPadding(style.size)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: ButtonSizes.getBorderRadius(style.size),
        ),
      ),
      minimumSize: WidgetStateProperty.all(
        ButtonSizes.getConstraints(style.size, isFullWidth: style.isFullWidth).constrain(Size.zero),
      ),
      maximumSize: WidgetStateProperty.all(
        ButtonSizes.getConstraints(style.size, isFullWidth: style.isFullWidth).constrain(Size.infinite),
      ),
      mouseCursor: WidgetStateProperty.all(
        ButtonStates.getCursor(state),
      ),
      animationDuration: const Duration(milliseconds: 150),
    );
  }

  /// Build the button content (text, icon, loading indicator)
  Widget _buildButtonContent(button_variants.ButtonStyle style) {
    if (style.isLoading) {
      return _buildLoadingContent(style);
    }

    if (widget.child != null) {
      return widget.child!;
    }

    if (widget.text != null && widget.icon != null) {
      return _buildTextAndIconContent(style);
    }

    if (widget.text != null) {
      return Text(widget.text!);
    }

    if (widget.icon != null) {
      return Icon(
        widget.icon!,
        size: ButtonSizes.getIconSize(style.size),
      );
    }

    return const SizedBox.shrink();
  }

  /// Build loading content
  Widget _buildLoadingContent(button_variants.ButtonStyle style) {
    final indicatorSize = ButtonSizes.getLoadingIndicatorSize(style.size);
    final indicatorColor = ButtonStates.getLoadingIndicatorColor(
      style.variant,
      ButtonState.loading,
      colors,
    );

    return SizedBox(
      width: indicatorSize,
      height: indicatorSize,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
      ),
    );
  }

  /// Build text and icon content
  Widget _buildTextAndIconContent(button_variants.ButtonStyle style) {
    final iconSize = ButtonSizes.getIconSize(style.size);
    final iconSpacing = ButtonSizes.getIconSpacing(style.size);

    final iconWidget = Icon(
      widget.icon!,
      size: iconSize,
    );

    final textWidget = Text(widget.text!);

    if (style.iconPosition == ButtonIconPosition.leading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          SizedBox(width: iconSpacing),
          textWidget,
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          textWidget,
          SizedBox(width: iconSpacing),
          iconWidget,
        ],
      );
    }
  }

  /// Wrap button with accessibility features
  Widget _wrapWithAccessibility(Widget button, button_variants.ButtonStyle style, ButtonState state) {
    return createFocusableButton(
      child: button,
      onPressed: _isInteractive ? _handlePressed : null,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      semanticLabel: ButtonStates.getSemanticLabel(state, widget.semanticLabel),
      tooltip: ButtonStates.getSemanticHint(state),
    );
  }

  /// Handle button press
  void _handlePressed() {
    if (_isInteractive) {
      widget.onPressed?.call();
    }
  }

  /// Check if button is interactive
  bool get _isInteractive {
    return !widget.isDisabled && !widget.isLoading;
  }
}