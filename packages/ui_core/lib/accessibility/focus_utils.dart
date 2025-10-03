import 'package:flutter/material.dart';

/// Focus utilities for accessibility support.
class FocusUtils {
  const FocusUtils._();

  /// Create focus node with accessibility support
  static FocusNode createAccessibleFocusNode({
    String? debugLabel,
    bool skipTraversal = false,
    bool canRequestFocus = true,
    bool descendantsAreFocusable = true,
  }) {
    return FocusNode(
      debugLabel: debugLabel,
      skipTraversal: skipTraversal,
      canRequestFocus: canRequestFocus,
      descendantsAreFocusable: descendantsAreFocusable,
    );
  }

  /// Create focus scope with accessibility support
  static FocusScopeNode createAccessibleFocusScope({
    String? debugLabel,
    bool skipTraversal = false,
    bool canRequestFocus = true,
    bool descendantsAreFocusable = true,
  }) {
    return FocusScopeNode(
      debugLabel: debugLabel,
      skipTraversal: skipTraversal,
      canRequestFocus: canRequestFocus,
    );
  }

  /// Create focusable widget with accessibility support
  static Widget createFocusableWidget({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    bool descendantsAreFocusable = true,
    VoidCallback? onFocusChange,
    ValueChanged<bool>? onFocusChangeWithValue,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      descendantsAreFocusable: descendantsAreFocusable,
      onFocusChange: onFocusChangeWithValue ?? (onFocusChange != null ? (_) => onFocusChange() : null),
      child: child,
    );
  }

  /// Create focusable button with accessibility support
  static Widget createFocusableButton({
    required Widget child,
    required VoidCallback? onPressed,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? tooltip,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        button: true,
        enabled: onPressed != null,
        label: semanticLabel,
        tooltip: tooltip,
        onTap: onPressed,
        child: child,
      ),
    );
  }

  /// Create focusable text field with accessibility support
  static Widget createFocusableTextField({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    String? value,
    bool isRequired = false,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        textField: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        value: value,
        isRequired: isRequired,
        child: child,
      ),
    );
  }

  /// Create focusable card with accessibility support
  static Widget createFocusableCard({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    VoidCallback? onTap,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        button: onTap != null,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        onTap: onTap,
        child: child,
      ),
    );
  }

  /// Create focusable list with accessibility support
  static Widget createFocusableList({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    int? itemCount,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        enabled: canRequestFocus,
        label: semanticLabel,
        child: child,
      ),
    );
  }

  /// Create focusable list item with accessibility support
  static Widget createFocusableListItem({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    int? index,
    int? totalCount,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        child: child,
      ),
    );
  }

  /// Create focusable heading with accessibility support
  static Widget createFocusableHeading({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    int level = 1,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        header: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        child: child,
      ),
    );
  }

  /// Create focusable image with accessibility support
  static Widget createFocusableImage({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        image: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        child: child,
      ),
    );
  }

  /// Create focusable progress indicator with accessibility support
  static Widget createFocusableProgressIndicator({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    double? value,
    double? maxValue = 1.0,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        enabled: canRequestFocus,
        label: semanticLabel,
        value: value?.toString(),
        child: child,
      ),
    );
  }

  /// Create focusable switch with accessibility support
  static Widget createFocusableSwitch({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    bool? value,
    ValueChanged<bool>? onChanged,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        button: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        toggled: value ?? false,
        onTap: onChanged != null ? () => onChanged(!(value ?? false)) : null,
        child: child,
      ),
    );
  }

  /// Create focusable checkbox with accessibility support
  static Widget createFocusableCheckbox({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    bool? value,
    ValueChanged<bool>? onChanged,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        button: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        checked: value ?? false,
        onTap: onChanged != null ? () => onChanged(!(value ?? false)) : null,
        child: child,
      ),
    );
  }

  /// Create focusable radio button with accessibility support
  static Widget createFocusableRadioButton({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    bool? value,
    ValueChanged<bool>? onChanged,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        button: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        checked: value ?? false,
        onTap: onChanged != null ? () => onChanged(!(value ?? false)) : null,
        child: child,
      ),
    );
  }

  /// Create focusable slider with accessibility support
  static Widget createFocusableSlider({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    double? value,
    double? minValue = 0.0,
    double? maxValue = 1.0,
    ValueChanged<double>? onChanged,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        slider: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        value: value?.toString(),
        onIncrease: onChanged != null ? () => onChanged((value ?? 0.0) + 0.1) : null,
        onDecrease: onChanged != null ? () => onChanged((value ?? 0.0) - 0.1) : null,
        child: child,
      ),
    );
  }

  /// Create focusable tab with accessibility support
  static Widget createFocusableTab({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        button: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        selected: isSelected,
        onTap: onTap,
        child: child,
      ),
    );
  }

  /// Create focusable tooltip with accessibility support
  static Widget createFocusableTooltip({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        child: child,
      ),
    );
  }

  /// Create focusable live region with accessibility support
  static Widget createFocusableLiveRegion({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    bool isPolite = true,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        liveRegion: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        child: child,
      ),
    );
  }

  /// Create focusable landmark with accessibility support
  static Widget createFocusableLandmark({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        child: child,
      ),
    );
  }

  /// Create focusable group with accessibility support
  static Widget createFocusableGroup({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        child: child,
      ),
    );
  }

  /// Create focusable container with accessibility support
  static Widget createFocusableContainer({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        container: true,
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        child: child,
      ),
    );
  }

  /// Create focusable text with accessibility support
  static Widget createFocusableText({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: Semantics(
        enabled: canRequestFocus,
        label: semanticLabel,
        hint: hint,
        child: child,
      ),
    );
  }
}
