# UI Core

Core utilities and platform adapters for the Awesome UI library. Provides cross-platform compatibility, accessibility helpers, and responsive design utilities.

## 🚀 Features

- **Platform Adapters**: Material 3, Cupertino, and Web adapters
- **AppStyleScope**: Unified theming and platform management
- **Accessibility Helpers**: Semantic labels, focus management, and screen reader support
- **Responsive Utilities**: Breakpoint detection and adaptive layouts
- **Base Mixins**: Common functionality for UI components
- **Cross-Platform**: Works across all Flutter platforms

## 🚀 Quick Start

### Installation

```yaml
dependencies:
  ui_core:
    path: ../ui_core
  ui_tokens:
    path: ../ui_tokens
```

### Basic Usage

```dart
import 'package:ui_core/ui_core.dart';
import 'package:ui_tokens/ui_tokens.dart';

// Wrap your app with AppStyleScope
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppStyleScope(
      platformStyle: PlatformStyle.material,
      colors: AppColors.light,
      typography: AppTypography.standard(),
      spacing: AppSpacing.standard(),
      radius: AppRadius.standard(),
      elevation: AppElevation.standard(),
      motion: AppMotion.standard(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
```

## 🎨 Platform Styles

### Supported Platforms

| Platform | Status | Description |
|----------|--------|-------------|
| **Material 3** | ✅ | Google's Material Design 3 |
| **Cupertino** | ✅ | Apple's Cupertino design language |
| **Web** | ✅ | Web-optimized rendering |
| **Adaptive** | ✅ | Automatically chooses platform |

### Platform Style Usage

```dart
// Material 3 (Android, Web, Desktop)
AppStyleScope(
  platformStyle: PlatformStyle.material,
  child: MyWidget(),
)

// Cupertino (iOS, macOS)
AppStyleScope(
  platformStyle: PlatformStyle.cupertino,
  child: MyWidget(),
)

// Web-optimized
AppStyleScope(
  platformStyle: PlatformStyle.web,
  child: MyWidget(),
)

// Adaptive (chooses automatically)
AppStyleScope(
  platformStyle: PlatformStyle.adaptive,
  child: MyWidget(),
)
```

## 🎯 AppStyleScope

### Properties

```dart
class AppStyleScope extends InheritedWidget {
  final PlatformStyle platformStyle;
  final AppColors colors;
  final AppTypography typography;
  final AppSpacing spacing;
  final AppRadius radius;
  final AppElevation elevation;
  final AppMotion motion;
  
  // ... other properties
}
```

### Usage in Components

```dart
class MyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access current platform style
    final platformStyle = AppStyleScope.of(context).platformStyle;
    
    // Access current colors
    final colors = AppStyleScope.of(context).colors;
    
    // Access current typography
    final typography = AppStyleScope.of(context).typography;
    
    return Container(
      color: colors.primary,
      child: Text(
        'Hello World',
        style: typography.headlineLarge,
      ),
    );
  }
}
```

## ♿ Accessibility Helpers

### Semantic Helpers

```dart
// Create semantic button
Widget createSemanticButton({
  required Widget child,
  required VoidCallback? onPressed,
  String? semanticLabel,
  String? tooltip,
  bool excludeSemantics = false,
}) {
  return Semantics(
    label: semanticLabel,
    hint: tooltip,
    button: true,
    enabled: onPressed != null,
    excludeSemantics: excludeSemantics,
    child: GestureDetector(
      onTap: onPressed,
      child: child,
    ),
  );
}

// Create semantic text field
Widget createSemanticTextField({
  required Widget child,
  String? semanticLabel,
  String? hintText,
  bool isRequired = false,
}) {
  return Semantics(
    label: semanticLabel,
    hint: hintText,
    textField: true,
    required: isRequired,
    child: child,
  );
}
```

### Focus Management

