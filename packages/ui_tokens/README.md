# UI Tokens

Design tokens for the Awesome UI library. Provides a centralized system for colors, typography, spacing, elevation, and motion tokens that work across all platforms.

## 🎨 Features

- **Semantic Colors**: Success, warning, info, error, and neutral colors
- **Brand Variants**: Default, Fintech, Health, and E-commerce themes
- **Light/Dark Modes**: Complete theme support for both modes
- **High Contrast**: High contrast mode support for accessibility
- **Responsive Typography**: Typography that scales with screen size
- **Motion Tokens**: Animation durations, curves, and reduced motion support
- **Platform Agnostic**: Works across Material 3, Cupertino, and Web

## 🚀 Quick Start

### Installation

```yaml
dependencies:
  ui_tokens:
    path: ../ui_tokens
```

### Basic Usage

```dart
import 'package:ui_tokens/ui_tokens.dart';

// Use semantic colors
final primaryColor = AppColors.light.primary;
final errorColor = AppColors.light.error;

// Use typography
final headingStyle = AppTypography.headlineLarge;
final bodyStyle = AppTypography.bodyMedium;

// Use spacing
final padding = AppSpacing.md;
final margin = AppSpacing.lg;

// Use border radius
final borderRadius = AppRadius.md;

// Use elevation
final elevation = AppElevation.medium;
```

## 🎨 Color System

### Semantic Colors

| Color | Light Mode | Dark Mode | Usage |
|-------|------------|-----------|-------|
| `primary` | #6750A4 | #D0BCFF | Primary actions, brand color |
| `secondary` | #625B71 | #CCC2DC | Secondary actions |
| `tertiary` | #7D5260 | #FFB1C8 | Tertiary actions |
| `error` | #BA1A1A | #FFB4AB | Error states, destructive actions |
| `success` | #00C853 | #4CAF50 | Success states, positive actions |
| `warning` | #FF9800 | #FFB74D | Warning states, caution |
| `info` | #2196F3 | #64B5F6 | Information states, neutral actions |

### Brand Variants

