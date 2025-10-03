import 'package:flutter/foundation.dart';

/// Platform style enumeration for cross-platform UI components.
/// 
/// Defines the different platform styles that can be used to render
/// components with platform-specific appearance and behavior.
enum PlatformStyle {
  /// Material Design 3 style (Android, Web)
  material,
  
  /// Cupertino style (iOS, macOS)
  cupertino,
  
  /// Web-optimized style (Web-specific optimizations)
  web,
  
  /// Adaptive style (automatically chooses based on platform)
  adaptive,
}

/// Platform style utilities and helpers.
class PlatformStyleUtils {
  const PlatformStyleUtils._();

  /// Get the current platform style based on the platform
  static PlatformStyle getCurrentPlatformStyle() {
    if (kIsWeb) {
      return PlatformStyle.web;
    }
    
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return PlatformStyle.material;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return PlatformStyle.cupertino;
    }
  }

  /// Check if the current platform is mobile
  static bool get isMobile {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.android ||
           defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Check if the current platform is desktop
  static bool get isDesktop {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.linux ||
           defaultTargetPlatform == TargetPlatform.macOS ||
           defaultTargetPlatform == TargetPlatform.windows;
  }

  /// Check if the current platform is web
  static bool get isWeb => kIsWeb;

  /// Check if the current platform is iOS
  static bool get isIOS {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Check if the current platform is Android
  static bool get isAndroid {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.android;
  }

  /// Check if the current platform is macOS
  static bool get isMacOS {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.macOS;
  }

  /// Check if the current platform is Windows
  static bool get isWindows {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.windows;
  }

  /// Check if the current platform is Linux
  static bool get isLinux {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.linux;
  }

  /// Get the appropriate platform style for the given style
  static PlatformStyle resolveStyle(PlatformStyle style) {
    if (style == PlatformStyle.adaptive) {
      return getCurrentPlatformStyle();
    }
    return style;
  }

  /// Check if the given style matches the current platform
  static bool matchesCurrentPlatform(PlatformStyle style) {
    return resolveStyle(style) == getCurrentPlatformStyle();
  }

  /// Get the display name for the platform style
  static String getDisplayName(PlatformStyle style) {
    switch (style) {
      case PlatformStyle.material:
        return 'Material 3';
      case PlatformStyle.cupertino:
        return 'Cupertino';
      case PlatformStyle.web:
        return 'Web';
      case PlatformStyle.adaptive:
        return 'Adaptive';
    }
  }

  /// Get the description for the platform style
  static String getDescription(PlatformStyle style) {
    switch (style) {
      case PlatformStyle.material:
        return 'Material Design 3 for Android and Web';
      case PlatformStyle.cupertino:
        return 'Cupertino design for iOS and macOS';
      case PlatformStyle.web:
        return 'Web-optimized design with enhanced accessibility';
      case PlatformStyle.adaptive:
        return 'Automatically adapts to the current platform';
    }
  }

  /// Get all available platform styles
  static List<PlatformStyle> get allStyles => PlatformStyle.values;

  /// Get platform styles available on the current platform
  static List<PlatformStyle> get availableStyles {
    final current = getCurrentPlatformStyle();
    return PlatformStyle.values.where((style) {
      if (style == PlatformStyle.adaptive) return true;
      return style == current;
    }).toList();
  }

  /// Check if the platform style is supported on the current platform
  static bool isSupported(PlatformStyle style) {
    if (style == PlatformStyle.adaptive) return true;
    return style == getCurrentPlatformStyle();
  }

  /// Get the fallback style if the requested style is not supported
  static PlatformStyle getFallbackStyle(PlatformStyle style) {
    if (isSupported(style)) return style;
    return getCurrentPlatformStyle();
  }
}