```dart
// Create focusable widget
Widget createFocusableWidget({
  required Widget child,
  required FocusNode focusNode,
  required VoidCallback? onTap,
  bool autofocus = false,
  String? semanticLabel,
  String? tooltip,
}) {
  return Focus(
    focusNode: focusNode,
    autofocus: autofocus,
    child: Semantics(
      label: semanticLabel,
      hint: tooltip,
      button: true,
      enabled: onTap != null,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    ),
  );
}
```

### Screen Reader Support

```dart
// Announce to screen readers
void announceToScreenReader(BuildContext context, String message) {
  SemanticsService.announce(message, TextDirection.ltr);
}

// Live region for dynamic content
Widget createLiveRegion({
  required Widget child,
  required String liveRegion,
}) {
  return Semantics(
    liveRegion: true,
    child: child,
  );
}
```

## 📱 Responsive Utilities

### Breakpoint Detection

```dart
// Get current breakpoint
String getCurrentBreakpoint(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return BreakpointUtils.getBreakpoint(width);
}

// Check if mobile
bool isMobile(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return BreakpointUtils.isMobile(width);
}

// Check if tablet
bool isTablet(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return BreakpointUtils.isTablet(width);
}

// Check if desktop
bool isDesktop(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return BreakpointUtils.isDesktop(width);
}
```

### Responsive Values

```dart
// Get responsive value
T getResponsiveValue<T>({
  required T mobile,
  required T tablet,
  required T desktop,
  required T largeDesktop,
  required BuildContext context,
}) {
  final width = MediaQuery.of(context).size.width;
  return BreakpointUtils.getResponsiveValue(
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
    largeDesktop: largeDesktop,
    width: width,
  );
}

// Responsive padding
EdgeInsets getResponsivePadding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return BreakpointUtils.getResponsivePadding(width: width);
}

// Responsive margin
EdgeInsets getResponsiveMargin(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return BreakpointUtils.getResponsiveMargin(width: width);
}
```

### Responsive Builder

```dart
// Responsive builder widget
ResponsiveBuilder(
  mobile: (context) => MobileLayout(),
  tablet: (context) => TabletLayout(),
  desktop: (context) => DesktopLayout(),
  largeDesktop: (context) => LargeDesktopLayout(),
)

// Responsive breakpoint builder
BreakpointBuilder(
  breakpoints: {
    'mobile': (context) => MobileLayout(),
    'tablet': (context) => TabletLayout(),
    'desktop': (context) => DesktopLayout(),
  },
)
```

## 🎨 Base Mixins

### Component Mixin

```dart
class MyComponent extends StatefulWidget {
  @override
  _MyComponentState createState() => _MyComponentState();
}

class _MyComponentState extends State<MyComponent>
    with ComponentMixin {
  
  @override
  Widget build(BuildContext context) {
    // Access resolved platform style
    final platformStyle = resolvedPlatformStyle;
    
    // Access current colors
    final colors = this.colors;
    
    // Access current typography
    final typography = this.typography;
    
    return Container(
      color: colors.primary,
      child: Text(
        'Hello World',
        style: typography.headlineLarge,
      ),
    );
  }
}
```

### Accessibility Mixin

```dart
class MyComponent extends StatefulWidget {
  @override
  _MyComponentState createState() => _MyComponentState();
}

class _MyComponentState extends State<MyComponent>
    with AccessibilityMixin {
  
  @override
  Widget build(BuildContext context) {
    return createSemanticButton(
      child: Text('Click me'),
      onPressed: () {},
      semanticLabel: 'Click me button',
      tooltip: 'Press to activate',
    );
  }
}
```

### Responsive Mixin

```dart
class MyComponent extends StatefulWidget {
  @override
  _MyComponentState createState() => _MyComponentState();
}

class _MyComponentState extends State<MyComponent>
    with ResponsiveMixin {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getResponsivePadding(context),
      child: Text(
        'Responsive text',
        style: getResponsiveTextStyle(context),
      ),
    );
  }
}
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/platform_style_test.dart

# Run with coverage
flutter test --coverage
```

### Test Coverage

