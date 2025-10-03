import 'package:flutter/material.dart';
import '../accessibility/semantic_helpers.dart';
import '../accessibility/contrast_utils.dart';
import '../accessibility/focus_utils.dart';

/// Mixin for components that need accessibility support.
mixin AccessibilityMixin<T extends StatefulWidget> on State<T> {
  /// Create semantic button
  Widget createSemanticButton({
    required Widget child,
    required VoidCallback? onPressed,
    String? label,
    String? hint,
    bool isEnabled = true,
  }) {
    return SemanticHelpers.createSemanticButton(
      child: child,
      onPressed: onPressed,
      label: label,
      hint: hint,
      isEnabled: isEnabled,
    );
  }

  /// Create semantic text field
  Widget createSemanticTextField({
    required Widget child,
    String? label,
    String? hint,
    String? value,
    bool isEnabled = true,
    bool isRequired = false,
  }) {
    return SemanticHelpers.createSemanticTextField(
      child: child,
      label: label,
      hint: hint,
      value: value,
      isEnabled: isEnabled,
      isRequired: isRequired,
    );
  }

  /// Create semantic card
  Widget createSemanticCard({
    required Widget child,
    String? label,
    String? hint,
    bool isClickable = false,
    VoidCallback? onTap,
  }) {
    return SemanticHelpers.createSemanticCard(
      child: child,
      label: label,
      hint: hint,
      isClickable: isClickable,
      onTap: onTap,
    );
  }

  /// Create semantic list
  Widget createSemanticList({
    required Widget child,
    String? label,
    int? itemCount,
  }) {
    return SemanticHelpers.createSemanticList(
      child: child,
      label: label,
      itemCount: itemCount,
    );
  }

  /// Create semantic list item
  Widget createSemanticListItem({
    required Widget child,
    String? label,
    String? hint,
    int? index,
    int? totalCount,
  }) {
    return SemanticHelpers.createSemanticListItem(
      child: child,
      label: label,
      hint: hint,
      index: index,
      totalCount: totalCount,
    );
  }

  /// Create semantic heading
  Widget createSemanticHeading({
    required Widget child,
    int level = 1,
    String? label,
  }) {
    return SemanticHelpers.createSemanticHeading(
      child: child,
      level: level,
      label: label,
    );
  }

  /// Create semantic image
  Widget createSemanticImage({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return SemanticHelpers.createSemanticImage(
      child: child,
      label: label,
      hint: hint,
    );
  }

  /// Create semantic progress indicator
  Widget createSemanticProgressIndicator({
    required Widget child,
    String? label,
    double? value,
    double? maxValue = 1.0,
  }) {
    return SemanticHelpers.createSemanticProgressIndicator(
      child: child,
      label: label,
      value: value,
      maxValue: maxValue,
    );
  }

  /// Create semantic switch
  Widget createSemanticSwitch({
    required Widget child,
    String? label,
    String? hint,
    bool? value,
    bool isEnabled = true,
    ValueChanged<bool>? onChanged,
  }) {
    return SemanticHelpers.createSemanticSwitch(
      child: child,
      label: label,
      hint: hint,
      value: value,
      isEnabled: isEnabled,
      onChanged: onChanged,
    );
  }

  /// Create semantic checkbox
  Widget createSemanticCheckbox({
    required Widget child,
    String? label,
    String? hint,
    bool? value,
    bool isEnabled = true,
    ValueChanged<bool>? onChanged,
  }) {
    return SemanticHelpers.createSemanticCheckbox(
      child: child,
      label: label,
      hint: hint,
      value: value,
      isEnabled: isEnabled,
      onChanged: onChanged,
    );
  }

  /// Create semantic radio button
  Widget createSemanticRadioButton({
    required Widget child,
    String? label,
    String? hint,
    bool? value,
    bool isEnabled = true,
    ValueChanged<bool>? onChanged,
  }) {
    return SemanticHelpers.createSemanticRadioButton(
      child: child,
      label: label,
      hint: hint,
      value: value,
      isEnabled: isEnabled,
      onChanged: onChanged,
    );
  }

  /// Create semantic slider
  Widget createSemanticSlider({
    required Widget child,
    String? label,
    String? hint,
    double? value,
    double? minValue = 0.0,
    double? maxValue = 1.0,
    bool isEnabled = true,
    ValueChanged<double>? onChanged,
  }) {
    return SemanticHelpers.createSemanticSlider(
      child: child,
      label: label,
      hint: hint,
      value: value,
      minValue: minValue,
      maxValue: maxValue,
      isEnabled: isEnabled,
      onChanged: onChanged,
    );
  }

  /// Create semantic tab
  Widget createSemanticTab({
    required Widget child,
    String? label,
    String? hint,
    bool isSelected = false,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return SemanticHelpers.createSemanticTab(
      child: child,
      label: label,
      hint: hint,
      isSelected: isSelected,
      isEnabled: isEnabled,
      onTap: onTap,
    );
  }

  /// Create semantic tooltip
  Widget createSemanticTooltip({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return SemanticHelpers.createSemanticTooltip(
      child: child,
      label: label,
      hint: hint,
    );
  }

  /// Create semantic live region
  Widget createSemanticLiveRegion({
    required Widget child,
    String? label,
    bool isPolite = true,
  }) {
    return SemanticHelpers.createSemanticLiveRegion(
      child: child,
      label: label,
      isPolite: isPolite,
    );
  }

  /// Create semantic landmark
  Widget createSemanticLandmark({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return SemanticHelpers.createSemanticLandmark(
      child: child,
      label: label,
      hint: hint,
    );
  }

  /// Create semantic group
  Widget createSemanticGroup({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return SemanticHelpers.createSemanticGroup(
      child: child,
      label: label,
      hint: hint,
    );
  }

  /// Create semantic container
  Widget createSemanticContainer({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return SemanticHelpers.createSemanticContainer(
      child: child,
      label: label,
      hint: hint,
    );
  }

  /// Create semantic text
  Widget createSemanticText({
    required Widget child,
    String? label,
    String? hint,
  }) {
    return SemanticHelpers.createSemanticText(
      child: child,
      label: label,
      hint: hint,
    );
  }

  /// Create semantic button with icon
  Widget createSemanticButtonWithIcon({
    required Widget child,
    required IconData icon,
    String? label,
    String? hint,
    VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return SemanticHelpers.createSemanticButtonWithIcon(
      child: child,
      icon: icon,
      label: label,
      hint: hint,
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  /// Create semantic button with text
  Widget createSemanticButtonWithText({
    required Widget child,
    required String text,
    String? hint,
    VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return SemanticHelpers.createSemanticButtonWithText(
      child: child,
      text: text,
      hint: hint,
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  /// Create semantic button with icon and text
  Widget createSemanticButtonWithIconAndText({
    required Widget child,
    required IconData icon,
    required String text,
    String? hint,
    VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return SemanticHelpers.createSemanticButtonWithIconAndText(
      child: child,
      icon: icon,
      text: text,
      hint: hint,
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  /// Create focusable widget with accessibility support
  Widget createFocusableWidget({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    bool descendantsAreFocusable = true,
    VoidCallback? onFocusChange,
    ValueChanged<bool>? onFocusChangeWithValue,
  }) {
    return FocusUtils.createFocusableWidget(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      descendantsAreFocusable: descendantsAreFocusable,
      onFocusChange: onFocusChange,
      onFocusChangeWithValue: onFocusChangeWithValue,
    );
  }

  /// Create focusable button with accessibility support
  Widget createFocusableButton({
    required Widget child,
    required VoidCallback? onPressed,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? tooltip,
  }) {
    return FocusUtils.createFocusableButton(
      child: child,
      onPressed: onPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      tooltip: tooltip,
    );
  }

  /// Create focusable text field with accessibility support
  Widget createFocusableTextField({
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
    return FocusUtils.createFocusableTextField(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      value: value,
      isRequired: isRequired,
    );
  }

  /// Create focusable card with accessibility support
  Widget createFocusableCard({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
    VoidCallback? onTap,
  }) {
    return FocusUtils.createFocusableCard(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      onTap: onTap,
    );
  }

  /// Create focusable list with accessibility support
  Widget createFocusableList({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    int? itemCount,
  }) {
    return FocusUtils.createFocusableList(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      itemCount: itemCount,
    );
  }

  /// Create focusable list item with accessibility support
  Widget createFocusableListItem({
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
    return FocusUtils.createFocusableListItem(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      index: index,
      totalCount: totalCount,
    );
  }

  /// Create focusable heading with accessibility support
  Widget createFocusableHeading({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    int level = 1,
  }) {
    return FocusUtils.createFocusableHeading(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      level: level,
    );
  }

  /// Create focusable image with accessibility support
  Widget createFocusableImage({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return FocusUtils.createFocusableImage(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
    );
  }

  /// Create focusable progress indicator with accessibility support
  Widget createFocusableProgressIndicator({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    double? value,
    double? maxValue = 1.0,
  }) {
    return FocusUtils.createFocusableProgressIndicator(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      value: value,
      maxValue: maxValue,
    );
  }

  /// Create focusable switch with accessibility support
  Widget createFocusableSwitch({
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
    return FocusUtils.createFocusableSwitch(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      value: value,
      onChanged: onChanged,
    );
  }

  /// Create focusable checkbox with accessibility support
  Widget createFocusableCheckbox({
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
    return FocusUtils.createFocusableCheckbox(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      value: value,
      onChanged: onChanged,
    );
  }

  /// Create focusable radio button with accessibility support
  Widget createFocusableRadioButton({
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
    return FocusUtils.createFocusableRadioButton(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      value: value,
      onChanged: onChanged,
    );
  }

  /// Create focusable slider with accessibility support
  Widget createFocusableSlider({
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
    return FocusUtils.createFocusableSlider(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      value: value,
      minValue: minValue,
      maxValue: maxValue,
      onChanged: onChanged,
    );
  }

  /// Create focusable tab with accessibility support
  Widget createFocusableTab({
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
    return FocusUtils.createFocusableTab(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  /// Create focusable tooltip with accessibility support
  Widget createFocusableTooltip({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return FocusUtils.createFocusableTooltip(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
    );
  }

  /// Create focusable live region with accessibility support
  Widget createFocusableLiveRegion({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    bool isPolite = true,
  }) {
    return FocusUtils.createFocusableLiveRegion(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      isPolite: isPolite,
    );
  }

  /// Create focusable landmark with accessibility support
  Widget createFocusableLandmark({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return FocusUtils.createFocusableLandmark(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
    );
  }

  /// Create focusable group with accessibility support
  Widget createFocusableGroup({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return FocusUtils.createFocusableGroup(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
    );
  }

  /// Create focusable container with accessibility support
  Widget createFocusableContainer({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return FocusUtils.createFocusableContainer(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
    );
  }

  /// Create focusable text with accessibility support
  Widget createFocusableText({
    required Widget child,
    FocusNode? focusNode,
    bool autofocus = false,
    bool canRequestFocus = true,
    bool skipTraversal = false,
    String? semanticLabel,
    String? hint,
  }) {
    return FocusUtils.createFocusableText(
      child: child,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      semanticLabel: semanticLabel,
      hint: hint,
    );
  }

  /// Calculate contrast ratio between two colors
  double calculateContrastRatio(Color color1, Color color2) {
    return ContrastUtils.calculateContrastRatio(color1, color2);
  }

  /// Check if contrast ratio meets WCAG AA standards
  bool meetsWCAGAA(Color foreground, Color background) {
    return ContrastUtils.meetsWCAGAA(foreground, background);
  }

  /// Check if contrast ratio meets WCAG AAA standards
  bool meetsWCAGAAA(Color foreground, Color background) {
    return ContrastUtils.meetsWCAGAAA(foreground, background);
  }

  /// Get accessible text color for background
  Color getAccessibleTextColor(Color background) {
    return ContrastUtils.getAccessibleTextColor(background);
  }

  /// Get accessible background color for text
  Color getAccessibleBackgroundColor(Color text) {
    return ContrastUtils.getAccessibleBackgroundColor(text);
  }

  /// Adjust color to meet contrast requirements
  Color adjustColorForContrast(Color color, Color background, double minContrast) {
    return ContrastUtils.adjustColorForContrast(color, background, minContrast);
  }

  /// Get high contrast color variant
  Color getHighContrastColor(Color color) {
    return ContrastUtils.getHighContrastColor(color);
  }

  /// Check if colors are high contrast
  bool isHighContrast(Color color1, Color color2) {
    return ContrastUtils.isHighContrast(color1, color2);
  }

  /// Get contrast level description
  String getContrastLevelDescription(Color foreground, Color background) {
    return ContrastUtils.getContrastLevelDescription(foreground, background);
  }

  /// Get contrast level color
  Color getContrastLevelColor(Color foreground, Color background) {
    return ContrastUtils.getContrastLevelColor(foreground, background);
  }

  /// Create accessible color scheme
  ColorScheme createAccessibleColorScheme(ColorScheme baseScheme) {
    return ContrastUtils.createAccessibleColorScheme(baseScheme);
  }
}
