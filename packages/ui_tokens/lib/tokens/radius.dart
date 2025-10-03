import 'package:flutter/material.dart';

/// Design tokens for border radius and rounded corners.
/// 
/// Provides consistent border radius tokens that work across different
/// components and platforms.
class AppRadius {
  const AppRadius._();

  /// Create a standard radius instance
  factory AppRadius.standard() => const AppRadius._();

  /// Base radius unit (4dp)
  static const double baseUnit = 4.0;

  /// Radius tokens
  static const double none = 0.0;
  static const double xs = baseUnit * 0.5; // 2dp
  static const double sm = baseUnit * 1; // 4dp
  static const double md = baseUnit * 1.5; // 6dp
  static const double lg = baseUnit * 2; // 8dp
  static const double xl = baseUnit * 2.5; // 10dp
  static const double xxl = baseUnit * 3; // 12dp
  static const double xxxl = baseUnit * 4; // 16dp
  static const double xxxxl = baseUnit * 5; // 20dp
  static const double xxxxxl = baseUnit * 6; // 24dp
  static const double xxxxxxl = baseUnit * 8; // 32dp

  /// Semantic radius tokens
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

  /// Component-specific radius
  static const double button = md;
  static const double card = lg;
  static const double input = sm;
  static const double modal = xl;
  static const double chip = xxxxxl;
  static const double avatar = xxxxxxl;
  static const double badge = xxxxxl;
  static const double tooltip = sm;
  static const double bottomSheet = xl;
  static const double dialog = xl;

