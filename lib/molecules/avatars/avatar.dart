import 'package:flutter/material.dart';
import '../../foundation/theme.dart';

/// Avatar variants
enum AuiAvatarVariant {
  filled,
  outlined,
  tonal,
  gradient,
}

/// Avatar sizes
enum AuiAvatarSize {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

/// Avatar states
enum AuiAvatarState {
  enabled,
  disabled,
  loading,
  error,
}

/// A comprehensive avatar component
class AuiAvatar extends StatelessWidget {
  const AuiAvatar({
    super.key,
    this.child,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.backgroundColor,
    this.foregroundColor,
    this.radius,
    this.minRadius,
    this.maxRadius,
    this.variant = AuiAvatarVariant.filled,
    this.size = AuiAvatarSize.md,
    this.state = AuiAvatarState.enabled,
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.clipBehavior = Clip.antiAlias,
    this.borderRadius,
    this.gradient,
    this.badge,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
  });

  final Widget? child;
  final ImageProvider? backgroundImage;
  final ImageProvider? foregroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? radius;
  final double? minRadius;
  final double? maxRadius;
  final AuiAvatarVariant variant;
  final AuiAvatarSize size;
  final AuiAvatarState state;
  final Color? borderColor;
  final double? borderWidth;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final Clip clipBehavior;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final Widget? badge;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final colors = theme.colors;
    final elevation = theme.elevation;
    
    // Get avatar radius
    final avatarRadius = _getAvatarRadius();
    
    // Get avatar colors
    final avatarBackgroundColor = _getAvatarBackgroundColor(colors);
    final avatarForegroundColor = _getAvatarForegroundColor(colors);
    final avatarBorderColor = _getAvatarBorderColor(colors);
    final avatarBorderWidth = _getAvatarBorderWidth();
    
    // Get avatar elevation
    final avatarElevation = _getAvatarElevation(elevation);
    
    Widget avatar = CircleAvatar(
      radius: avatarRadius,
      backgroundColor: avatarBackgroundColor,
      foregroundColor: avatarForegroundColor,
      backgroundImage: backgroundImage,
      foregroundImage: foregroundImage,
      onBackgroundImageError: onBackgroundImageError,
      onForegroundImageError: onForegroundImageError,
      child: child,
    );
    
