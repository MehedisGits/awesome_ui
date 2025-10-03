import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/semantics.dart';

/// Accessibility test utilities for the Awesome UI library.
class AccessibilityTestUtils {
  /// Test if a widget has correct semantic properties
  static void expectSemanticProperties(
    WidgetTester tester,
    Finder finder, {
    String? label,
    String? hint,
    bool? button,
    bool? enabled,
    bool? required,
    bool? textField,
  }) {
    final semantics = tester.getSemantics(finder);
    final matcher = matchesSemantics(
      label: label,
      hint: hint,
      isButton: button ?? false, 
      isEnabled: enabled ?? false, 
      isRequired: required ?? false, 
      isTextField: textField ?? false,
      
    );
    expect(semantics, matcher);
  }

  /// Test if a widget meets minimum touch target size
  static void expectMinimumTouchTarget(
    WidgetTester tester,
    Finder finder,
    double minSize,
  ) {
    final renderBox = tester.renderObject<RenderBox>(finder);
    final size = renderBox.size;
    expect(size.width, greaterThanOrEqualTo(minSize));
    expect(size.height, greaterThanOrEqualTo(minSize));
  }

  /// Test if a widget is focusable
  static void expectFocusable(
    WidgetTester tester,
    Finder finder,
  ) {
    final semantics = tester.getSemantics(finder);
    expect(semantics.hasFlag(SemanticsFlag.isFocusable), isTrue);
  }

  /// Test if a widget has correct color contrast
  static void expectColorContrast(
    Color foreground,
    Color background,
    double minRatio,
  ) {
    final contrast = _calculateContrast(foreground, background);
    expect(contrast, greaterThanOrEqualTo(minRatio));
  }

  /// Calculate color contrast ratio
  static double _calculateContrast(Color foreground, Color background) {
    final fgLuminance = _getLuminance(foreground);
    final bgLuminance = _getLuminance(background);
    final lighter = fgLuminance > bgLuminance ? fgLuminance : bgLuminance;
    final darker = fgLuminance > bgLuminance ? bgLuminance : fgLuminance;
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Get relative luminance of a color
  static double _getLuminance(Color color) {
    final r = color.red / 255.0;
    final g = color.green / 255.0;
    final b = color.blue / 255.0;
    
    final rsRGB = r <= 0.03928 ? r / 12.92 : pow((r + 0.055) / 1.055, 2.4);
    final gsRGB = g <= 0.03928 ? g / 12.92 : pow((g + 0.055) / 1.055, 2.4);
    final bsRGB = b <= 0.03928 ? b / 12.92 : pow((b + 0.055) / 1.055, 2.4);
    
    return 0.2126 * rsRGB + 0.7152 * gsRGB + 0.0722 * bsRGB;
  }
}
