import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Semantic helpers for accessibility support.
class SemanticHelpers {
  const SemanticHelpers._();

  /// Create semantic button
  static Widget createSemanticButton({
    required Widget child,
    required VoidCallback? onPressed,
    String? label,
    String? hint,
    bool isEnabled = true,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      onTap: isEnabled ? onPressed : null,
      child: child,
    );
  }

  /// Create semantic text field
  static Widget createSemanticTextField({
    required Widget child,
    String? label,
    String? hint,
    String? value,
    bool isEnabled = true,
    bool isRequired = false,
  }) {
    return Semantics(
      textField: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      value: value,
      isRequired: isRequired,
      child: child,
    );
  }

  /// Create semantic card
  static Widget createSemanticCard({
    required Widget child,
    String? label,
    String? hint,
    bool isClickable = false,
    VoidCallback? onTap,
  }) {
    return Semantics(
      button: isClickable,
      label: label,
      hint: hint,
      onTap: isClickable ? onTap : null,
      child: child,
    );
  }

  /// Create semantic list
  static Widget createSemanticList({
    required Widget child,
    String? label,
    int? itemCount,
  }) {
    return Semantics(
      // list: true, // Not available
      label: label,
      child: child,
    );
  }

  /// Create semantic list item
  static Widget createSemanticListItem({
    required Widget child,
    String? label,
    String? hint,
    int? index,
    int? totalCount,
  }) {
    return Semantics(
      // listItem: true, // Not available
      label: label,
      hint: hint,
      child: child,
    );
  }

  /// Create semantic heading
  static Widget createSemanticHeading({
    required Widget child,
    int level = 1,
    String? label,
  }) {
    return Semantics(
      header: true,
      label: label,
      child: child,
    );
  }

  /// Create semantic image
  static Widget createSemanticImage({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return Semantics(
      image: true,
      label: label,
      hint: hint,
      child: child,
    );
  }

  /// Create semantic progress indicator
  static Widget createSemanticProgressIndicator({
    required Widget child,
    String? label,
    double? value,
    double? maxValue = 1.0,
  }) {
    return Semantics(
      // progressBar: true, // Not available
      label: label,
      // value and maxValue are not available as double in Semantics, so skip
      child: child,
    );
  }

  /// Create semantic switch
  static Widget createSemanticSwitch({
    required Widget child,
    String? label,
    String? hint,
    bool? value,
    bool isEnabled = true,
    ValueChanged<bool>? onChanged,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      toggled: value ?? false,
      onTap: isEnabled ? () => onChanged?.call(!(value ?? false)) : null,
      child: child,
    );
  }

  /// Create semantic checkbox
  static Widget createSemanticCheckbox({
    required Widget child,
    String? label,
    String? hint,
    bool? value,
    bool isEnabled = true,
    ValueChanged<bool>? onChanged,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      checked: value ?? false,
      onTap: isEnabled ? () => onChanged?.call(!(value ?? false)) : null,
      child: child,
    );
  }

  /// Create semantic radio button
  static Widget createSemanticRadioButton({
    required Widget child,
    String? label,
    String? hint,
    bool? value,
    bool isEnabled = true,
    ValueChanged<bool>? onChanged,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      checked: value ?? false,
      onTap: isEnabled ? () => onChanged?.call(!(value ?? false)) : null,
      child: child,
    );
  }

  /// Create semantic slider
  static Widget createSemanticSlider({
    required Widget child,
    String? label,
    String? hint,
    double? value,
    double? minValue = 0.0,
    double? maxValue = 1.0,
    bool isEnabled = true,
    ValueChanged<double>? onChanged,
  }) {
    return Semantics(
      slider: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      value: value?.toString(),
      // minValue: minValue, // Not available
      // maxValue: maxValue, // Not available
      onIncrease: isEnabled ? () => onChanged?.call((value ?? 0.0) + 0.1) : null,
      onDecrease: isEnabled ? () => onChanged?.call((value ?? 0.0) - 0.1) : null,
      child: child,
    );
  }

  /// Create semantic tab
  static Widget createSemanticTab({
    required Widget child,
    String? label,
    String? hint,
    bool isSelected = false,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      selected: isSelected,
      onTap: isEnabled ? onTap : null,
      child: child,
    );
  }

  /// Create semantic tooltip
  static Widget createSemanticTooltip({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return Semantics(
      tooltip: hint,
      label: label,
      child: child,
    );
  }

  /// Create semantic live region
  static Widget createSemanticLiveRegion({
    required Widget child,
    String? label,
    bool isPolite = true,
  }) {
    return Semantics(
      liveRegion: true,
      label: label,
      child: child,
    );
  }

  /// Create semantic landmark
  static Widget createSemanticLandmark({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      child: child,
    );
  }

  /// Create semantic group
  static Widget createSemanticGroup({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      child: child,
    );
  }

  /// Create semantic container
  static Widget createSemanticContainer({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return Semantics(
      container: true,
      label: label,
      hint: hint,
      child: child,
    );
  }

  /// Create semantic text
  static Widget createSemanticText({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      child: child,
    );
  }

  /// Create semantic button with icon
  static Widget createSemanticButtonWithIcon({
    required Widget child,
    required IconData icon,
    String? label,
    String? hint,
    VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: label,
      hint: hint,
      onTap: isEnabled ? onPressed : null,
      child: child,
    );
  }

  /// Create semantic button with text
  static Widget createSemanticButtonWithText({
    required Widget child,
    required String text,
    String? hint,
    VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: text,
      hint: hint,
      onTap: isEnabled ? onPressed : null,
      child: child,
    );
  }

  /// Create semantic button with icon and text
  static Widget createSemanticButtonWithIconAndText({
    required Widget child,
    required IconData icon,
    required String text,
    String? hint,
    VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return Semantics(
      button: true,
      enabled: isEnabled,
      label: '$text, $icon',
      hint: hint,
      onTap: isEnabled ? onPressed : null,
      child: child,
    );
  }
}
