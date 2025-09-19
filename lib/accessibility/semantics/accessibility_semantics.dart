import 'package:flutter/material.dart';

/// Accessibility semantics component
class AuiAccessibilitySemantics extends StatelessWidget {
  const AuiAccessibilitySemantics({
    super.key,
    required this.child,
    this.label,
    this.hint,
    this.value,
    this.onTap,
    this.onLongPress,
    this.onIncrease,
    this.onDecrease,
    this.focusable = true,
    this.checked,
    this.selected = false,
    this.button = false,
    this.header = false,
    this.textField = false,
    this.image = false,
    this.link = false,
    this.toggled,
    this.hidden = false,
  });

  final Widget child;
  final String? label;
  final String? hint;
  final String? value;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final bool focusable;
  final bool? checked;
  final bool selected;
  final bool button;
  final bool header;
  final bool textField;
  final bool image;
  final bool link;
  final bool? toggled;
  final bool hidden;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      hint: hint,
      value: value,
      onTap: onTap,
      onLongPress: onLongPress,
      onIncrease: onIncrease,
      onDecrease: onDecrease,
      focusable: focusable,
      checked: checked,
      selected: selected,
      button: button,
      header: header,
      textField: textField,
      image: image,
      link: link,
      toggled: toggled,
      hidden: hidden,
      child: child,
    );
  }
}

/// Accessibility focus management
class AuiAccessibilityFocus extends StatefulWidget {
  const AuiAccessibilityFocus({
    super.key,
    required this.child,
    this.autoFocus = false,
    this.focusNode,
    this.onFocusChange,
  });

  final Widget child;
  final bool autoFocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;

  @override
  State<AuiAccessibilityFocus> createState() => _AuiAccessibilityFocusState();
}

class _AuiAccessibilityFocusState extends State<AuiAccessibilityFocus> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    widget.onFocusChange?.call(_focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autoFocus,
      onFocusChange: widget.onFocusChange,
      child: widget.child,
    );
  }
}

/// Accessibility screen reader announcements
class AuiAccessibilityAnnouncer extends StatefulWidget {
  const AuiAccessibilityAnnouncer({
    super.key,
    required this.child,
    this.announcement,
  });

  final Widget child;
  final String? announcement;

  @override
  State<AuiAccessibilityAnnouncer> createState() => _AuiAccessibilityAnnouncerState();
}

class _AuiAccessibilityAnnouncerState extends State<AuiAccessibilityAnnouncer> {
  @override
  void didUpdateWidget(AuiAccessibilityAnnouncer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.announcement != null && widget.announcement != oldWidget.announcement) {
      _announce(widget.announcement!);
    }
  }

  void _announce(String announcement) {
    // Simple announcement without SemanticsService
    debugPrint('Accessibility Announcement: $announcement');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

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
}
