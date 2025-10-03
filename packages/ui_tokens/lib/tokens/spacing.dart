import 'package:flutter/material.dart';

/// Design tokens for spacing and layout.
/// 
/// Provides consistent spacing tokens for margins, padding, and layout
/// that work across different screen sizes and platforms.
class AppSpacing {
  const AppSpacing._();

  /// Create a standard spacing instance
  factory AppSpacing.standard() => const AppSpacing._();

  /// Base spacing unit (4dp)
  static const double baseUnit = 4.0;

  /// Spacing tokens
  static const double xs = baseUnit * 1; // 4dp
  static const double sm = baseUnit * 2; // 8dp
  static const double md = baseUnit * 3; // 12dp
  static const double lg = baseUnit * 4; // 16dp
  static const double xl = baseUnit * 5; // 20dp
  static const double xxl = baseUnit * 6; // 24dp
  static const double xxxl = baseUnit * 8; // 32dp
  static const double xxxxl = baseUnit * 10; // 40dp
  static const double xxxxxl = baseUnit * 12; // 48dp
  static const double xxxxxxl = baseUnit * 16; // 64dp

  /// Semantic spacing tokens
  static const double none = 0.0;
  static const double micro = xs;
  static const double tiny = sm;
  static const double small = md;
  static const double medium = lg;
  static const double large = xl;
  static const double huge = xxl;
  static const double massive = xxxl;
  static const double enormous = xxxxl;
  static const double gigantic = xxxxxl;
  static const double colossal = xxxxxxl;

  /// Component-specific spacing
  static const double buttonPadding = md;
  static const double cardPadding = lg;
  static const double inputPadding = md;
  static const double modalPadding = xl;
  static const double sectionSpacing = xxl;
  static const double pagePadding = lg;
  static const double gridGap = md;
  static const double listItemSpacing = sm;

  /// EdgeInsets shortcuts (removed duplicates)

  /// Responsive spacing multipliers
  static const Map<String, double> breakpointMultipliers = {
    'mobile': 1.0,
    'tablet': 1.25,
    'desktop': 1.5,
    'largeDesktop': 1.75,
  };

  /// Get responsive spacing
  static double getResponsiveSpacing(double baseSpacing, String breakpoint) {
    final multiplier = breakpointMultipliers[breakpoint] ?? 1.0;
    return baseSpacing * multiplier;
  }

  /// Edge insets helpers
  static EdgeInsets all(double value) => EdgeInsets.all(value);
  static EdgeInsets horizontal(double value) => EdgeInsets.symmetric(horizontal: value);
  static EdgeInsets vertical(double value) => EdgeInsets.symmetric(vertical: value);
  static EdgeInsets only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => EdgeInsets.only(
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );

  /// Common edge insets
  static const EdgeInsets paddingNone = EdgeInsets.zero;
  static const EdgeInsets paddingMicro = EdgeInsets.all(micro);
  static const EdgeInsets paddingTiny = EdgeInsets.all(tiny);
  static const EdgeInsets paddingSmall = EdgeInsets.all(small);
  static const EdgeInsets paddingMedium = EdgeInsets.all(medium);
  static const EdgeInsets paddingLarge = EdgeInsets.all(large);
  static const EdgeInsets paddingHuge = EdgeInsets.all(huge);
  static const EdgeInsets paddingMassive = EdgeInsets.all(massive);

  /// Horizontal padding
  static const EdgeInsets paddingHorizontalNone = EdgeInsets.zero;
  static const EdgeInsets paddingHorizontalMicro = EdgeInsets.symmetric(horizontal: micro);
  static const EdgeInsets paddingHorizontalTiny = EdgeInsets.symmetric(horizontal: tiny);
  static const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(horizontal: small);
  static const EdgeInsets paddingHorizontalMedium = EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets paddingHorizontalLarge = EdgeInsets.symmetric(horizontal: large);
  static const EdgeInsets paddingHorizontalHuge = EdgeInsets.symmetric(horizontal: huge);
  static const EdgeInsets paddingHorizontalMassive = EdgeInsets.symmetric(horizontal: massive);

