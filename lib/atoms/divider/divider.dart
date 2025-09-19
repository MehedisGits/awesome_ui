import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Divider variants for different use cases
enum AuiDividerVariant {
  horizontal,
  vertical,
  solid,
  dashed,
  dotted,
}

/// Divider sizes
enum AuiDividerSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Divider emphasis levels
enum AuiDividerEmphasis {
  high,
  medium,
  low,
  subtle,
}

/// A comprehensive divider component
class AuiDivider extends StatelessWidget {
  const AuiDivider({
    super.key,
    this.variant = AuiDividerVariant.horizontal,
    this.size = AuiDividerSize.md,
    this.emphasis = AuiDividerEmphasis.medium,
    this.color,
    this.thickness,
    this.indent,
    this.endIndent,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.borderRadius,
    this.semanticLabel,
  });

  final AuiDividerVariant variant;
  final AuiDividerSize size;
  final AuiDividerEmphasis emphasis;
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;
    
    // Get divider color
    final dividerColor = _getDividerColor(colors);
    
    // Get divider thickness
    final dividerThickness = _getDividerThickness();
    
    // Get divider dimensions
    final dividerHeight = _getDividerHeight();
    final dividerWidth = _getDividerWidth();
    
    // Get border radius
    final dividerBorderRadius = _getBorderRadius(spacing);
    
    Widget dividerWidget;
    
    switch (variant) {
      case AuiDividerVariant.horizontal:
        dividerWidget = _buildHorizontalDivider(
          dividerColor,
          dividerThickness,
          dividerHeight,
          dividerWidth,
          dividerBorderRadius,
        );
        break;
      case AuiDividerVariant.vertical:
        dividerWidget = _buildVerticalDivider(
          dividerColor,
          dividerThickness,
          dividerHeight,
          dividerWidth,
          dividerBorderRadius,
        );
        break;
      case AuiDividerVariant.solid:
        dividerWidget = _buildSolidDivider(
          dividerColor,
          dividerThickness,
          dividerHeight,
          dividerWidth,
          dividerBorderRadius,
        );
        break;
      case AuiDividerVariant.dashed:
        dividerWidget = _buildDashedDivider(
          dividerColor,
          dividerThickness,
          dividerHeight,
          dividerWidth,
          dividerBorderRadius,
        );
        break;
      case AuiDividerVariant.dotted:
        dividerWidget = _buildDottedDivider(
          dividerColor,
          dividerThickness,
          dividerHeight,
          dividerWidth,
          dividerBorderRadius,
        );
        break;
    }
    
    // Add margin and padding
    if (margin != null || padding != null) {
      dividerWidget = Container(
        margin: margin,
        padding: padding,
        child: dividerWidget,
      );
    }
    
    // Add semantics
    if (semanticLabel != null) {
      dividerWidget = Semantics(
        label: semanticLabel,
        child: dividerWidget,
      );
    }
    
