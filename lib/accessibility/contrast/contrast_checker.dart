import 'package:flutter/material.dart';

/// Contrast ratio standards
enum AuiContrastStandard {
  aa, // WCAG 2.1 AA (4.5:1 for normal text, 3:1 for large text)
  aaa, // WCAG 2.1 AAA (7:1 for normal text, 4.5:1 for large text)
  enhanced, // Enhanced (10:1 for normal text, 7:1 for large text)
}

/// Text size categories for contrast checking
enum AuiTextSize {
  normal, // < 18pt or < 14pt bold
  large, // >= 18pt or >= 14pt bold
}

/// Contrast checker utility
class AuiContrastChecker {
  const AuiContrastChecker._();

  /// Calculate contrast ratio between two colors
  static double calculateContrastRatio(Color foreground, Color background) {
    final foregroundLuminance = _calculateRelativeLuminance(foreground);
    final backgroundLuminance = _calculateRelativeLuminance(background);
    
    final lighter = foregroundLuminance > backgroundLuminance 
        ? foregroundLuminance 
        : backgroundLuminance;
    final darker = foregroundLuminance > backgroundLuminance 
        ? backgroundLuminance 
        : foregroundLuminance;
    
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Calculate relative luminance of a color
  static double _calculateRelativeLuminance(Color color) {
    final r = _linearizeColorComponent(color.red / 255.0);
    final g = _linearizeColorComponent(color.green / 255.0);
    final b = _linearizeColorComponent(color.blue / 255.0);
    
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  /// Linearize color component for luminance calculation
  static double _linearizeColorComponent(double component) {
    return component <= 0.03928 
        ? component / 12.92 
        : pow((component + 0.055) / 1.055, 2.4);
  }

  /// Check if contrast ratio meets WCAG standards
  static bool meetsContrastStandard(
    Color foreground,
    Color background, {
    AuiContrastStandard standard = AuiContrastStandard.aa,
    AuiTextSize textSize = AuiTextSize.normal,
  }) {
    final ratio = calculateContrastRatio(foreground, background);
    return _meetsStandard(ratio, standard, textSize);
  }

  /// Check if ratio meets standard
  static bool _meetsStandard(
    double ratio,
    AuiContrastStandard standard,
    AuiTextSize textSize,
  ) {
    switch (standard) {
      case AuiContrastStandard.aa:
        return textSize == AuiTextSize.large ? ratio >= 3.0 : ratio >= 4.5;
      case AuiContrastStandard.aaa:
        return textSize == AuiTextSize.large ? ratio >= 4.5 : ratio >= 7.0;
      case AuiContrastStandard.enhanced:
        return textSize == AuiTextSize.large ? ratio >= 7.0 : ratio >= 10.0;
    }
  }

  /// Get minimum required contrast ratio for standard
  static double getMinimumRatio(
    AuiContrastStandard standard,
    AuiTextSize textSize,
  ) {
    switch (standard) {
      case AuiContrastStandard.aa:
        return textSize == AuiTextSize.large ? 3.0 : 4.5;
      case AuiContrastStandard.aaa:
        return textSize == AuiTextSize.large ? 4.5 : 7.0;
      case AuiContrastStandard.enhanced:
        return textSize == AuiTextSize.large ? 7.0 : 10.0;
    }
  }

  /// Find accessible color variant
  static Color findAccessibleColor(
    Color originalColor,
    Color backgroundColor, {
    AuiContrastStandard standard = AuiContrastStandard.aa,
    AuiTextSize textSize = AuiTextSize.normal,
    double step = 0.1,
  }) {
    if (meetsContrastStandard(originalColor, backgroundColor, 
        standard: standard, textSize: textSize)) {
      return originalColor;
    }

    final hsl = HSLColor.fromColor(originalColor);
    final targetRatio = getMinimumRatio(standard, textSize);

    // Try making darker
    for (double lightness = hsl.lightness; lightness >= 0; lightness -= step) {
      final testColor = hsl.withLightness(lightness).toColor();
      if (calculateContrastRatio(testColor, backgroundColor) >= targetRatio) {
        return testColor;
      }
    }

    // Try making lighter
    for (double lightness = hsl.lightness; lightness <= 1; lightness += step) {
      final testColor = hsl.withLightness(lightness).toColor();
      if (calculateContrastRatio(testColor, backgroundColor) >= targetRatio) {
        return testColor;
      }
    }

    // Fallback to black or white
    final blackRatio = calculateContrastRatio(Colors.black, backgroundColor);
    final whiteRatio = calculateContrastRatio(Colors.white, backgroundColor);
    
    return blackRatio > whiteRatio ? Colors.black : Colors.white;
  }

  /// Get contrast level description
  static String getContrastLevel(double ratio) {
    if (ratio >= 7.0) return 'AAA';
    if (ratio >= 4.5) return 'AA';
    if (ratio >= 3.0) return 'AA Large';
    return 'Fail';
  }

  /// Get contrast grade
  static AuiContrastGrade getContrastGrade(double ratio) {
    if (ratio >= 10.0) return AuiContrastGrade.excellent;
    if (ratio >= 7.0) return AuiContrastGrade.good;
    if (ratio >= 4.5) return AuiContrastGrade.acceptable;
    if (ratio >= 3.0) return AuiContrastGrade.poor;
    return AuiContrastGrade.fail;
  }
}

/// Contrast grade enum
enum AuiContrastGrade {
  excellent,
  good,
  acceptable,
  poor,
  fail,
}

/// Contrast aware color wrapper
class AuiContrastAwareColor extends StatelessWidget {
  const AuiContrastAwareColor({
    super.key,
    required this.child,
    required this.foregroundColor,
    required this.backgroundColor,
    this.standard = AuiContrastStandard.aa,
    this.textSize = AuiTextSize.normal,
    this.autoAdjust = true,
    this.onContrastCheck,
  });

  final Widget child;
  final Color foregroundColor;
  final Color backgroundColor;
  final AuiContrastStandard standard;
  final AuiTextSize textSize;
  final bool autoAdjust;
  final ValueChanged<double>? onContrastCheck;

  @override
  Widget build(BuildContext context) {
    final ratio = AuiContrastChecker.calculateContrastRatio(
      foregroundColor,
      backgroundColor,
    );
    
    onContrastCheck?.call(ratio);
    
    final meetsStandard = AuiContrastChecker.meetsContrastStandard(
      foregroundColor,
      backgroundColor,
      standard: standard,
      textSize: textSize,
    );

    Color effectiveColor = foregroundColor;
    
    if (!meetsStandard && autoAdjust) {
      effectiveColor = AuiContrastChecker.findAccessibleColor(
        foregroundColor,
        backgroundColor,
        standard: standard,
        textSize: textSize,
      );
    }

    return DefaultTextStyle(
      style: DefaultTextStyle.of(context).style.copyWith(
        color: effectiveColor,
      ),
      child: child,
    );
  }
}

/// Contrast checker widget for debugging
class AuiContrastDebugger extends StatelessWidget {
  const AuiContrastDebugger({
    super.key,
    required this.foregroundColor,
    required this.backgroundColor,
    this.standard = AuiContrastStandard.aa,
    this.textSize = AuiTextSize.normal,
    this.showDetails = true,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final AuiContrastStandard standard;
  final AuiTextSize textSize;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    final ratio = AuiContrastChecker.calculateContrastRatio(
      foregroundColor,
      backgroundColor,
    );
    
    final meetsStandard = AuiContrastChecker.meetsContrastStandard(
      foregroundColor,
      backgroundColor,
      standard: standard,
      textSize: textSize,
    );

    final level = AuiContrastChecker.getContrastLevel(ratio);
    final grade = AuiContrastChecker.getContrastGrade(ratio);

    if (!showDetails) {
      return Icon(
        meetsStandard ? Icons.check_circle : Icons.warning,
        color: meetsStandard ? Colors.green : Colors.red,
        size: 16,
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Contrast Ratio: ${ratio.toStringAsFixed(2)}:1'),
          Text('Level: $level'),
          Text('Grade: ${grade.name}'),
          Text('Meets ${standard.name.toUpperCase()}: ${meetsStandard ? 'Yes' : 'No'}'),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: foregroundColor,
              ),
              const SizedBox(width: 4),
              const Text('on'),
              const SizedBox(width: 4),
              Container(
                width: 20,
                height: 20,
                color: backgroundColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Extension for pow function
double pow(double base, double exponent) {
  if (exponent == 0) return 1;
  if (exponent == 1) return base;
  if (exponent == 2) return base * base;
  if (exponent == 2.4) {
    // Approximation for gamma correction
    final sqrt = base * base;
    return sqrt * sqrt * base.sqrt();
  }
  // Simple approximation for other cases
  double result = 1;
  for (int i = 0; i < exponent.round(); i++) {
    result *= base;
  }
  return result;
}

/// Extension for sqrt function
extension DoubleExtension on double {
  double sqrt() {
    if (this < 0) return double.nan;
    if (this == 0) return 0;
    
    double x = this;
    double prev;
    
    // Newton's method for square root
    do {
      prev = x;
      x = (x + this / x) / 2;
    } while ((x - prev).abs() > 0.000001);
    
    return x;
  }
}
