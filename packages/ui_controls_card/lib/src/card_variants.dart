import 'package:flutter/material.dart';
import 'card_sizes.dart' as card_sizes;

/// Card variant definitions for the Awesome UI card component.
/// 
/// Defines the different visual styles and behaviors that cards can have,
/// following Material 3 design principles while maintaining cross-platform compatibility.
enum CardVariant {
  /// Filled card - Material 3 filled style
  filled,
  
  /// Outlined card - Material 3 outlined style
  outlined,
  
  /// Elevated card - Material 3 elevated style
  elevated,
}

/// Card size definitions for the Awesome UI card component.
/// 
/// Provides consistent sizing across different platforms and use cases,
/// following Material 3 sizing guidelines.
// CardSize enum moved to card_sizes.dart

/// Card state definitions for the Awesome UI card component.
/// 
/// Defines the different interactive states that cards can be in,
/// providing consistent behavior across platforms.
enum CardState {
  /// Normal state - default appearance
  normal,
  
  /// Hovered state - mouse hover (web/desktop)
  hovered,
  
  /// Pressed state - being pressed
  pressed,
  
  /// Focused state - keyboard focus
  focused,
  
  /// Disabled state - not interactive
  disabled,
  
  /// Selected state - selected appearance
  selected,
}

/// Card elevation level definitions.
/// 
/// Defines the different elevation levels for cards,
/// providing consistent depth and hierarchy.
enum CardElevation {
  /// No elevation - flat appearance
  none,
  
  /// Low elevation - subtle depth
  low,
  
  /// Medium elevation - standard depth
  medium,
  
  /// High elevation - prominent depth
  high,
  
  /// Maximum elevation - highest depth
  maximum,
}

/// Card surface type definitions.
/// 
/// Defines the different surface types for cards,
/// providing consistent theming across platforms.
enum CardSurface {
  /// Primary surface - main content area
  primary,
  
  /// Secondary surface - secondary content area
  secondary,
  
  /// Tertiary surface - tertiary content area
  tertiary,
  
  /// Container surface - container content area
  container,
}

/// Card configuration class.
/// 
/// Contains all the styling information needed to render a card
/// with the appropriate platform-specific appearance.
class CardConfig {
  const CardConfig({
    this.variant = CardVariant.filled,
    this.size = card_sizes.CardSize.md,
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
  });

  final CardVariant variant;
  final card_sizes.CardSize size;
  final CardState state;
  final CardElevation elevation;
  final CardSurface surface;
  final bool isClickable;
  final bool isSelected;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? elevationColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? selectedColor;
  final Color? disabledColor;

  /// Create a copy of this configuration with the given fields replaced.
  CardConfig copyWith({
    CardVariant? variant,
    card_sizes.CardSize? size,
    CardState? state,
    CardElevation? elevation,
    CardSurface? surface,
    bool? isClickable,
    bool? isSelected,
    bool? isDisabled,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? backgroundColor,
    Color? shadowColor,
    Color? elevationColor,
    Color? splashColor,
    Color? highlightColor,
    Color? focusColor,
    Color? hoverColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    return CardConfig(
      variant: variant ?? this.variant,
      size: size ?? this.size,
      state: state ?? this.state,
      elevation: elevation ?? this.elevation,
      surface: surface ?? this.surface,
      isClickable: isClickable ?? this.isClickable,
      isSelected: isSelected ?? this.isSelected,
      isDisabled: isDisabled ?? this.isDisabled,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevationColor: elevationColor ?? this.elevationColor,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      selectedColor: selectedColor ?? this.selectedColor,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CardConfig &&
        other.variant == variant &&
        other.size == size &&
        other.state == state &&
        other.elevation == elevation &&
        other.surface == surface &&
        other.isClickable == isClickable &&
        other.isSelected == isSelected &&
        other.isDisabled == isDisabled &&
        other.padding == padding &&
        other.margin == margin &&
        other.borderRadius == borderRadius &&
        other.borderColor == borderColor &&
        other.backgroundColor == backgroundColor &&
        other.shadowColor == shadowColor &&
        other.elevationColor == elevationColor &&
        other.splashColor == splashColor &&
        other.highlightColor == highlightColor &&
        other.focusColor == focusColor &&
        other.hoverColor == hoverColor &&
        other.selectedColor == selectedColor &&
        other.disabledColor == disabledColor;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      variant,
      size,
      state,
      elevation,
      surface,
      isClickable,
      isSelected,
      isDisabled,
      padding,
      margin,
      borderRadius,
      borderColor,
      backgroundColor,
      shadowColor,
      elevationColor,
      splashColor,
      highlightColor,
      focusColor,
      hoverColor,
      selectedColor,
      disabledColor,
    ]);
  }
}