    return dividerWidget;
  }
  
  /// Build horizontal divider
  Widget _buildHorizontalDivider(
    Color dividerColor,
    double dividerThickness,
    double dividerHeight,
    double dividerWidth,
    BorderRadius dividerBorderRadius,
  ) {
    return Container(
      height: dividerThickness,
      width: dividerWidth,
      margin: EdgeInsets.only(
        left: indent ?? 0.0,
        right: endIndent ?? 0.0,
      ),
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: dividerBorderRadius,
      ),
    );
  }
  
  /// Build vertical divider
  Widget _buildVerticalDivider(
    Color dividerColor,
    double dividerThickness,
    double dividerHeight,
    double dividerWidth,
    BorderRadius dividerBorderRadius,
  ) {
    return Container(
      width: dividerThickness,
      height: dividerHeight,
      margin: EdgeInsets.only(
        top: indent ?? 0.0,
        bottom: endIndent ?? 0.0,
      ),
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: dividerBorderRadius,
      ),
    );
  }
  
  /// Build solid divider
  Widget _buildSolidDivider(
    Color dividerColor,
    double dividerThickness,
    double dividerHeight,
    double dividerWidth,
    BorderRadius dividerBorderRadius,
  ) {
    return Container(
      height: dividerThickness,
      width: dividerWidth,
      margin: EdgeInsets.only(
        left: indent ?? 0.0,
        right: endIndent ?? 0.0,
      ),
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: dividerBorderRadius,
      ),
    );
  }
  
  /// Build dashed divider
  Widget _buildDashedDivider(
    Color dividerColor,
    double dividerThickness,
    double dividerHeight,
    double dividerWidth,
    BorderRadius dividerBorderRadius,
  ) {
    return CustomPaint(
      painter: DashedLinePainter(
        color: dividerColor,
        strokeWidth: dividerThickness,
        dashWidth: 8.0,
        dashSpace: 4.0,
      ),
      size: Size(dividerWidth, dividerThickness),
    );
  }
  
  /// Build dotted divider
  Widget _buildDottedDivider(
    Color dividerColor,
    double dividerThickness,
    double dividerHeight,
    double dividerWidth,
    BorderRadius dividerBorderRadius,
  ) {
    return CustomPaint(
      painter: DottedLinePainter(
        color: dividerColor,
        strokeWidth: dividerThickness,
        dotRadius: dividerThickness / 2,
        dotSpace: dividerThickness * 2,
      ),
      size: Size(dividerWidth, dividerThickness),
    );
  }
  
  /// Get divider color based on emphasis
  Color _getDividerColor(AuiColorScheme colors) {
    if (color != null) return color!;
    
    switch (emphasis) {
      case AuiDividerEmphasis.high:
        return colors.outline;
      case AuiDividerEmphasis.medium:
        return colors.outlineVariant;
      case AuiDividerEmphasis.low:
        return colors.outline.withValues(alpha:0.5);
      case AuiDividerEmphasis.subtle:
        return colors.outline.withValues(alpha:0.2);
    }
  }
  
  /// Get divider thickness based on size
  double _getDividerThickness() {
    if (thickness != null) return thickness!;
    
    switch (size) {
      case AuiDividerSize.xs:
        return 0.5;
      case AuiDividerSize.sm:
        return 1.0;
      case AuiDividerSize.md:
        return 1.5;
      case AuiDividerSize.lg:
        return 2.0;
      case AuiDividerSize.xl:
        return 3.0;
    }
  }
  
  /// Get divider height
  double _getDividerHeight() {
    if (height != null) return height!;
    
    switch (variant) {
      case AuiDividerVariant.horizontal:
      case AuiDividerVariant.solid:
      case AuiDividerVariant.dashed:
      case AuiDividerVariant.dotted:
        return _getDividerThickness();
      case AuiDividerVariant.vertical:
        return 100.0; // Default height for vertical divider
    }
  }
  
  /// Get divider width
  double _getDividerWidth() {
    if (width != null) return width!;
    
    switch (variant) {
      case AuiDividerVariant.horizontal:
      case AuiDividerVariant.solid:
      case AuiDividerVariant.dashed:
      case AuiDividerVariant.dotted:
        return double.infinity; // Full width for horizontal dividers
      case AuiDividerVariant.vertical:
        return _getDividerThickness();
    }
  }
  
  /// Get border radius based on size
  BorderRadius _getBorderRadius(AuiSpacingScheme spacing) {
    if (borderRadius != null) return borderRadius!;
    
    switch (size) {
      case AuiDividerSize.xs:
        return BorderRadius.circular(0.25);
      case AuiDividerSize.sm:
        return BorderRadius.circular(0.5);
      case AuiDividerSize.md:
        return BorderRadius.circular(1.0);
      case AuiDividerSize.lg:
        return BorderRadius.circular(1.5);
      case AuiDividerSize.xl:
        return BorderRadius.circular(2.0);
    }
  }
}