    // Add border if needed
    if (avatarBorderColor != null && avatarBorderWidth > 0) {
      avatar = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: avatarBorderColor,
            width: avatarBorderWidth,
          ),
        ),
        child: avatar,
      );
    }
    
    // Add elevation if needed
    if (avatarElevation > 0) {
      avatar = Material(
        elevation: avatarElevation,
        shadowColor: shadowColor ?? colors.shadow,
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: avatar,
      );
    }
    
    // Add gradient if needed
    if (gradient != null && variant == AuiAvatarVariant.gradient) {
      avatar = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
        ),
        child: avatar,
      );
    }
    
    // Add badge if provided
    if (badge != null) {
      avatar = Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: badgeOffset?.dx ?? _getBadgeOffset(),
            top: badgeOffset?.dy ?? _getBadgeOffset(),
            child: badge!,
          ),
        ],
      );
    }
    
    // Add tap functionality
    if (onTap != null || onLongPress != null || onDoubleTap != null) {
      avatar = GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: avatar,
      );
    }
    
    // Add semantics
    if (semanticLabel != null) {
      avatar = Semantics(
        label: semanticLabel,
        child: avatar,
      );
    }
    
    // Add tooltip
    if (tooltip != null) {
      avatar = Tooltip(
        message: tooltip!,
        child: avatar,
      );
    }
    
    return avatar;
  }
  
  /// Get avatar size
  double _getAvatarSize() {
    switch (size) {
      case AuiAvatarSize.xs:
        return 24.0;
      case AuiAvatarSize.sm:
        return 32.0;
      case AuiAvatarSize.md:
        return 40.0;
      case AuiAvatarSize.lg:
        return 48.0;
      case AuiAvatarSize.xl:
        return 56.0;
      case AuiAvatarSize.xxl:
        return 64.0;
    }
  }
  
  /// Get avatar radius
  double _getAvatarRadius() {
    if (radius != null) return radius!;
    return _getAvatarSize() / 2;
  }
  
  /// Get avatar background color
  Color _getAvatarBackgroundColor(AuiColorScheme colors) {
    if (state == AuiAvatarState.disabled) {
      return colors.surfaceVariant;
    }
    
    switch (variant) {
      case AuiAvatarVariant.filled:
        return backgroundColor ?? colors.primary;
      case AuiAvatarVariant.outlined:
        return backgroundColor ?? colors.surface;
      case AuiAvatarVariant.tonal:
        return backgroundColor ?? colors.primaryContainer;
      case AuiAvatarVariant.gradient:
        return backgroundColor ?? colors.primary;
    }
  }
  
  /// Get avatar foreground color
  Color _getAvatarForegroundColor(AuiColorScheme colors) {
    if (state == AuiAvatarState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (variant) {
      case AuiAvatarVariant.filled:
        return foregroundColor ?? colors.onPrimary;
      case AuiAvatarVariant.outlined:
        return foregroundColor ?? colors.primary;
      case AuiAvatarVariant.tonal:
        return foregroundColor ?? colors.onPrimaryContainer;
      case AuiAvatarVariant.gradient:
        return foregroundColor ?? colors.onPrimary;
    }
  }
  
  /// Get avatar border color
  Color? _getAvatarBorderColor(AuiColorScheme colors) {
    if (state == AuiAvatarState.disabled) {
      return colors.outline.withValues(alpha:0.38);
    }
    
    switch (variant) {
      case AuiAvatarVariant.filled:
        return null;
      case AuiAvatarVariant.outlined:
        return borderColor ?? colors.outline;
      case AuiAvatarVariant.tonal:
        return null;
      case AuiAvatarVariant.gradient:
        return null;
    }
  }
  
  /// Get avatar border width
  double _getAvatarBorderWidth() {
    if (borderWidth != null) return borderWidth!;
    
    switch (variant) {
      case AuiAvatarVariant.filled:
        return 0.0;
      case AuiAvatarVariant.outlined:
        return 1.0;
      case AuiAvatarVariant.tonal:
        return 0.0;
      case AuiAvatarVariant.gradient:
        return 0.0;
    }
  }
  
  /// Get avatar elevation
  double _getAvatarElevation(AuiElevationScheme elevation) {
    if (this.elevation != null) return this.elevation!;
    
    switch (variant) {
      case AuiAvatarVariant.filled:
        return elevation.level0;
      case AuiAvatarVariant.outlined:
        return elevation.level0;
      case AuiAvatarVariant.tonal:
        return elevation.level0;
      case AuiAvatarVariant.gradient:
        return elevation.level1;
    }
  }
  
  /// Get badge offset
  double _getBadgeOffset() {
    switch (size) {
      case AuiAvatarSize.xs:
        return -2.0;
      case AuiAvatarSize.sm:
        return -4.0;
      case AuiAvatarSize.md:
        return -6.0;
      case AuiAvatarSize.lg:
        return -8.0;
      case AuiAvatarSize.xl:
        return -10.0;
      case AuiAvatarSize.xxl:
        return -12.0;
    }
  }
}

/// Avatar with text component
class AuiAvatarText extends StatelessWidget {
  const AuiAvatarText({
    super.key,
    required this.text,
    this.variant = AuiAvatarVariant.filled,
    this.size = AuiAvatarSize.md,
    this.state = AuiAvatarState.enabled,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.clipBehavior = Clip.antiAlias,
    this.gradient,
    this.badge,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
    this.textStyle,
  });

  final String text;
  final AuiAvatarVariant variant;
  final AuiAvatarSize size;
  final AuiAvatarState state;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final Clip clipBehavior;
  final Gradient? gradient;
  final Widget? badge;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = context.auiTheme;
    final typography = theme.typography;
    
