import 'package:awesome_ui/foundation/typography.dart';
import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Text variants for different use cases
enum AuiTextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  caption,
  overline,
}

/// Text emphasis levels
enum AuiTextEmphasis {
  high,
  medium,
  low,
  disabled,
}

/// Text alignment options
enum AuiTextAlign {
  left,
  center,
  right,
  justify,
  start,
  end,
}

/// Text overflow options
enum AuiTextOverflow {
  clip,
  fade,
  ellipsis,
  visible,
}

/// A comprehensive text component with semantic variants and responsive sizing
class AuiText extends StatelessWidget {
  const AuiText(
    this.text, {
    super.key,
    this.variant = AuiTextVariant.bodyMedium,
    this.emphasis = AuiTextEmphasis.high,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.leadingDistribution,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    this.fontFamily,
    this.fontFamilyFallback,
    this.package,
    this.overflow,
    this.textAlign,
    this.textDirection,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.softWrap,
    this.strutStyle,
  });

  final String text;
  final AuiTextVariant variant;
  final AuiTextEmphasis emphasis;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final TextLeadingDistribution? leadingDistribution;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final String? debugLabel;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final String? package;
  final AuiTextOverflow? overflow;
  final AuiTextAlign? textAlign;
  final TextDirection? textDirection;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final bool? softWrap;
  final StrutStyle? strutStyle;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final typography = theme.typography;
    final colors = theme.colors;
    
    // Get base text style from variant
    TextStyle baseStyle = _getBaseStyle(typography);
    
    // Apply emphasis
    baseStyle = _applyEmphasis(baseStyle, emphasis, colors);
    
    // Apply custom properties
    baseStyle = _applyCustomProperties(baseStyle);
    
    // Apply responsive sizing
    baseStyle = _applyResponsiveSizing(baseStyle, context);
    
    return Text(
      text,
      style: baseStyle,
      textAlign: _getTextAlign(textAlign),
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: _getTextOverflow(overflow),
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
      strutStyle: strutStyle,
    );
  }
  
  /// Get base text style from variant
  TextStyle _getBaseStyle(AuiTypographyScheme typography) {
    switch (variant) {
      case AuiTextVariant.displayLarge:
        return typography.displayLarge;
      case AuiTextVariant.displayMedium:
        return typography.displayMedium;
      case AuiTextVariant.displaySmall:
        return typography.displaySmall;
      case AuiTextVariant.headlineLarge:
        return typography.headlineLarge;
      case AuiTextVariant.headlineMedium:
        return typography.headlineMedium;
      case AuiTextVariant.headlineSmall:
        return typography.headlineSmall;
      case AuiTextVariant.titleLarge:
        return typography.titleLarge;
      case AuiTextVariant.titleMedium:
        return typography.titleMedium;
      case AuiTextVariant.titleSmall:
        return typography.titleSmall;
      case AuiTextVariant.bodyLarge:
        return typography.bodyLarge;
      case AuiTextVariant.bodyMedium:
        return typography.bodyMedium;
      case AuiTextVariant.bodySmall:
        return typography.bodySmall;
      case AuiTextVariant.labelLarge:
        return typography.labelLarge;
      case AuiTextVariant.labelMedium:
        return typography.labelMedium;
      case AuiTextVariant.labelSmall:
        return typography.labelSmall;
      case AuiTextVariant.caption:
        return typography.caption;
      case AuiTextVariant.overline:
        return typography.overline;
    }
  }
  
  /// Apply emphasis to text style
  TextStyle _applyEmphasis(TextStyle style, AuiTextEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiTextEmphasis.high:
        return style.copyWith(color: color ?? colors.onSurface);
      case AuiTextEmphasis.medium:
        return style.copyWith(color: color ?? colors.onSurfaceVariant);
      case AuiTextEmphasis.low:
        return style.copyWith(color: color ?? colors.outline);
      case AuiTextEmphasis.disabled:
        return style.copyWith(color: color ?? colors.outline.withValues(alpha:0.38));
    }
  }
  
  /// Apply custom properties to text style
  TextStyle _applyCustomProperties(TextStyle style) {
    return style.copyWith(
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      leadingDistribution: leadingDistribution,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
    );
  }
  
  /// Apply responsive sizing
  TextStyle _applyResponsiveSizing(TextStyle style, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final responsiveFontSize = AuiResponsiveTypography.getResponsiveFontSize(
      style.fontSize ?? 14,
      screenWidth,
    );
    
    return style.copyWith(fontSize: responsiveFontSize);
  }
  
  /// Get text alignment
  TextAlign? _getTextAlign(AuiTextAlign? textAlign) {
    if (textAlign == null) return null;
    
    switch (textAlign) {
      case AuiTextAlign.left:
        return TextAlign.left;
      case AuiTextAlign.center:
        return TextAlign.center;
      case AuiTextAlign.right:
        return TextAlign.right;
      case AuiTextAlign.justify:
        return TextAlign.justify;
      case AuiTextAlign.start:
        return TextAlign.start;
      case AuiTextAlign.end:
        return TextAlign.end;
    }
  }
  
  /// Get text overflow
  TextOverflow? _getTextOverflow(AuiTextOverflow? overflow) {
    if (overflow == null) return null;
    
    switch (overflow) {
      case AuiTextOverflow.clip:
        return TextOverflow.clip;
      case AuiTextOverflow.fade:
        return TextOverflow.fade;
      case AuiTextOverflow.ellipsis:
        return TextOverflow.ellipsis;
      case AuiTextOverflow.visible:
        return TextOverflow.visible;
    }
  }
}