/// Divider with text component
class AuiDividerWithText extends StatelessWidget {
  const AuiDividerWithText({
    super.key,
    required this.text,
    this.variant = AuiDividerVariant.horizontal,
    this.size = AuiDividerSize.md,
    this.emphasis = AuiDividerEmphasis.medium,
    this.color,
    this.thickness,
    this.textColor,
    this.textStyle,
    this.padding = 16.0,
    this.margin,
    this.semanticLabel,
  });

  final String text;
  final AuiDividerVariant variant;
  final AuiDividerSize size;
  final AuiDividerEmphasis emphasis;
  final Color? color;
  final double? thickness;
  final Color? textColor;
  final TextStyle? textStyle;
  final double padding;
  final EdgeInsets? margin;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final typography = theme.typography;
    
    final dividerColor = color ?? _getDividerColor(colors);
    final textColor = this.textColor ?? colors.onSurfaceVariant;
    final textStyle = this.textStyle ?? typography.bodySmall;
    
    return Container(
      margin: margin,
      child: Row(
        children: [
          Expanded(
            child: AuiDivider(
              variant: variant,
              size: size,
              emphasis: emphasis,
              color: dividerColor,
              thickness: thickness,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              text,
              style: textStyle.copyWith(color: textColor),
            ),
          ),
          Expanded(
            child: AuiDivider(
              variant: variant,
              size: size,
              emphasis: emphasis,
              color: dividerColor,
              thickness: thickness,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Get divider color based on emphasis
  Color _getDividerColor(AuiColorScheme colors) {
    switch (emphasis) {
      case AuiDividerEmphasis.high:
        return colors.outline;
      case AuiDividerEmphasis.medium:
        return colors.outlineVariant;
      case AuiDividerEmphasis.low:
        return colors.outline.withValues(alpha:0.5);
      case AuiDividerEmphasis.subtle:
        return colors.outline.withValues(alpha:0.2);
    }
  }
}

/// Dashed line painter
class DashedLinePainter extends CustomPainter {
  const DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Dotted line painter
class DottedLinePainter extends CustomPainter {
  const DottedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dotRadius,
    required this.dotSpace,
  });

  final Color color;
  final double strokeWidth;
  final double dotRadius;
  final double dotSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double startX = dotRadius;
    while (startX < size.width) {
      canvas.drawCircle(
        Offset(startX, size.height / 2),
        dotRadius,
        paint,
      );
      startX += dotRadius * 2 + dotSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Divider utilities
class AuiDividerUtils {
  const AuiDividerUtils._();
  
  /// Get divider thickness from size
  static double getDividerThickness(AuiDividerSize size) {
    switch (size) {
      case AuiDividerSize.xs:
        return 0.5;
      case AuiDividerSize.sm:
        return 1.0;
      case AuiDividerSize.md:
        return 1.5;
      case AuiDividerSize.lg:
        return 2.0;
      case AuiDividerSize.xl:
        return 3.0;
    }
  }
  
  /// Get divider color for emphasis
  static Color getDividerColor(AuiDividerEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiDividerEmphasis.high:
        return colors.outline;
      case AuiDividerEmphasis.medium:
        return colors.outlineVariant;
      case AuiDividerEmphasis.low:
        return colors.outline.withValues(alpha:0.5);
      case AuiDividerEmphasis.subtle:
        return colors.outline.withValues(alpha:0.2);
    }
  }
  
  /// Get border radius for size
  static double getBorderRadius(AuiDividerSize size) {
    switch (size) {
      case AuiDividerSize.xs:
        return 0.25;
      case AuiDividerSize.sm:
        return 0.5;
      case AuiDividerSize.md:
        return 1.0;
      case AuiDividerSize.lg:
        return 1.5;
      case AuiDividerSize.xl:
        return 2.0;
    }
  }
}