#### Default Theme
- **Primary**: Blue (#6750A4)
- **Secondary**: Purple (#625B71)
- **Tertiary**: Pink (#7D5260)

#### Fintech Theme
- **Primary**: Deep Blue (#1E3A8A)
- **Secondary**: Green (#059669)
- **Tertiary**: Gold (#D97706)

#### Health Theme
- **Primary**: Teal (#0D9488)
- **Secondary**: Green (#16A34A)
- **Tertiary**: Blue (#2563EB)

#### E-commerce Theme
- **Primary**: Orange (#EA580C)
- **Secondary**: Red (#DC2626)
- **Tertiary**: Purple (#7C3AED)

## 📝 Typography

### Type Scale

| Style | Font Size | Line Height | Usage |
|-------|-----------|-------------|-------|
| `displayLarge` | 57px | 64px | Large displays, hero text |
| `displayMedium` | 45px | 52px | Medium displays |
| `displaySmall` | 36px | 44px | Small displays |
| `headlineLarge` | 32px | 40px | Page titles |
| `headlineMedium` | 28px | 36px | Section titles |
| `headlineSmall` | 24px | 32px | Subsection titles |
| `titleLarge` | 22px | 28px | Card titles |
| `titleMedium` | 16px | 24px | List items |
| `titleSmall` | 14px | 20px | Small titles |
| `bodyLarge` | 16px | 24px | Body text |
| `bodyMedium` | 14px | 20px | Secondary text |
| `bodySmall` | 12px | 16px | Captions |
| `labelLarge` | 14px | 20px | Labels |
| `labelMedium` | 12px | 16px | Small labels |
| `labelSmall` | 11px | 16px | Tiny labels |

### Usage

```dart
// Direct usage
Text('Hello World', style: AppTypography.headlineLarge)

// With theme
Text('Hello World', style: Theme.of(context).textTheme.headlineLarge)
```

## 📏 Spacing

### Spacing Scale

| Token | Value | Usage |
|-------|-------|-------|
| `xs` | 4px | Tight spacing, borders |
| `sm` | 8px | Small spacing, padding |
| `md` | 16px | Medium spacing, standard padding |
| `lg` | 24px | Large spacing, section padding |
| `xl` | 32px | Extra large spacing, page padding |
| `xxl` | 48px | Huge spacing, hero sections |

### Usage

```dart
// Padding
Padding(
  padding: EdgeInsets.all(AppSpacing.md),
  child: Text('Content'),
)

// Margin
Container(
  margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
  child: Text('Content'),
)
```

## 🔲 Border Radius

### Radius Scale

| Token | Value | Usage |
|-------|-------|-------|
| `xs` | 4px | Small elements, buttons |
| `sm` | 8px | Cards, inputs |
| `md` | 12px | Standard elements |
| `lg` | 16px | Large cards, modals |
| `xl` | 24px | Hero sections, large modals |
| `full` | 999px | Pills, circular elements |

### Usage

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(AppRadius.md),
    color: Colors.white,
  ),
  child: Text('Content'),
)
```

## 📐 Elevation

### Elevation Scale

| Token | Value | Usage |
|-------|-------|-------|
| `none` | 0dp | Flat elements |
| `low` | 1dp | Subtle elevation |
| `medium` | 2dp | Standard elevation |
| `high` | 4dp | Prominent elevation |
| `maximum` | 8dp | Highest elevation |

### Usage

```dart
Card(
  elevation: AppElevation.medium,
  child: Text('Content'),
)
```

## 🎬 Motion

### Animation Durations

| Token | Value | Usage |
|-------|-------|-------|
| `fast` | 150ms | Quick interactions |
| `normal` | 300ms | Standard animations |
| `slow` | 500ms | Complex animations |
| `verySlow` | 1000ms | Page transitions |

### Animation Curves

| Token | Curve | Usage |
|-------|-------|-------|
| `easeIn` | Curves.easeIn | Enter animations |
| `easeOut` | Curves.easeOut | Exit animations |
| `easeInOut` | Curves.easeInOut | Standard animations |
| `bounce` | Curves.bounceOut | Playful animations |

### Usage

```dart
AnimatedContainer(
  duration: AppMotion.normal,
  curve: AppMotion.easeInOut,
  child: Text('Content'),
)
```

## 🌙 Theme Support

### Light/Dark Modes

```dart
// Light theme
final lightColors = AppColors.light;

// Dark theme
final darkColors = AppColors.dark;

// High contrast
final highContrastColors = AppColors.highContrast;
```

### Brand Themes

```dart
// Default theme
final defaultColors = AppColors.light;

// Fintech theme
final fintechColors = FintechTokens.colors;

// Health theme
final healthColors = HealthTokens.colors;

// E-commerce theme
final ecommerceColors = EcommerceTokens.colors;
```

## ♿ Accessibility

### High Contrast Support

```dart
// Check if high contrast is enabled
final isHighContrast = MediaQuery.of(context).highContrast;

// Use high contrast colors
final colors = isHighContrast ? AppColors.highContrast : AppColors.light;
```

### Reduced Motion Support

```dart
// Check if reduced motion is enabled
final isReducedMotion = MediaQuery.of(context).disableAnimations;

// Use appropriate motion tokens
final duration = isReducedMotion ? AppMotion.fast : AppMotion.normal;
```

## 📱 Responsive Design

### Breakpoints

| Breakpoint | Min Width | Usage |
|------------|-----------|-------|
| `mobile` | 0px | Mobile devices |
| `tablet` | 600px | Tablets |
| `desktop` | 900px | Desktop |
| `largeDesktop` | 1200px | Large desktop |

### Responsive Typography

```dart
// Typography scales with screen size
final responsiveStyle = AppTypography.getResponsiveStyle(
  context: context,
  mobile: AppTypography.bodyMedium,
  tablet: AppTypography.bodyLarge,
  desktop: AppTypography.titleMedium,
);
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/colors_test.dart

# Run with coverage
flutter test --coverage
```

### Test Coverage

- **Unit Tests**: All token classes tested
- **Widget Tests**: Theme integration tested
- **Accessibility Tests**: High contrast and reduced motion tested
- **Responsive Tests**: Breakpoint behavior tested

## 📚 API Reference

### AppColors

```dart
class AppColors {
  // Primary colors
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  
  // Secondary colors
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  
  // Tertiary colors
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  
  // Error colors
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  
  // Surface colors
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  
  // Outline colors
  final Color outline;
  final Color outlineVariant;
  
  // Other colors
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;
  
  // Semantic colors
  final Color success;
  final Color warning;
  final Color info;
  
  // Factory constructors
  static AppColors get light => AppColors._light();
  static AppColors get dark => AppColors._dark();
  static AppColors get highContrast => AppColors._highContrast();
}
```

### AppTypography

```dart
class AppTypography {
  // Display styles
  static const TextStyle displayLarge;
  static const TextStyle displayMedium;
  static const TextStyle displaySmall;
  
  // Headline styles
  static const TextStyle headlineLarge;
  static const TextStyle headlineMedium;
  static const TextStyle headlineSmall;
  
  // Title styles
  static const TextStyle titleLarge;
  static const TextStyle titleMedium;
  static const TextStyle titleSmall;
  
  // Body styles
  static const TextStyle bodyLarge;
  static const TextStyle bodyMedium;
  static const TextStyle bodySmall;
  
  // Label styles
  static const TextStyle labelLarge;
  static const TextStyle labelMedium;
  static const TextStyle labelSmall;
  
  // Responsive methods
  static TextStyle getResponsiveStyle({
    required BuildContext context,
    required TextStyle mobile,
    required TextStyle tablet,
    required TextStyle desktop,
  });
}
```

### AppSpacing

```dart
class AppSpacing {
  // Spacing values
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  
  // Edge insets helpers
  static const EdgeInsets allXs = EdgeInsets.all(4.0);
  static const EdgeInsets allSm = EdgeInsets.all(8.0);
  static const EdgeInsets allMd = EdgeInsets.all(16.0);
  static const EdgeInsets allLg = EdgeInsets.all(24.0);
  static const EdgeInsets allXl = EdgeInsets.all(32.0);
  static const EdgeInsets allXxl = EdgeInsets.all(48.0);
}
```

### AppRadius

```dart
class AppRadius {
  // Radius values
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double full = 999.0;
  
  // Border radius helpers
  static const BorderRadius allXs = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius allSm = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius allMd = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius allLg = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius allXl = BorderRadius.all(Radius.circular(24.0));
  static const BorderRadius allFull = BorderRadius.all(Radius.circular(999.0));
}
```

### AppElevation

```dart
class AppElevation {
  // Elevation values
  static const double none = 0.0;
  static const double low = 1.0;
  static const double medium = 2.0;
  static const double high = 4.0;
  static const double maximum = 8.0;
  
  // Shadow helpers
  static List<BoxShadow> getShadow(double elevation);
  static BoxShadow getShadowConfig(double elevation);
}
```

### AppMotion

```dart
class AppMotion {
  // Duration values
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 1000);
  
  // Curve values
  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve bounce = Curves.bounceOut;
  
  // Factory constructors
  static AppMotion standard() => AppMotion._standard();
  static AppMotion reduced() => AppMotion._reduced();
}
```

## 🤝 Contributing

### Development Setup

1. **Fork the repository**
2. **Create a feature branch**
3. **Make your changes**
4. **Run tests and linting**
5. **Submit a pull request**

### Code Style

- **Dart**: Follows Dart style guide
- **Flutter**: Follows Flutter style guide
- **Accessibility**: Follows WCAG guidelines
- **Documentation**: Comprehensive documentation required

### Testing Requirements

- **Unit Tests**: All new code must have unit tests
- **Widget Tests**: All UI components must have widget tests
- **Accessibility Tests**: All components must have accessibility tests
- **Integration Tests**: New features must have integration tests

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

## 🙏 Acknowledgments

- **Material Design**: Google's Material Design system
- **Cupertino Design**: Apple's Cupertino design system
- **Flutter Team**: The Flutter framework and tools
- **Community**: Contributors and users of the Awesome UI library

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/MehedisGits/awesome_ui/issues)
- **Discussions**: [GitHub Discussions](https://github.com/MehedisGits/awesome_ui/discussions)
- **Documentation**: [GitHub Wiki](https://github.com/MehedisGits/awesome_ui/wiki)
- **Email**: [Contact Us](mailto:support@awesomeui.dev)

---

**Made with ❤️ by the Awesome UI Team**