/// Text with icon component
class AuiTextWithIcon extends StatelessWidget {
  const AuiTextWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = AuiIconPosition.start,
    this.spacing = 8.0,
    this.variant = AuiTextVariant.bodyMedium,
    this.emphasis = AuiTextEmphasis.high,
    this.color,
    this.iconColor,
    this.iconSize,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final IconData icon;
  final AuiIconPosition iconPosition;
  final double spacing;
  final AuiTextVariant variant;
  final AuiTextEmphasis emphasis;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;
  final AuiTextAlign? textAlign;
  final AuiTextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    
    final textWidget = AuiText(
      text,
      variant: variant,
      emphasis: emphasis,
      color: color,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
    
    final iconWidget = Icon(
      icon,
      size: iconSize,
      color: iconColor ?? color ?? colors.onSurface,
    );
    
    if (iconPosition == AuiIconPosition.start) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          SizedBox(width: spacing),
          textWidget,
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          textWidget,
          SizedBox(width: spacing),
          iconWidget,
        ],
      );
    }
  }
}

/// Icon position for text with icon
enum AuiIconPosition {
  start,
  end,
}

/// Text utilities
class AuiTextUtils {
  const AuiTextUtils._();
  
  /// Get text style for variant
  static TextStyle getTextStyle(AuiTextVariant variant, AuiTypographyScheme typography) {
    switch (variant) {
      case AuiTextVariant.displayLarge:
        return typography.displayLarge;
      case AuiTextVariant.displayMedium:
        return typography.displayMedium;
      case AuiTextVariant.displaySmall:
        return typography.displaySmall;
      case AuiTextVariant.headlineLarge:
        return typography.headlineLarge;
      case AuiTextVariant.headlineMedium:
        return typography.headlineMedium;
      case AuiTextVariant.headlineSmall:
        return typography.headlineSmall;
      case AuiTextVariant.titleLarge:
        return typography.titleLarge;
      case AuiTextVariant.titleMedium:
        return typography.titleMedium;
      case AuiTextVariant.titleSmall:
        return typography.titleSmall;
      case AuiTextVariant.bodyLarge:
        return typography.bodyLarge;
      case AuiTextVariant.bodyMedium:
        return typography.bodyMedium;
      case AuiTextVariant.bodySmall:
        return typography.bodySmall;
      case AuiTextVariant.labelLarge:
        return typography.labelLarge;
      case AuiTextVariant.labelMedium:
        return typography.labelMedium;
      case AuiTextVariant.labelSmall:
        return typography.labelSmall;
      case AuiTextVariant.caption:
        return typography.caption;
      case AuiTextVariant.overline:
        return typography.overline;
    }
  }
  
  /// Get color for emphasis
  static Color getEmphasisColor(AuiTextEmphasis emphasis, AuiColorScheme colors) {
    switch (emphasis) {
      case AuiTextEmphasis.high:
        return colors.onSurface;
      case AuiTextEmphasis.medium:
        return colors.onSurfaceVariant;
      case AuiTextEmphasis.low:
        return colors.outline;
      case AuiTextEmphasis.disabled:
        return colors.outline.withValues(alpha:0.38);
    }
  }
}
