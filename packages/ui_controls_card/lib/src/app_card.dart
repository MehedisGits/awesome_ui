import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_core/ui_core.dart';
import 'card_variants.dart';
import 'card_sizes.dart';
import 'card_states.dart';

/// Cross-platform card component for the Awesome UI library.
/// 
/// Provides a unified card API that adapts to different platforms
/// (Material 3, Cupertino, Web) while maintaining consistent behavior
/// and accessibility across all platforms.
class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.variant = CardVariant.filled,
    this.size = CardSize.md,
    this.state = CardState.normal,
    this.elevation = CardElevation.medium,
    this.surface = CardSurface.primary,
    this.isClickable = false,
    this.isSelected = false,
    this.isDisabled = false,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    this.shadowColor,
    this.elevationColor,
    this.splashColor,
    this.highlightColor,
    this.focusColor,
    this.hoverColor,
    this.selectedColor,
    this.disabledColor,
    this.semanticLabel,
    this.semanticHint,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.antiAlias,
  });

  /// The widget to display inside the card
  final Widget child;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Callback when the card is long pressed
  final VoidCallback? onLongPress;

  /// Callback when the card is double tapped
  final VoidCallback? onDoubleTap;

  /// The visual style variant of the card
  final CardVariant variant;

  /// The size of the card
  final CardSize size;

  /// The state of the card
  final CardState state;

  /// The elevation level of the card
  final CardElevation elevation;

  /// The surface type of the card
  final CardSurface surface;

  /// Whether the card is clickable
  final bool isClickable;

  /// Whether the card is selected
  final bool isSelected;

  /// Whether the card is disabled
  final bool isDisabled;

  /// The padding inside the card
  final EdgeInsetsGeometry? padding;

  /// The margin around the card
  final EdgeInsetsGeometry? margin;

  /// The border radius of the card
  final BorderRadius? borderRadius;

  /// The border color of the card
  final Color? borderColor;

  /// The background color of the card
  final Color? backgroundColor;

  /// The shadow color of the card
  final Color? shadowColor;

  /// The elevation color of the card
  final Color? elevationColor;

  /// The splash color of the card
  final Color? splashColor;

  /// The highlight color of the card
  final Color? highlightColor;

  /// The focus color of the card
  final Color? focusColor;

  /// The hover color of the card
  final Color? hoverColor;

  /// The selected color of the card
  final Color? selectedColor;

  /// The disabled color of the card
  final Color? disabledColor;

  /// The semantic label for accessibility
  final String? semanticLabel;

  /// The semantic hint for accessibility
  final String? semanticHint;

  /// The focus node for the card
  final FocusNode? focusNode;

  /// Whether the card should automatically receive focus
  final bool autofocus;

  /// The clip behavior of the card
  final Clip clipBehavior;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard>
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
    final config = _createCardConfig();
    final currentState = _determineCardState();
    
    return _buildPlatformCard(config, currentState);
  }

  /// Create the card configuration
  CardConfig _createCardConfig() {
    return CardConfig(
      variant: widget.variant,
      size: widget.size,
      state: _determineCardState(),
      elevation: widget.elevation,
      surface: widget.surface,
      isClickable: widget.isClickable,
      isSelected: widget.isSelected,
      isDisabled: widget.isDisabled,
      padding: widget.padding,
      margin: widget.margin,
      borderRadius: widget.borderRadius,
      borderColor: widget.borderColor,
      backgroundColor: widget.backgroundColor,
      shadowColor: widget.shadowColor,
      elevationColor: widget.elevationColor,
      splashColor: widget.splashColor,
      highlightColor: widget.highlightColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      selectedColor: widget.selectedColor,
      disabledColor: widget.disabledColor,
    );
  }

  /// Determine the current card state
  CardState _determineCardState() {
    if (widget.isDisabled) return CardState.disabled;
    if (widget.isSelected) return CardState.selected;
    if (_isPressed) return CardState.pressed;
    if (_isHovered) return CardState.hovered;
    if (_focusNode.hasFocus) return CardState.focused;
    return widget.state;
  }

  /// Build the platform-specific card
  Widget _buildPlatformCard(CardConfig config, CardState state) {
    switch (resolvedPlatformStyle) {
      case PlatformStyle.material:
        return _buildMaterialCard(config, state);
      case PlatformStyle.cupertino:
        return _buildCupertinoCard(config, state);
      case PlatformStyle.web:
        return _buildWebCard(config, state);
      case PlatformStyle.adaptive:
        return _buildAdaptiveCard(config, state);
    }
  }

  /// Build Material 3 card
  Widget _buildMaterialCard(CardConfig config, CardState state) {
    final cardTheme = CardStates.getCardTheme(
      config.variant,
      state,
      config.elevation,
      config.surface,
      config.size,
      colors,
      config,
    );

    Widget card = Card(
      color: cardTheme.color,
      shadowColor: cardTheme.shadowColor,
      elevation: cardTheme.elevation,
      shape: cardTheme.shape,
      margin: cardTheme.margin,
      clipBehavior: cardTheme.clipBehavior,
      child: _buildCardContent(config),
    );

    if (config.isClickable) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isInteractive ? _handleTap : null,
          onLongPress: _isInteractive ? _handleLongPress : null,
          onDoubleTap: _isInteractive ? _handleDoubleTap : null,
          splashColor: CardStates.getSplashColor(state, colors),
          highlightColor: CardStates.getHighlightColor(state, colors),
          focusColor: CardStates.getFocusColor(state, colors),
          hoverColor: CardStates.getHoverColor(state, colors),
          borderRadius: config.borderRadius ?? CardSizes.getBorderRadius(config.size),
          child: card,
        ),
      );
    }

    return _wrapWithAccessibility(card, config, state);
  }

  /// Build Cupertino card
  Widget _buildCupertinoCard(CardConfig config, CardState state) {
    final decoration = CardStates.getCardDecoration(
      config.variant,
      state,
      config.elevation,
      config.surface,
      config.size,
      colors,
      config,
    );

    Widget card = Container(
      decoration: decoration,
      padding: config.padding ?? CardSizes.getPadding(config.size),
      margin: config.margin ?? CardSizes.getMargin(config.size),
      child: _buildCardContent(config),
    );

    if (config.isClickable) {
      card = CupertinoButton(
        onPressed: _isInteractive ? _handleTap : null,
        padding: EdgeInsets.zero,
        child: card,
      );
    }

    return _wrapWithAccessibility(card, config, state);
  }

  /// Build Web-optimized card
  Widget _buildWebCard(CardConfig config, CardState state) {
    final cardTheme = CardStates.getCardTheme(
      config.variant,
      state,
      config.elevation,
      config.surface,
      config.size,
      colors,
      config,
    );

    Widget card = Card(
      color: cardTheme.color,
      shadowColor: cardTheme.shadowColor,
      elevation: cardTheme.elevation,
      shape: cardTheme.shape,
      margin: cardTheme.margin,
      clipBehavior: cardTheme.clipBehavior,
      child: _buildCardContent(config),
    );

    if (config.isClickable) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isInteractive ? _handleTap : null,
          onLongPress: _isInteractive ? _handleLongPress : null,
          onDoubleTap: _isInteractive ? _handleDoubleTap : null,
          splashColor: CardStates.getSplashColor(state, colors),
          highlightColor: CardStates.getHighlightColor(state, colors),
          focusColor: CardStates.getFocusColor(state, colors),
          hoverColor: CardStates.getHoverColor(state, colors),
          borderRadius: config.borderRadius ?? CardSizes.getBorderRadius(config.size),
          child: card,
        ),
      );
    }

    return _wrapWithAccessibility(card, config, state);
  }

  /// Build adaptive card (chooses platform automatically)
  Widget _buildAdaptiveCard(CardConfig config, CardState state) {
    final currentStyle = PlatformStyleUtils.getCurrentPlatformStyle();
    switch (currentStyle) {
      case PlatformStyle.material:
        return _buildMaterialCard(config, state);
      case PlatformStyle.cupertino:
        return _buildCupertinoCard(config, state);
      case PlatformStyle.web:
        return _buildWebCard(config, state);
      case PlatformStyle.adaptive:
        return _buildMaterialCard(config, state); // Fallback
    }
  }

  /// Build the card content
  Widget _buildCardContent(CardConfig config) {
    return Padding(
      padding: config.padding ?? CardSizes.getPadding(config.size),
      child: widget.child,
    );
  }

  /// Handle card tap
  void _handleTap() {
    if (_isInteractive) {
      widget.onTap?.call();
    }
  }

  /// Handle card long press
  void _handleLongPress() {
    if (_isInteractive) {
      widget.onLongPress?.call();
    }
  }

  /// Handle card double tap
  void _handleDoubleTap() {
    if (_isInteractive) {
      widget.onDoubleTap?.call();
    }
  }

  /// Check if card is interactive
  bool get _isInteractive {
    return widget.isClickable && !widget.isDisabled;
  }

  /// Wrap card with accessibility features
  Widget _wrapWithAccessibility(Widget card, CardConfig config, CardState state) {
    return createFocusableCard(
      child: card,
      onTap: _isInteractive ? _handleTap : null,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      semanticLabel: CardStates.getSemanticLabel(state, widget.semanticLabel),
      // tooltip: CardStates.getSemanticHint(state, config.isClickable), // Not available in current Flutter version
    );
  }
}