- **Unit Tests**: All utility classes tested
- **Widget Tests**: All helper widgets tested
- **Accessibility Tests**: Screen reader and keyboard navigation tested
- **Responsive Tests**: Breakpoint behavior tested

## 📚 API Reference

### PlatformStyle

```dart
enum PlatformStyle {
  material,    // Material 3 (Android, Web, Desktop)
  cupertino,   // Cupertino (iOS, macOS)
  web,         // Web-optimized
  adaptive,    // Automatic platform detection
}
```

### AppStyleScope

```dart
class AppStyleScope extends InheritedWidget {
  final PlatformStyle platformStyle;
  final AppColors colors;
  final AppTypography typography;
  final AppSpacing spacing;
  final AppRadius radius;
  final AppElevation elevation;
  final AppMotion motion;
  
  const AppStyleScope({
    required this.platformStyle,
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.radius,
    required this.elevation,
    required this.motion,
    required super.child,
  });
  
  static AppStyleScope of(BuildContext context);
  static AppStyleScope? maybeOf(BuildContext context);
}
```

### BreakpointUtils

```dart
class BreakpointUtils {
  // Breakpoint detection
  static String getBreakpoint(double width);
  static bool isMobile(double width);
  static bool isTablet(double width);
  static bool isDesktop(double width);
  static bool isLargeDesktop(double width);
  
  // Responsive values
  static T getResponsiveValue<T>({
    required T mobile,
    required T tablet,
    required T desktop,
    required T largeDesktop,
    required double width,
  });
  
  // Responsive spacing
  static EdgeInsets getResponsivePadding({required double width});
  static EdgeInsets getResponsiveMargin({required double width});
  
  // Responsive typography
  static TextStyle getResponsiveTextStyle({
    required double width,
    required TextStyle mobile,
    required TextStyle tablet,
    required TextStyle desktop,
    required TextStyle largeDesktop,
  });
}
```

### ResponsiveBuilder

```dart
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext) mobile;
  final Widget Function(BuildContext) tablet;
  final Widget Function(BuildContext) desktop;
  final Widget Function(BuildContext) largeDesktop;
  
  const ResponsiveBuilder({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
  });
}
```

### BreakpointBuilder

```dart
class BreakpointBuilder extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> breakpoints;
  
  const BreakpointBuilder({
    required this.breakpoints,
  });
}
```

### ComponentMixin

```dart
mixin ComponentMixin<T extends StatefulWidget> on State<T> {
  PlatformStyle get resolvedPlatformStyle;
  AppColors get colors;
  AppTypography get typography;
  AppSpacing get spacing;
  AppRadius get radius;
  AppElevation get elevation;
  AppMotion get motion;
}
```

### AccessibilityMixin

```dart
mixin AccessibilityMixin<T extends StatefulWidget> on State<T> {
  Widget createSemanticButton({
    required Widget child,
    required VoidCallback? onPressed,
    String? semanticLabel,
    String? tooltip,
    bool excludeSemantics = false,
  });
  
  Widget createSemanticTextField({
    required Widget child,
    String? semanticLabel,
    String? hintText,
    bool isRequired = false,
  });
  
  Widget createFocusableWidget({
    required Widget child,
    required FocusNode focusNode,
    required VoidCallback? onTap,
    bool autofocus = false,
    String? semanticLabel,
    String? tooltip,
  });
}
```

### ResponsiveMixin

```dart
mixin ResponsiveMixin<T extends StatefulWidget> on State<T> {
  String getCurrentBreakpoint(BuildContext context);
  bool isMobile(BuildContext context);
  bool isTablet(BuildContext context);
  bool isDesktop(BuildContext context);
  bool isLargeDesktop(BuildContext context);
  
  T getResponsiveValue<T>({
    required T mobile,
    required T tablet,
    required T desktop,
    required T largeDesktop,
    required BuildContext context,
  });
  
  EdgeInsets getResponsivePadding(BuildContext context);
  EdgeInsets getResponsiveMargin(BuildContext context);
  TextStyle getResponsiveTextStyle(BuildContext context);
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