  /// BorderRadius shortcuts
  static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(button));
  static const BorderRadius inputRadius = BorderRadius.all(Radius.circular(input));
  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(card));
  static const BorderRadius modalRadius = BorderRadius.all(Radius.circular(modal));
  static const BorderRadius chipRadius = BorderRadius.all(Radius.circular(chip));
  static const BorderRadius tooltipRadius = BorderRadius.all(Radius.circular(tooltip));

  /// Border radius objects
  static const BorderRadius noneRadius = BorderRadius.zero;
  static const BorderRadius xsRadius = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius smRadius = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdRadius = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgRadius = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlRadius = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius xxlRadius = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius xxxlRadius = BorderRadius.all(Radius.circular(xxxl));
  static const BorderRadius xxxxlRadius = BorderRadius.all(Radius.circular(xxxxl));
  static const BorderRadius xxxxxlRadius = BorderRadius.all(Radius.circular(xxxxxl));
  static const BorderRadius xxxxxxlRadius = BorderRadius.all(Radius.circular(xxxxxxl));

  /// Semantic border radius objects
  static const BorderRadius microRadius = xsRadius;
  static const BorderRadius tinyRadius = smRadius;
  static const BorderRadius smallRadius = mdRadius;
  static const BorderRadius mediumRadius = lgRadius;
  static const BorderRadius largeRadius = xlRadius;
  static const BorderRadius hugeRadius = xxlRadius;
  static const BorderRadius massiveRadius = xxxlRadius;
  static const BorderRadius enormousRadius = xxxxlRadius;
  static const BorderRadius giganticRadius = xxxxxlRadius;
  static const BorderRadius colossalRadius = xxxxxxlRadius;

  /// Component-specific border radius
  static const BorderRadius avatarRadius = BorderRadius.all(Radius.circular(avatar));
  static const BorderRadius badgeRadius = BorderRadius.all(Radius.circular(badge));
  static const BorderRadius bottomSheetRadius = BorderRadius.all(Radius.circular(bottomSheet));
  static const BorderRadius dialogRadius = BorderRadius.all(Radius.circular(dialog));

  /// Rounded corners (top only)
  static const BorderRadius topNone = BorderRadius.zero;
  static const BorderRadius topXs = BorderRadius.only(
    topLeft: Radius.circular(xs),
    topRight: Radius.circular(xs),
  );
  static const BorderRadius topSm = BorderRadius.only(
    topLeft: Radius.circular(sm),
    topRight: Radius.circular(sm),
  );
  static const BorderRadius topMd = BorderRadius.only(
    topLeft: Radius.circular(md),
    topRight: Radius.circular(md),
  );
  static const BorderRadius topLg = BorderRadius.only(
    topLeft: Radius.circular(lg),
    topRight: Radius.circular(lg),
  );
  static const BorderRadius topXl = BorderRadius.only(
    topLeft: Radius.circular(xl),
    topRight: Radius.circular(xl),
  );
  static const BorderRadius topXxl = BorderRadius.only(
    topLeft: Radius.circular(xxl),
    topRight: Radius.circular(xxl),
  );
  static const BorderRadius topXxxl = BorderRadius.only(
    topLeft: Radius.circular(xxxl),
    topRight: Radius.circular(xxxl),
  );

  /// Rounded corners (bottom only)
  static const BorderRadius bottomNone = BorderRadius.zero;
  static const BorderRadius bottomXs = BorderRadius.only(
    bottomLeft: Radius.circular(xs),
    bottomRight: Radius.circular(xs),
  );
  static const BorderRadius bottomSm = BorderRadius.only(
    bottomLeft: Radius.circular(sm),
    bottomRight: Radius.circular(sm),
  );
  static const BorderRadius bottomMd = BorderRadius.only(
    bottomLeft: Radius.circular(md),
    bottomRight: Radius.circular(md),
  );
  static const BorderRadius bottomLg = BorderRadius.only(
    bottomLeft: Radius.circular(lg),
    bottomRight: Radius.circular(lg),
  );
  static const BorderRadius bottomXl = BorderRadius.only(
    bottomLeft: Radius.circular(xl),
    bottomRight: Radius.circular(xl),
  );
  static const BorderRadius bottomXxl = BorderRadius.only(
    bottomLeft: Radius.circular(xxl),
    bottomRight: Radius.circular(xxl),
  );
  static const BorderRadius bottomXxxl = BorderRadius.only(
    bottomLeft: Radius.circular(xxxl),
    bottomRight: Radius.circular(xxxl),
  );

  /// Rounded corners (left only)
  static const BorderRadius leftNone = BorderRadius.zero;
  static const BorderRadius leftXs = BorderRadius.only(
    topLeft: Radius.circular(xs),
    bottomLeft: Radius.circular(xs),
  );
  static const BorderRadius leftSm = BorderRadius.only(
    topLeft: Radius.circular(sm),
    bottomLeft: Radius.circular(sm),
  );
  static const BorderRadius leftMd = BorderRadius.only(
    topLeft: Radius.circular(md),
    bottomLeft: Radius.circular(md),
  );
  static const BorderRadius leftLg = BorderRadius.only(
    topLeft: Radius.circular(lg),
    bottomLeft: Radius.circular(lg),
  );
  static const BorderRadius leftXl = BorderRadius.only(
    topLeft: Radius.circular(xl),
    bottomLeft: Radius.circular(xl),
  );
  static const BorderRadius leftXxl = BorderRadius.only(
    topLeft: Radius.circular(xxl),
    bottomLeft: Radius.circular(xxl),
  );
  static const BorderRadius leftXxxl = BorderRadius.only(
    topLeft: Radius.circular(xxxl),
    bottomLeft: Radius.circular(xxxl),
  );

  /// Rounded corners (right only)
  static const BorderRadius rightNone = BorderRadius.zero;
  static const BorderRadius rightXs = BorderRadius.only(
    topRight: Radius.circular(xs),
    bottomRight: Radius.circular(xs),
  );
  static const BorderRadius rightSm = BorderRadius.only(
    topRight: Radius.circular(sm),
    bottomRight: Radius.circular(sm),
  );
  static const BorderRadius rightMd = BorderRadius.only(
    topRight: Radius.circular(md),
    bottomRight: Radius.circular(md),
  );
  static const BorderRadius rightLg = BorderRadius.only(
    topRight: Radius.circular(lg),
    bottomRight: Radius.circular(lg),
  );
  static const BorderRadius rightXl = BorderRadius.only(
    topRight: Radius.circular(xl),
    bottomRight: Radius.circular(xl),
  );
  static const BorderRadius rightXxl = BorderRadius.only(
    topRight: Radius.circular(xxl),
    bottomRight: Radius.circular(xxl),
  );
  static const BorderRadius rightXxxl = BorderRadius.only(
    topRight: Radius.circular(xxxl),
    bottomRight: Radius.circular(xxxl),
  );

  /// Custom border radius
  static BorderRadius custom({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0.0),
      topRight: Radius.circular(topRight ?? 0.0),
      bottomLeft: Radius.circular(bottomLeft ?? 0.0),
      bottomRight: Radius.circular(bottomRight ?? 0.0),
    );
  }

  /// Responsive radius multipliers
  static const Map<String, double> breakpointMultipliers = {
    'mobile': 1.0,
    'tablet': 1.125,
    'desktop': 1.25,
    'largeDesktop': 1.375,
  };

  /// Get responsive radius
  static double getResponsiveRadius(double baseRadius, String breakpoint) {
    final multiplier = breakpointMultipliers[breakpoint] ?? 1.0;
    return baseRadius * multiplier;
  }

  /// Get responsive border radius
  static BorderRadius getResponsiveBorderRadius(BorderRadius baseRadius, String breakpoint) {
    final multiplier = breakpointMultipliers[breakpoint] ?? 1.0;
    return BorderRadius.only(
      topLeft: Radius.circular((baseRadius.topLeft.x) * multiplier),
      topRight: Radius.circular((baseRadius.topRight.x) * multiplier),
      bottomLeft: Radius.circular((baseRadius.bottomLeft.x) * multiplier),
      bottomRight: Radius.circular((baseRadius.bottomRight.x) * multiplier),
    );
  }
}
