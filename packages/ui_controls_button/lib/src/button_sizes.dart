import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'button_variants.dart';

/// Button size utilities for the Awesome UI button component.
/// 
/// Provides consistent sizing calculations and constraints for buttons
/// across different platforms and screen sizes.
class ButtonSizes {
  const ButtonSizes._();

  /// Get the height for a button size
  static double getHeight(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 32.0;
      case ButtonSize.sm:
        return 40.0;
      case ButtonSize.md:
        return 48.0;
      case ButtonSize.lg:
        return 56.0;
    }
  }

  /// Get the minimum width for a button size
  static double getMinWidth(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 64.0;
      case ButtonSize.sm:
        return 80.0;
      case ButtonSize.md:
        return 96.0;
      case ButtonSize.lg:
        return 112.0;
    }
  }

  /// Get the horizontal padding for a button size
  static EdgeInsets getHorizontalPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.sm);
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.md);
      case ButtonSize.md:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.lg);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.xl);
    }
  }

  /// Get the vertical padding for a button size
  static EdgeInsets getVerticalPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return const EdgeInsets.symmetric(vertical: AppSpacing.xs);
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(vertical: AppSpacing.sm);
      case ButtonSize.md:
        return const EdgeInsets.symmetric(vertical: AppSpacing.md);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(vertical: AppSpacing.lg);
    }
  }

  /// Get the icon size for a button size
  static double getIconSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 16.0;
      case ButtonSize.sm:
        return 18.0;
      case ButtonSize.md:
        return 20.0;
      case ButtonSize.lg:
        return 24.0;
    }
  }

  /// Get the font size for a button size
  static double getFontSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 12.0;
      case ButtonSize.sm:
        return 14.0;
      case ButtonSize.md:
        return 16.0;
      case ButtonSize.lg:
        return 18.0;
    }
  }

  /// Get the border radius for a button size
  static BorderRadius getBorderRadius(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return BorderRadius.circular(AppRadius.xs);
      case ButtonSize.sm:
        return BorderRadius.circular(AppRadius.sm);
      case ButtonSize.md:
        return BorderRadius.circular(AppRadius.md);
      case ButtonSize.lg:
        return BorderRadius.circular(AppRadius.lg);
    }
  }

  /// Get the elevation for a button size
  static double getElevation(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 0.0;
      case ButtonSize.sm:
        return 1.0;
      case ButtonSize.md:
        return 2.0;
      case ButtonSize.lg:
        return 3.0;
    }
  }

  /// Get the spacing between icon and text for a button size
  static double getIconSpacing(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return AppSpacing.xs;
      case ButtonSize.sm:
        return AppSpacing.sm;
      case ButtonSize.md:
        return AppSpacing.sm;
      case ButtonSize.lg:
        return AppSpacing.md;
    }
  }

  /// Get the loading indicator size for a button size
  static double getLoadingIndicatorSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 12.0;
      case ButtonSize.sm:
        return 14.0;
      case ButtonSize.md:
        return 16.0;
      case ButtonSize.lg:
        return 18.0;
    }
  }

  /// Get the focus ring width for a button size
  static double getFocusRingWidth(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 1.0;
      case ButtonSize.sm:
        return 1.5;
      case ButtonSize.md:
        return 2.0;
      case ButtonSize.lg:
        return 2.5;
    }
  }

  /// Get the minimum touch target size (accessibility)
  static double getMinTouchTargetSize(ButtonSize size) {
    // Ensure minimum 48dp touch target for accessibility
    return math.max(getHeight(size), 48.0);
  }

  /// Get the button constraints for a given size
  static BoxConstraints getConstraints(ButtonSize size, {bool isFullWidth = false}) {
    final minWidth = getMinWidth(size);
    final height = getHeight(size);
    
    return BoxConstraints(
      minWidth: isFullWidth ? double.infinity : minWidth,
      minHeight: height,
      maxHeight: height,
    );
  }

  /// Get the button padding for a given size
  static EdgeInsets getPadding(ButtonSize size) {
    return EdgeInsets.symmetric(
      horizontal: getHorizontalPadding(size).horizontal,
      vertical: getVerticalPadding(size).vertical,
    );
  }

  /// Get the border radius value for a button size
  static double getBorderRadiusValue(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 4.0;
      case ButtonSize.sm:
        return 6.0;
      case ButtonSize.md:
        return 8.0;
      case ButtonSize.lg:
        return 12.0;
    }
  }

  /// Get the border width for a button size
  static double getBorderWidth(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return 1.0;
      case ButtonSize.sm:
        return 1.0;
      case ButtonSize.md:
        return 1.5;
      case ButtonSize.lg:
        return 2.0;
    }
  }
}

