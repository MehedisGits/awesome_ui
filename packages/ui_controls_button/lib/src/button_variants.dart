/// Button variant definitions for the Awesome UI button component.
/// 
/// Defines the different visual styles and behaviors that buttons can have,
/// following Material 3 design principles while maintaining cross-platform compatibility.
enum ButtonVariant {
  /// Primary button - main call-to-action
  primary,
  
  /// Secondary button - secondary actions
  secondary,
  
  /// Tonal button - subtle emphasis
  tonal,
  
  /// Ghost button - minimal appearance
  ghost,
  
  /// Outlined button - border only
  outlined,
  
  /// Destructive button - dangerous actions
  destructive,
}

/// Button size definitions for the Awesome UI button component.
/// 
/// Provides consistent sizing across different platforms and use cases,
/// following Material 3 sizing guidelines.
enum ButtonSize {
  /// Extra small button - 32dp height
  xs,
  
  /// Small button - 40dp height
  sm,
  
  /// Medium button - 48dp height (default)
  md,
  
  /// Large button - 56dp height
  lg,
}

/// Button state definitions for the Awesome UI button component.
/// 
/// Defines the different interactive states that buttons can be in,
/// providing consistent behavior across platforms.
enum ButtonState {
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
  
  /// Loading state - showing loading indicator
  loading,
}

/// Button icon position definitions.
/// 
/// Defines where icons should be positioned relative to text.
enum ButtonIconPosition {
  /// Icon before text
  leading,
  
  /// Icon after text
  trailing,
  
  /// Icon only (no text)
  only,
}

/// Button style configuration.
/// 
/// Contains all the styling information needed to render a button
/// with the appropriate platform-specific appearance.
class ButtonStyle {
  const ButtonStyle({
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.md,
    this.state = ButtonState.normal,
    this.iconPosition = ButtonIconPosition.leading,
    this.isFullWidth = false,
    this.isLoading = false,
    this.isDisabled = false,
  });

  final ButtonVariant variant;
  final ButtonSize size;
  final ButtonState state;
  final ButtonIconPosition iconPosition;
  final bool isFullWidth;
  final bool isLoading;
  final bool isDisabled;

  /// Create a copy of this style with the given fields replaced.
  ButtonStyle copyWith({
    ButtonVariant? variant,
    ButtonSize? size,
    ButtonState? state,
    ButtonIconPosition? iconPosition,
    bool? isFullWidth,
    bool? isLoading,
    bool? isDisabled,
  }) {
    return ButtonStyle(
      variant: variant ?? this.variant,
      size: size ?? this.size,
      state: state ?? this.state,
      iconPosition: iconPosition ?? this.iconPosition,
      isFullWidth: isFullWidth ?? this.isFullWidth,
      isLoading: isLoading ?? this.isLoading,
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonStyle &&
        other.variant == variant &&
        other.size == size &&
        other.state == state &&
        other.iconPosition == iconPosition &&
        other.isFullWidth == isFullWidth &&
        other.isLoading == isLoading &&
        other.isDisabled == isDisabled;
  }

  @override
  int get hashCode {
    return Object.hash(
      variant,
      size,
      state,
      iconPosition,
      isFullWidth,
      isLoading,
      isDisabled,
    );
  }
}
