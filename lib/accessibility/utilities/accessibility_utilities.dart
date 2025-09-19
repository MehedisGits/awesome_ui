import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Accessibility utilities
class AuiAccessibilityUtils {
  const AuiAccessibilityUtils._();

  /// Check if accessibility features are enabled
  static bool isAccessibilityEnabled(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return mediaQueryData.boldText ||
           mediaQueryData.highContrast ||
           mediaQueryData.onOffSwitchLabels ||
           mediaQueryData.disableAnimations ||
           mediaQueryData.invertColors;
  }

  /// Check if high contrast is enabled
  static bool isHighContrast(BuildContext context) {
    return MediaQuery.of(context).highContrast;
  }

  /// Check if bold text is enabled
  static bool isBoldText(BuildContext context) {
    return MediaQuery.of(context).boldText;
  }

  /// Check if reduce motion is enabled
  static bool isReduceMotion(BuildContext context) {
    return MediaQuery.of(context).disableAnimations;
  }

  /// Check if invert colors is enabled
  static bool isInvertColors(BuildContext context) {
    return MediaQuery.of(context).invertColors;
  }

  /// Check if on/off switch labels are enabled
  static bool isOnOffSwitchLabels(BuildContext context) {
    return MediaQuery.of(context).onOffSwitchLabels;
  }

