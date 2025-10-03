import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'text_field_variants.dart';

/// Text field size utilities for the Awesome UI text field component.
/// 
/// Provides consistent sizing calculations and constraints for text fields
/// across different platforms and screen sizes.
class TextFieldSizes {
  const TextFieldSizes._();

  /// Get the height for a text field size
  static double getHeight(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return 40.0;
      case TextFieldSize.md:
        return 56.0;
      case TextFieldSize.lg:
        return 64.0;
    }
  }

  /// Get the minimum width for a text field size
  static double getMinWidth(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return 120.0;
      case TextFieldSize.md:
        return 160.0;
      case TextFieldSize.lg:
        return 200.0;
    }
  }

  /// Get the horizontal padding for a text field size
  static EdgeInsets getHorizontalPadding(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.sm);
      case TextFieldSize.md:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.md);
      case TextFieldSize.lg:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.lg);
    }
  }

  /// Get the vertical padding for a text field size
  static EdgeInsets getVerticalPadding(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return const EdgeInsets.symmetric(vertical: AppSpacing.xs);
      case TextFieldSize.md:
        return const EdgeInsets.symmetric(vertical: AppSpacing.sm);
      case TextFieldSize.lg:
        return const EdgeInsets.symmetric(vertical: AppSpacing.md);
    }
  }

  /// Get the content padding for a text field size
  static EdgeInsets getContentPadding(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        );
      case TextFieldSize.md:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        );
      case TextFieldSize.lg:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        );
    }
  }

  /// Get the icon size for a text field size
  static double getIconSize(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return 18.0;
      case TextFieldSize.md:
        return 20.0;
      case TextFieldSize.lg:
        return 24.0;
    }
  }

  /// Get the font size for a text field size
  static double getFontSize(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return 14.0;
      case TextFieldSize.md:
        return 16.0;
      case TextFieldSize.lg:
        return 18.0;
    }
  }

  /// Get the border radius for a text field size
  static BorderRadius getBorderRadius(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return BorderRadius.circular(AppRadius.sm);
      case TextFieldSize.md:
        return BorderRadius.circular(AppRadius.md);
      case TextFieldSize.lg:
        return BorderRadius.circular(AppRadius.lg);
    }
  }

  /// Get the border width for a text field size
  static double getBorderWidth(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return 1.0;
      case TextFieldSize.md:
        return 1.5;
      case TextFieldSize.lg:
        return 2.0;
    }
  }

  /// Get the focus ring width for a text field size
  static double getFocusRingWidth(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return 1.0;
      case TextFieldSize.md:
        return 2.0;
      case TextFieldSize.lg:
        return 2.5;
    }
  }

  /// Get the minimum touch target size (accessibility)
  static double getMinTouchTargetSize(TextFieldSize size) {
    // Ensure minimum 48dp touch target for accessibility
    return math.max(getHeight(size), 48.0);
  }

  /// Get the text field constraints for a given size
  static BoxConstraints getConstraints(TextFieldSize size, {bool isFullWidth = false}) {
    final minWidth = getMinWidth(size);
    final height = getHeight(size);
    
    return BoxConstraints(
      minWidth: isFullWidth ? double.infinity : minWidth,
      minHeight: height,
      maxHeight: height,
    );
  }

  /// Get the text field padding for a given size
  static EdgeInsets getPadding(TextFieldSize size) {
    return EdgeInsets.symmetric(
      horizontal: getHorizontalPadding(size).horizontal,
      vertical: getVerticalPadding(size).vertical,
    );
  }

  /// Get the label padding for a given size
  static EdgeInsets getLabelPadding(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return const EdgeInsets.only(left: AppSpacing.sm);
      case TextFieldSize.md:
        return const EdgeInsets.only(left: AppSpacing.md);
      case TextFieldSize.lg:
        return const EdgeInsets.only(left: AppSpacing.lg);
    }
  }

  /// Get the helper text padding for a given size
  static EdgeInsets getHelperTextPadding(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.sm:
        return const EdgeInsets.only(
          left: AppSpacing.sm,
          right: AppSpacing.sm,
          top: AppSpacing.xs,
        );
      case TextFieldSize.md:
        return const EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          top: AppSpacing.sm,
        );
      case TextFieldSize.lg:
        return const EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          top: AppSpacing.md,
        );
    }
  }
}

