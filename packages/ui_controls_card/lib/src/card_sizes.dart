import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';

/// Card size enumeration
enum CardSize {
  sm,
  md,
  lg,
  xl,
}

/// Card size utilities for the Awesome UI card component.
/// 
/// Provides consistent sizing calculations and constraints for cards
/// across different platforms and screen sizes.
class CardSizes {
  const CardSizes._();

  /// Get the width for a card size
  static double getWidth(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 200.0;
      case CardSize.md:
        return 300.0;
      case CardSize.lg:
        return 400.0;
      case CardSize.xl:
        return 500.0;
    }
  }

  /// Get the height for a card size
  static double getHeight(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 150.0;
      case CardSize.md:
        return 200.0;
      case CardSize.lg:
        return 250.0;
      case CardSize.xl:
        return 300.0;
    }
  }

  /// Get the minimum width for a card size
  static double getMinWidth(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 160.0;
      case CardSize.md:
        return 240.0;
      case CardSize.lg:
        return 320.0;
      case CardSize.xl:
        return 400.0;
    }
  }

  /// Get the minimum height for a card size
  static double getMinHeight(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 120.0;
      case CardSize.md:
        return 160.0;
      case CardSize.lg:
        return 200.0;
      case CardSize.xl:
        return 240.0;
    }
  }

  /// Get the padding for a card size
  static EdgeInsets getPadding(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return const EdgeInsets.all(AppSpacing.sm);
      case CardSize.md:
        return const EdgeInsets.all(AppSpacing.md);
      case CardSize.lg:
        return const EdgeInsets.all(AppSpacing.lg);
      case CardSize.xl:
        return const EdgeInsets.all(AppSpacing.xl);
    }
  }

  /// Get the margin for a card size
  static EdgeInsets getMargin(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return const EdgeInsets.all(AppSpacing.xs);
      case CardSize.md:
        return const EdgeInsets.all(AppSpacing.sm);
      case CardSize.lg:
        return const EdgeInsets.all(AppSpacing.md);
      case CardSize.xl:
        return const EdgeInsets.all(AppSpacing.lg);
    }
  }

  /// Get the border radius for a card size
  static BorderRadius getBorderRadius(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return BorderRadius.circular(AppRadius.sm);
      case CardSize.md:
        return BorderRadius.circular(AppRadius.md);
      case CardSize.lg:
        return BorderRadius.circular(AppRadius.lg);
      case CardSize.xl:
        return BorderRadius.circular(AppRadius.xl);
    }
  }

  /// Get the border width for a card size
  static double getBorderWidth(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 1.0;
      case CardSize.md:
        return 1.5;
      case CardSize.lg:
        return 2.0;
      case CardSize.xl:
        return 2.5;
    }
  }

  /// Get the elevation for a card size
  static double getElevation(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 1.0;
      case CardSize.md:
        return 2.0;
      case CardSize.lg:
        return 3.0;
      case CardSize.xl:
        return 4.0;
    }
  }

  /// Get the shadow blur radius for a card size
  static double getShadowBlurRadius(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 4.0;
      case CardSize.md:
        return 8.0;
      case CardSize.lg:
        return 12.0;
      case CardSize.xl:
        return 16.0;
    }
  }

  /// Get the shadow spread radius for a card size
  static double getShadowSpreadRadius(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 0.0;
      case CardSize.md:
        return 1.0;
      case CardSize.lg:
        return 2.0;
      case CardSize.xl:
        return 3.0;
    }
  }

  /// Get the focus ring width for a card size
  static double getFocusRingWidth(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 1.0;
      case CardSize.md:
        return 2.0;
      case CardSize.lg:
        return 2.5;
      case CardSize.xl:
        return 3.0;
    }
  }

  /// Get the minimum touch target size (accessibility)
  static double getMinTouchTargetSize(CardSize size) {
    // Ensure minimum 48dp touch target for accessibility
    return math.max(getHeight(size), 48.0);
  }

  /// Get the card constraints for a given size
  static BoxConstraints getConstraints(CardSize size, {bool isFullWidth = false}) {
    final minWidth = getMinWidth(size);
    final minHeight = getMinHeight(size);
    
    return BoxConstraints(
      minWidth: isFullWidth ? double.infinity : minWidth,
      minHeight: minHeight,
    );
  }

  /// Get the card size for a given screen width
  static CardSize getResponsiveSize(double screenWidth) {
    if (screenWidth < 600) {
      return CardSize.sm;
    } else if (screenWidth < 900) {
      return CardSize.md;
    } else if (screenWidth < 1200) {
      return CardSize.lg;
    } else {
      return CardSize.xl;
    }
  }

  /// Get the card size for a given breakpoint
  static CardSize getSizeForBreakpoint(String breakpoint) {
    switch (breakpoint) {
      case 'mobile':
        return CardSize.sm;
      case 'tablet':
        return CardSize.md;
      case 'desktop':
        return CardSize.lg;
      case 'largeDesktop':
        return CardSize.xl;
      default:
        return CardSize.md;
    }
  }

  /// Get the card aspect ratio for a given size
  static double getAspectRatio(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 4 / 3;
      case CardSize.md:
        return 3 / 2;
      case CardSize.lg:
        return 16 / 10;
      case CardSize.xl:
        return 16 / 9;
    }
  }

  /// Get the card spacing for a given size
  static double getSpacing(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return AppSpacing.xs;
      case CardSize.md:
        return AppSpacing.sm;
      case CardSize.lg:
        return AppSpacing.md;
      case CardSize.xl:
        return AppSpacing.lg;
    }
  }

  /// Get the card icon size for a given size
  static double getIconSize(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 16.0;
      case CardSize.md:
        return 20.0;
      case CardSize.lg:
        return 24.0;
      case CardSize.xl:
        return 28.0;
    }
  }

  /// Get the card font size for a given size
  static double getFontSize(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 12.0;
      case CardSize.md:
        return 14.0;
      case CardSize.lg:
        return 16.0;
      case CardSize.xl:
        return 18.0;
    }
  }

  /// Get the card title font size for a given size
  static double getTitleFontSize(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 14.0;
      case CardSize.md:
        return 16.0;
      case CardSize.lg:
        return 18.0;
      case CardSize.xl:
        return 20.0;
    }
  }

  /// Get the card subtitle font size for a given size
  static double getSubtitleFontSize(CardSize size) {
    switch (size) {
      case CardSize.sm:
        return 10.0;
      case CardSize.md:
        return 12.0;
      case CardSize.lg:
        return 14.0;
      case CardSize.xl:
        return 16.0;
    }
  }

  /// Get the border width for a card size (duplicate method removed)
}