  /// Get accessibility text scale factor
  static double getTextScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaler.scale(1.0);
  }

  /// Get platform brightness
  static Brightness getPlatformBrightness(BuildContext context) {
    return MediaQuery.of(context).platformBrightness;
  }

  /// Announce to screen reader
  static void announce(BuildContext context, String message) {
    debugPrint('Accessibility Announcement: $message');
  }

  /// Get accessibility-aware duration
  static Duration getAccessibleDuration(
    BuildContext context,
    Duration defaultDuration,
  ) {
    if (isReduceMotion(context)) {
      return Duration.zero;
    }
    return defaultDuration;
  }

  /// Get accessibility-aware text style
  static TextStyle getAccessibleTextStyle(
    BuildContext context,
    TextStyle baseStyle,
  ) {
    TextStyle style = baseStyle;
    
    if (isBoldText(context)) {
      style = style.copyWith(fontWeight: FontWeight.bold);
    }
    
    final textScaleFactor = getTextScaleFactor(context);
    if (textScaleFactor != 1.0) {
      style = style.copyWith(
        fontSize: (style.fontSize ?? 14) * textScaleFactor,
      );
    }
    
    return style;
  }

  /// Get accessibility-aware color
  static Color getAccessibleColor(
    BuildContext context,
    Color baseColor,
    Color backgroundColor,
  ) {
    if (isHighContrast(context)) {
      // Use high contrast colors
      final luminance = baseColor.computeLuminance();
      return luminance > 0.5 ? Colors.black : Colors.white;
    }
    
    if (isInvertColors(context)) {
      // Invert the color
      return Color.fromARGB(
        baseColor.alpha,
        255 - baseColor.red,
        255 - baseColor.green,
        255 - baseColor.blue,
      );
    }
    
    return baseColor;
  }

  /// Create accessible focus node
  static FocusNode createAccessibleFocusNode({
    String? debugLabel,
    bool skipTraversal = false,
    bool canRequestFocus = true,
  }) {
    return FocusNode(
      debugLabel: debugLabel,
      skipTraversal: skipTraversal,
      canRequestFocus: canRequestFocus,
    );
  }

  /// Create accessible semantics
  static Widget createAccessibleSemantics({
    required Widget child,
    String? label,
    String? hint,
    String? value,
    bool? button,
    bool? header,
    bool? textField,
    bool? image,
    bool? link,
    bool? focusable,
    bool? selected,
    bool? checked,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onIncrease,
    VoidCallback? onDecrease,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      value: value,
      button: button,
      header: header,
      textField: textField,
      image: image,
      link: link,
      focusable: focusable,
      selected: selected,
      checked: checked,
      onTap: onTap,
      onLongPress: onLongPress,
      onIncrease: onIncrease,
      onDecrease: onDecrease,
      child: child,
    );
  }

  /// Provide haptic feedback
  static void provideHapticFeedback() {
    HapticFeedback.vibrate();
  }

  /// Get accessible minimum touch target size
  static Size getMinimumTouchTargetSize(BuildContext context) {
    return const Size(48, 48); // Material Design minimum
  }

  /// Check if widget meets minimum touch target size
  static bool meetsMinimumTouchTargetSize(Size size, BuildContext context) {
    final minimumSize = getMinimumTouchTargetSize(context);
    return size.width >= minimumSize.width && size.height >= minimumSize.height;
  }

  /// Create accessible tooltip
  static Widget createAccessibleTooltip({
    required Widget child,
    required String message,
    Duration? showDuration,
    Duration? waitDuration,
  }) {
    return Tooltip(
      message: message,
      showDuration: showDuration,
      waitDuration: waitDuration,
      child: child,
    );
  }

  /// Create accessible button
  static Widget createAccessibleButton({
    required Widget child,
    required VoidCallback? onPressed,
    String? tooltip,
    String? semanticsLabel,
    bool autofocus = false,
    FocusNode? focusNode,
  }) {
    Widget button = ElevatedButton(
      onPressed: onPressed,
      autofocus: autofocus,
      focusNode: focusNode,
      child: child,
    );

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip,
        child: button,
      );
    }

    if (semanticsLabel != null) {
      button = Semantics(
        label: semanticsLabel,
        button: true,
        child: button,
      );
    }

    return button;
  }

  /// Create accessible text field
  static Widget createAccessibleTextField({
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    String? semanticsLabel,
    bool autofocus = false,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
  }) {
    return Semantics(
      label: semanticsLabel ?? labelText,
      textField: true,
      child: TextField(
        controller: controller,
        autofocus: autofocus,
        focusNode: focusNode,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          helperText: helperText,
          errorText: errorText,
        ),
      ),
    );
  }

  /// Create accessible checkbox
  static Widget createAccessibleCheckbox({
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    String? label,
    String? semanticsLabel,
    bool autofocus = false,
    FocusNode? focusNode,
  }) {
    Widget checkbox = Checkbox(
      value: value,
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
    );

    if (label != null) {
      checkbox = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkbox,
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => onChanged?.call(!(value ?? false)),
            child: Text(label),
          ),
        ],
      );
    }

    return Semantics(
      label: semanticsLabel ?? label,
      checked: value,
      child: checkbox,
    );
  }

  /// Create accessible switch
  static Widget createAccessibleSwitch({
    required bool value,
    required ValueChanged<bool>? onChanged,
    String? label,
    String? semanticsLabel,
    bool autofocus = false,
    FocusNode? focusNode,
  }) {
    Widget switchWidget = Switch(
      value: value,
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
    );

    if (label != null) {
      switchWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          switchWidget,
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => onChanged?.call(!value),
            child: Text(label),
          ),
        ],
      );
    }

    return Semantics(
      label: semanticsLabel ?? label,
      toggled: value,
      child: switchWidget,
    );
  }

  /// Create accessible slider
  static Widget createAccessibleSlider({
    required double value,
    required ValueChanged<double>? onChanged,
    double min = 0.0,
    double max = 1.0,
    int? divisions,
    String? label,
    String? semanticsLabel,
    bool autofocus = false,
    FocusNode? focusNode,
  }) {
    return Semantics(
      label: semanticsLabel ?? label,
      value: value.toString(),
      child: Slider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
        autofocus: autofocus,
        focusNode: focusNode,
      ),
    );
  }

  /// Create accessible list tile
  static Widget createAccessibleListTile({
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    String? semanticsLabel,
    bool selected = false,
    bool enabled = true,
    bool autofocus = false,
    FocusNode? focusNode,
  }) {
    return Semantics(
      label: semanticsLabel,
      button: onTap != null,
      selected: selected,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onTap: onTap,
        onLongPress: onLongPress,
        selected: selected,
        enabled: enabled,
        autofocus: autofocus,
        focusNode: focusNode,
      ),
    );
  }

  /// Get accessible animation duration
  static Duration getAnimationDuration(
    BuildContext context, {
    Duration short = const Duration(milliseconds: 150),
    Duration medium = const Duration(milliseconds: 300),
    Duration long = const Duration(milliseconds: 500),
  }) {
    if (isReduceMotion(context)) {
      return Duration.zero;
    }
    return medium;
  }

  /// Get accessible curve
  static Curve getAnimationCurve(BuildContext context) {
    if (isReduceMotion(context)) {
      return Curves.linear;
    }
    return Curves.easeInOut;
  }

  /// Check if large text is enabled
  static bool isLargeText(BuildContext context) {
    return getTextScaleFactor(context) > 1.3;
  }

  /// Get accessible font size
  static double getAccessibleFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    return baseFontSize * getTextScaleFactor(context);
  }

  /// Get accessible line height
  static double getAccessibleLineHeight(BuildContext context) {
    if (isLargeText(context)) {
      return 1.6; // Increased line height for large text
    }
    return 1.4;
  }

  /// Get accessible spacing
  static double getAccessibleSpacing(
    BuildContext context,
    double baseSpacing,
  ) {
    if (isLargeText(context)) {
      return baseSpacing * 1.2; // Increased spacing for large text
    }
    return baseSpacing;
  }
}