  /// Vertical padding
  static const EdgeInsets paddingVerticalNone = EdgeInsets.zero;
  static const EdgeInsets paddingVerticalMicro = EdgeInsets.symmetric(vertical: micro);
  static const EdgeInsets paddingVerticalTiny = EdgeInsets.symmetric(vertical: tiny);
  static const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets paddingVerticalMedium = EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(vertical: large);
  static const EdgeInsets paddingVerticalHuge = EdgeInsets.symmetric(vertical: huge);
  static const EdgeInsets paddingVerticalMassive = EdgeInsets.symmetric(vertical: massive);

  /// Component-specific edge insets (renamed to avoid duplicates)
  static const EdgeInsets buttonPaddingInsets = EdgeInsets.all(buttonPadding);
  static const EdgeInsets cardPaddingInsets = EdgeInsets.all(cardPadding);
  static const EdgeInsets inputPaddingInsets = EdgeInsets.all(inputPadding);
  static const EdgeInsets modalPaddingInsets = EdgeInsets.all(modalPadding);
  static const EdgeInsets pagePaddingInsets = EdgeInsets.all(pagePadding);

  /// Margin helpers
  static const EdgeInsets marginNone = EdgeInsets.zero;
  static const EdgeInsets marginMicro = EdgeInsets.all(micro);
  static const EdgeInsets marginTiny = EdgeInsets.all(tiny);
  static const EdgeInsets marginSmall = EdgeInsets.all(small);
  static const EdgeInsets marginMedium = EdgeInsets.all(medium);
  static const EdgeInsets marginLarge = EdgeInsets.all(large);
  static const EdgeInsets marginHuge = EdgeInsets.all(huge);
  static const EdgeInsets marginMassive = EdgeInsets.all(massive);

  /// Horizontal margin
  static const EdgeInsets marginHorizontalNone = EdgeInsets.zero;
  static const EdgeInsets marginHorizontalMicro = EdgeInsets.symmetric(horizontal: micro);
  static const EdgeInsets marginHorizontalTiny = EdgeInsets.symmetric(horizontal: tiny);
  static const EdgeInsets marginHorizontalSmall = EdgeInsets.symmetric(horizontal: small);
  static const EdgeInsets marginHorizontalMedium = EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets marginHorizontalLarge = EdgeInsets.symmetric(horizontal: large);
  static const EdgeInsets marginHorizontalHuge = EdgeInsets.symmetric(horizontal: huge);
  static const EdgeInsets marginHorizontalMassive = EdgeInsets.symmetric(horizontal: massive);

  /// Vertical margin
  static const EdgeInsets marginVerticalNone = EdgeInsets.zero;
  static const EdgeInsets marginVerticalMicro = EdgeInsets.symmetric(vertical: micro);
  static const EdgeInsets marginVerticalTiny = EdgeInsets.symmetric(vertical: tiny);
  static const EdgeInsets marginVerticalSmall = EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets marginVerticalMedium = EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets marginVerticalLarge = EdgeInsets.symmetric(vertical: large);
  static const EdgeInsets marginVerticalHuge = EdgeInsets.symmetric(vertical: huge);
  static const EdgeInsets marginVerticalMassive = EdgeInsets.symmetric(vertical: massive);

  /// Spacing between elements
  static const double gapNone = none;
  static const double gapMicro = micro;
  static const double gapTiny = tiny;
  static const double gapSmall = small;
  static const double gapMedium = medium;
  static const double gapLarge = large;
  static const double gapHuge = huge;
  static const double gapMassive = massive;

  /// Grid spacing
  static const double gridGapSmall = sm;
  static const double gridGapMedium = md;
  static const double gridGapLarge = lg;
  static const double gridGapHuge = xl;

  /// List spacing
  static const double listGapSmall = xs;
  static const double listGapMedium = sm;
  static const double listGapLarge = md;
  static const double listGapHuge = lg;

  /// Section spacing
  static const double sectionGapSmall = lg;
  static const double sectionGapMedium = xl;
  static const double sectionGapLarge = xxl;
  static const double sectionGapHuge = xxxl;
}
