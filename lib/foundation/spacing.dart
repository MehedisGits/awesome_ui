import 'package:flutter/material.dart';

/// Spacing system for awesome_ui
/// 
/// Provides a consistent spacing scale based on 8px grid system
/// with semantic naming and responsive adjustments.
class AuiSpacing {
  const AuiSpacing._();
  
  // Base spacing unit (8px)
  static const double baseUnit = 8.0;
  
  // Spacing scale
  static const double xs = 4.0;   // 0.5x base unit
  static const double sm = 8.0;   // 1x base unit
  static const double md = 16.0;  // 2x base unit
  static const double lg = 24.0;  // 3x base unit
  static const double xl = 32.0;  // 4x base unit
  static const double xxl = 40.0; // 5x base unit
  static const double xxxl = 48.0; // 6x base unit
  
  // Micro spacing (for fine adjustments)
  static const double micro = 2.0;  // 0.25x base unit
  static const double nano = 1.0;   // 0.125x base unit
  
  // Macro spacing (for large sections)
  static const double macro = 64.0;  // 8x base unit
  static const double mega = 80.0;   // 10x base unit
  static const double giga = 96.0;   // 12x base unit
  
  // Zero spacing
  static const double zero = 0.0;
  
  // Auto spacing (for flex layouts)
  static const double auto = double.infinity;
}

/// Responsive spacing that adjusts based on screen size
class AuiResponsiveSpacing {
  const AuiResponsiveSpacing._();
  
  /// Get responsive spacing based on screen width
  static double getResponsiveSpacing(double baseSpacing, double screenWidth) {
    if (screenWidth < 600) {
      return baseSpacing * 0.75; // 25% smaller on mobile
    } else if (screenWidth < 840) {
      return baseSpacing * 0.875; // 12.5% smaller on small tablet
    } else if (screenWidth < 1200) {
      return baseSpacing; // Base spacing on tablet
    } else if (screenWidth < 1600) {
      return baseSpacing * 1.125; // 12.5% larger on desktop
    } else {
      return baseSpacing * 1.25; // 25% larger on large desktop
    }
  }
  
  /// Get responsive spacing for different breakpoints
  static double getBreakpointSpacing(double baseSpacing, double screenWidth) {
    return getResponsiveSpacing(baseSpacing, screenWidth);
  }
}

/// Spacing utilities for common layout patterns
class AuiSpacingUtils {
  const AuiSpacingUtils._();
  
  /// Get spacing for different content types
  static double getContentSpacing(ContentType type) {
    switch (type) {
      case ContentType.tight:
        return AuiSpacing.sm;
      case ContentType.comfortable:
        return AuiSpacing.md;
      case ContentType.spacious:
        return AuiSpacing.lg;
      case ContentType.extraSpacious:
        return AuiSpacing.xl;
    }
  }
  
  /// Get spacing for different component sizes
  static double getComponentSpacing(ComponentSize size) {
    switch (size) {
      case ComponentSize.xs:
        return AuiSpacing.xs;
      case ComponentSize.sm:
        return AuiSpacing.sm;
      case ComponentSize.md:
        return AuiSpacing.md;
      case ComponentSize.lg:
        return AuiSpacing.lg;
      case ComponentSize.xl:
        return AuiSpacing.xl;
    }
  }
  
  /// Get spacing for different layout sections
  static double getSectionSpacing(SectionType type) {
    switch (type) {
      case SectionType.header:
        return AuiSpacing.lg;
      case SectionType.content:
        return AuiSpacing.md;
      case SectionType.footer:
        return AuiSpacing.lg;
      case SectionType.sidebar:
        return AuiSpacing.md;
    }
  }
}

/// Content spacing types
enum ContentType {
  tight,
  comfortable,
  spacious,
  extraSpacious,
}

/// Component size types
enum ComponentSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Section spacing types
enum SectionType {
  header,
  content,
  footer,
  sidebar,
}

/// Spacing constants for common use cases
class AuiSpacingConstants {
  const AuiSpacingConstants._();
  