    return AuiAvatar(
      variant: variant,
      size: size,
      state: state,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      semanticLabel: semanticLabel,
      tooltip: tooltip,
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      mouseCursor: mouseCursor,
      clipBehavior: clipBehavior,
      gradient: gradient,
      badge: badge,
      badgeAlignment: badgeAlignment,
      badgeOffset: badgeOffset,
      child: Text(
        text,
        style: textStyle ?? _getTextStyle(typography),
        textAlign: TextAlign.center,
      ),
    );
  }
  
  /// Get text style
  TextStyle _getTextStyle(AuiTypographyScheme typography) {
    switch (size) {
      case AuiAvatarSize.xs:
        return typography.labelSmall;
      case AuiAvatarSize.sm:
        return typography.labelMedium;
      case AuiAvatarSize.md:
        return typography.labelLarge;
      case AuiAvatarSize.lg:
        return typography.titleSmall;
      case AuiAvatarSize.xl:
        return typography.titleMedium;
      case AuiAvatarSize.xxl:
        return typography.titleLarge;
    }
  }
}

/// Avatar with icon component
class AuiAvatarIcon extends StatelessWidget {
  const AuiAvatarIcon({
    super.key,
    required this.icon,
    this.variant = AuiAvatarVariant.filled,
    this.size = AuiAvatarSize.md,
    this.state = AuiAvatarState.enabled,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.tooltip,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.mouseCursor,
    this.clipBehavior = Clip.antiAlias,
    this.gradient,
    this.badge,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset,
    this.iconSize,
  });

  final IconData icon;
  final AuiAvatarVariant variant;
  final AuiAvatarSize size;
  final AuiAvatarState state;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final String? tooltip;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final MouseCursor? mouseCursor;
  final Clip clipBehavior;
  final Gradient? gradient;
  final Widget? badge;
  final Alignment badgeAlignment;
  final Offset? badgeOffset;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return AuiAvatar(
      variant: variant,
      size: size,
      state: state,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      semanticLabel: semanticLabel,
      tooltip: tooltip,
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      mouseCursor: mouseCursor,
      clipBehavior: clipBehavior,
      gradient: gradient,
      badge: badge,
      badgeAlignment: badgeAlignment,
      badgeOffset: badgeOffset,
      child: Icon(
        icon,
        size: iconSize ?? _getIconSize(),
      ),
    );
  }
  
  /// Get icon size
  double _getIconSize() {
    switch (size) {
      case AuiAvatarSize.xs:
        return 12.0;
      case AuiAvatarSize.sm:
        return 16.0;
      case AuiAvatarSize.md:
        return 20.0;
      case AuiAvatarSize.lg:
        return 24.0;
      case AuiAvatarSize.xl:
        return 28.0;
      case AuiAvatarSize.xxl:
        return 32.0;
    }
  }
}

/// Avatar utilities
class AuiAvatarUtils {
  const AuiAvatarUtils._();
  
  /// Get avatar size from enum
  static double getAvatarSize(AuiAvatarSize size) {
    switch (size) {
      case AuiAvatarSize.xs:
        return 24.0;
      case AuiAvatarSize.sm:
        return 32.0;
      case AuiAvatarSize.md:
        return 40.0;
      case AuiAvatarSize.lg:
        return 48.0;
      case AuiAvatarSize.xl:
        return 56.0;
      case AuiAvatarSize.xxl:
        return 64.0;
    }
  }
  
  /// Get icon size for avatar size
  static double getIconSize(AuiAvatarSize size) {
    switch (size) {
      case AuiAvatarSize.xs:
        return 12.0;
      case AuiAvatarSize.sm:
        return 16.0;
      case AuiAvatarSize.md:
        return 20.0;
      case AuiAvatarSize.lg:
        return 24.0;
      case AuiAvatarSize.xl:
        return 28.0;
      case AuiAvatarSize.xxl:
        return 32.0;
    }
  }
  
  /// Get badge offset for avatar size
  static double getBadgeOffset(AuiAvatarSize size) {
    switch (size) {
      case AuiAvatarSize.xs:
        return -2.0;
      case AuiAvatarSize.sm:
        return -4.0;
      case AuiAvatarSize.md:
        return -6.0;
      case AuiAvatarSize.lg:
        return -8.0;
      case AuiAvatarSize.xl:
        return -10.0;
      case AuiAvatarSize.xxl:
        return -12.0;
    }
  }
}
