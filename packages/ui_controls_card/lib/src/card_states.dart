import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'card_variants.dart';
import 'card_sizes.dart' as card_sizes;

/// Card state utilities for the Awesome UI card component.
/// 
/// Provides state management and visual feedback for different card states,
/// ensuring consistent behavior across platforms and accessibility requirements.
class CardStates {
  const CardStates._();

  /// Get the background color for a card variant and state
  static Color getBackgroundColor(
    CardVariant variant,
    CardState state,
    CardSurface surface,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return colors.surfaceVariant;
    }

    final baseColor = _getSurfaceColor(surface, colors);
    
    switch (variant) {
      case CardVariant.filled:
        return baseColor;
      case CardVariant.outlined:
        return baseColor;
      case CardVariant.elevated:
        return baseColor;
    }
  }

  /// Get the border color for a card variant and state
  static Color getBorderColor(
    CardVariant variant,
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return colors.outlineVariant;
    }

    switch (state) {
      case CardState.selected:
        return colors.primary;
      case CardState.focused:
        return colors.primary;
      case CardState.pressed:
        return colors.primary.withOpacity(0.8);
      case CardState.hovered:
        return colors.primary.withOpacity(0.6);
      default:
        return colors.outline;
    }
  }

  /// Get the border width for a card variant and state
  static double getBorderWidth(
    CardVariant variant,
    CardState state,
    card_sizes.CardSize size,
  ) {
    if (variant == CardVariant.filled) {
      return 0.0;
    }

    final baseWidth = card_sizes.CardSizes.getBorderWidth(size);
    
    switch (state) {
      case CardState.selected:
        return baseWidth * 2;
      case CardState.focused:
        return baseWidth * 1.5;
      case CardState.pressed:
        return baseWidth * 1.2;
      default:
        return baseWidth;
    }
  }

  /// Get the elevation for a card variant and state
  static double getElevation(
    CardVariant variant,
    CardState state,
    CardElevation elevation,
    card_sizes.CardSize size,
  ) {
    if (state == CardState.disabled) {
      return 0.0;
    }

    final baseElevation = _getElevationValue(elevation, size);
    
    switch (state) {
      case CardState.pressed:
        return baseElevation * 0.5;
      case CardState.hovered:
        return baseElevation * 1.5;
      case CardState.focused:
        return baseElevation * 1.2;
      case CardState.selected:
        return baseElevation * 1.3;
      default:
        return baseElevation;
    }
  }

  /// Get the shadow color for a card variant and state
  static Color getShadowColor(
    CardVariant variant,
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return Colors.transparent;
    }

    return colors.shadow.withOpacity(0.2);
  }

  /// Get the focus ring color for a card state
  static Color getFocusRingColor(
    CardState state,
    AppColors colors,
  ) {
    if (state != CardState.focused) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.5);
  }

  /// Get the splash color for a card state
  static Color getSplashColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.1);
  }

  /// Get the highlight color for a card state
  static Color getHighlightColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.05);
  }

  /// Get the hover color for a card state
  static Color getHoverColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.08);
  }

  /// Get the focus color for a card state
  static Color getFocusColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.12);
  }

  /// Get the selected color for a card state
  static Color getSelectedColor(
    CardState state,
    AppColors colors,
  ) {
    if (state != CardState.selected) {
      return Colors.transparent;
    }

    return colors.primary.withOpacity(0.12);
  }

  /// Get the disabled color for a card state
  static Color getDisabledColor(
    CardState state,
    AppColors colors,
  ) {
    if (state != CardState.disabled) {
      return Colors.transparent;
    }

    return colors.onSurfaceVariant.withOpacity(0.12);
  }

  /// Get the text color for a card state
  static Color getTextColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return colors.onSurfaceVariant;
    }

    return colors.onSurface;
  }

  /// Get the title text color for a card state
  static Color getTitleTextColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return colors.onSurfaceVariant;
    }

    return colors.onSurface;
  }

  /// Get the subtitle text color for a card state
  static Color getSubtitleTextColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return colors.onSurfaceVariant;
    }

    return colors.onSurfaceVariant;
  }

  /// Get the icon color for a card state
  static Color getIconColor(
    CardState state,
    AppColors colors,
  ) {
    if (state == CardState.disabled) {
      return colors.onSurfaceVariant;
    }

    switch (state) {
      case CardState.selected:
        return colors.primary;
      case CardState.focused:
        return colors.primary;
      default:
        return colors.onSurfaceVariant;
    }
  }

  /// Get the cursor for a card state
  static MouseCursor getCursor(CardState state, bool isClickable) {
    if (!isClickable || state == CardState.disabled) {
      return SystemMouseCursors.basic;
    }

    switch (state) {
      case CardState.pressed:
        return SystemMouseCursors.click;
      case CardState.hovered:
        return SystemMouseCursors.click;
      default:
        return SystemMouseCursors.click;
    }
  }

  /// Get the semantic label for a card state
  static String? getSemanticLabel(CardState state, String? baseLabel) {
    if (state == CardState.disabled) {
      return '${baseLabel ?? 'Card'} (Disabled)';
    }
    if (state == CardState.selected) {
      return '${baseLabel ?? 'Card'} (Selected)';
    }
    if (state == CardState.focused) {
      return '${baseLabel ?? 'Card'} (Focused)';
    }
    return baseLabel;
  }

  /// Get the semantic hint for a card state
  static String? getSemanticHint(CardState state, bool isClickable) {
    if (!isClickable) {
      return null;
    }

    switch (state) {
      case CardState.disabled:
        return 'Card is disabled';
      case CardState.selected:
        return 'Card is selected';
      case CardState.focused:
        return 'Press Enter or Space to activate';
      default:
        return 'Press to activate';
    }
  }

  /// Check if a card should show focus ring
  static bool shouldShowFocusRing(CardState state) {
    return state == CardState.focused;
  }

  /// Check if a card is interactive
  static bool isInteractive(CardState state, bool isClickable) {
    return isClickable && state != CardState.disabled;
  }

  /// Get the surface color for a given surface type
  static Color _getSurfaceColor(CardSurface surface, AppColors colors) {
    switch (surface) {
      case CardSurface.primary:
        return colors.surface;
      case CardSurface.secondary:
        return colors.surfaceVariant;
      case CardSurface.tertiary:
        return colors.surfaceContainerHighest;
      case CardSurface.container:
        return colors.surfaceContainer;
    }
  }

  /// Get the elevation value for a given elevation level
  static double _getElevationValue(CardElevation elevation, card_sizes.CardSize size) {
    final baseElevation = card_sizes.CardSizes.getElevation(size);
    
    switch (elevation) {
      case CardElevation.none:
        return 0.0;
      case CardElevation.low:
        return baseElevation * 0.5;
      case CardElevation.medium:
        return baseElevation;
      case CardElevation.high:
        return baseElevation * 1.5;
      case CardElevation.maximum:
        return baseElevation * 2.0;
    }
  }

  /// Get the card decoration for a given configuration
  static Decoration getCardDecoration(
    CardVariant variant,
    CardState state,
    CardElevation elevation,
    CardSurface surface,
    card_sizes.CardSize size,
    AppColors colors,
    CardConfig config,
  ) {
    final backgroundColor = getBackgroundColor(variant, state, surface, colors);
    final borderColor = getBorderColor(variant, state, colors);
    final borderWidth = getBorderWidth(variant, state, size);
    final elevationValue = getElevation(variant, state, elevation, size);
    final shadowColor = getShadowColor(variant, state, colors);
    final borderRadius = config.borderRadius ?? card_sizes.CardSizes.getBorderRadius(size);

    if (variant == CardVariant.filled) {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: borderWidth > 0
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      );
    } else if (variant == CardVariant.outlined) {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(color: borderColor, width: borderWidth),
      );
    } else {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: borderWidth > 0
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        boxShadow: elevationValue > 0
            ? [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: card_sizes.CardSizes.getShadowBlurRadius(size),
                  spreadRadius: card_sizes.CardSizes.getShadowSpreadRadius(size),
                  offset: Offset(0, elevationValue),
                ),
              ]
            : null,
      );
    }
  }

  /// Get the card theme for a given configuration
  static CardTheme getCardTheme(
    CardVariant variant,
    CardState state,
    CardElevation elevation,
    CardSurface surface,
    card_sizes.CardSize size,
    AppColors colors,
    CardConfig config,
  ) {
    final backgroundColor = getBackgroundColor(variant, state, surface, colors);
    final borderColor = getBorderColor(variant, state, colors);
    final borderRadius = config.borderRadius ?? card_sizes.CardSizes.getBorderRadius(size);
    final elevationValue = getElevation(variant, state, elevation, size);
    final shadowColor = getShadowColor(variant, state, colors);

    return CardTheme(
      color: backgroundColor,
      shadowColor: shadowColor,
      elevation: elevationValue,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: variant == CardVariant.outlined
            ? BorderSide(color: borderColor, width: card_sizes.CardSizes.getBorderWidth(size))
            : BorderSide.none,
      ),
      margin: config.margin ?? card_sizes.CardSizes.getMargin(size),
      clipBehavior: Clip.antiAlias,
    );
  }

  /// Get the focus color for a card state (duplicate method removed)
}