  // Padding constants
  static const EdgeInsets paddingXs = EdgeInsets.all(AuiSpacing.xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(AuiSpacing.sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(AuiSpacing.md);
  static const EdgeInsets paddingLg = EdgeInsets.all(AuiSpacing.lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(AuiSpacing.xl);
  
  // Horizontal padding
  static const EdgeInsets paddingHorizontalXs = EdgeInsets.symmetric(horizontal: AuiSpacing.xs);
  static const EdgeInsets paddingHorizontalSm = EdgeInsets.symmetric(horizontal: AuiSpacing.sm);
  static const EdgeInsets paddingHorizontalMd = EdgeInsets.symmetric(horizontal: AuiSpacing.md);
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(horizontal: AuiSpacing.lg);
  static const EdgeInsets paddingHorizontalXl = EdgeInsets.symmetric(horizontal: AuiSpacing.xl);
  
  // Vertical padding
  static const EdgeInsets paddingVerticalXs = EdgeInsets.symmetric(vertical: AuiSpacing.xs);
  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(vertical: AuiSpacing.sm);
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(vertical: AuiSpacing.md);
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(vertical: AuiSpacing.lg);
  static const EdgeInsets paddingVerticalXl = EdgeInsets.symmetric(vertical: AuiSpacing.xl);
  
  // Top padding
  static const EdgeInsets paddingTopXs = EdgeInsets.only(top: AuiSpacing.xs);
  static const EdgeInsets paddingTopSm = EdgeInsets.only(top: AuiSpacing.sm);
  static const EdgeInsets paddingTopMd = EdgeInsets.only(top: AuiSpacing.md);
  static const EdgeInsets paddingTopLg = EdgeInsets.only(top: AuiSpacing.lg);
  static const EdgeInsets paddingTopXl = EdgeInsets.only(top: AuiSpacing.xl);
  
  // Bottom padding
  static const EdgeInsets paddingBottomXs = EdgeInsets.only(bottom: AuiSpacing.xs);
  static const EdgeInsets paddingBottomSm = EdgeInsets.only(bottom: AuiSpacing.sm);
  static const EdgeInsets paddingBottomMd = EdgeInsets.only(bottom: AuiSpacing.md);
  static const EdgeInsets paddingBottomLg = EdgeInsets.only(bottom: AuiSpacing.lg);
  static const EdgeInsets paddingBottomXl = EdgeInsets.only(bottom: AuiSpacing.xl);
  
  // Left padding
  static const EdgeInsets paddingLeftXs = EdgeInsets.only(left: AuiSpacing.xs);
  static const EdgeInsets paddingLeftSm = EdgeInsets.only(left: AuiSpacing.sm);
  static const EdgeInsets paddingLeftMd = EdgeInsets.only(left: AuiSpacing.md);
  static const EdgeInsets paddingLeftLg = EdgeInsets.only(left: AuiSpacing.lg);
  static const EdgeInsets paddingLeftXl = EdgeInsets.only(left: AuiSpacing.xl);
  
  // Right padding
  static const EdgeInsets paddingRightXs = EdgeInsets.only(right: AuiSpacing.xs);
  static const EdgeInsets paddingRightSm = EdgeInsets.only(right: AuiSpacing.sm);
  static const EdgeInsets paddingRightMd = EdgeInsets.only(right: AuiSpacing.md);
  static const EdgeInsets paddingRightLg = EdgeInsets.only(right: AuiSpacing.lg);
  static const EdgeInsets paddingRightXl = EdgeInsets.only(right: AuiSpacing.xl);
  
  // Margin constants
  static const EdgeInsets marginXs = EdgeInsets.all(AuiSpacing.xs);
  static const EdgeInsets marginSm = EdgeInsets.all(AuiSpacing.sm);
  static const EdgeInsets marginMd = EdgeInsets.all(AuiSpacing.md);
  static const EdgeInsets marginLg = EdgeInsets.all(AuiSpacing.lg);
  static const EdgeInsets marginXl = EdgeInsets.all(AuiSpacing.xl);
  
  // Horizontal margin
  static const EdgeInsets marginHorizontalXs = EdgeInsets.symmetric(horizontal: AuiSpacing.xs);
  static const EdgeInsets marginHorizontalSm = EdgeInsets.symmetric(horizontal: AuiSpacing.sm);
  static const EdgeInsets marginHorizontalMd = EdgeInsets.symmetric(horizontal: AuiSpacing.md);
  static const EdgeInsets marginHorizontalLg = EdgeInsets.symmetric(horizontal: AuiSpacing.lg);
  static const EdgeInsets marginHorizontalXl = EdgeInsets.symmetric(horizontal: AuiSpacing.xl);
  
  // Vertical margin
  static const EdgeInsets marginVerticalXs = EdgeInsets.symmetric(vertical: AuiSpacing.xs);
  static const EdgeInsets marginVerticalSm = EdgeInsets.symmetric(vertical: AuiSpacing.sm);
  static const EdgeInsets marginVerticalMd = EdgeInsets.symmetric(vertical: AuiSpacing.md);
  static const EdgeInsets marginVerticalLg = EdgeInsets.symmetric(vertical: AuiSpacing.lg);
  static const EdgeInsets marginVerticalXl = EdgeInsets.symmetric(vertical: AuiSpacing.xl);
}

/// Spacing extensions for easy access
extension AuiSpacingExtension on double {
  /// Get responsive spacing for this value
  double responsive(double screenWidth) {
    return AuiResponsiveSpacing.getResponsiveSpacing(this, screenWidth);
  }
}

/// Spacing extensions for EdgeInsets
extension AuiEdgeInsetsExtension on EdgeInsets {
  /// Get responsive EdgeInsets for this value
  EdgeInsets responsive(double screenWidth) {
    return EdgeInsets.only(
      left: left == 0 ? 0 : AuiResponsiveSpacing.getResponsiveSpacing(left, screenWidth),
      top: top == 0 ? 0 : AuiResponsiveSpacing.getResponsiveSpacing(top, screenWidth),
      right: right == 0 ? 0 : AuiResponsiveSpacing.getResponsiveSpacing(right, screenWidth),
      bottom: bottom == 0 ? 0 : AuiResponsiveSpacing.getResponsiveSpacing(bottom, screenWidth),
    );
  }
}
