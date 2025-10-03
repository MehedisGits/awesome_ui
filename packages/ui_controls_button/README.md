# UI Controls Button

Cross-platform button component for the Awesome UI library. Provides a unified button API that adapts to different platforms (Material 3, Cupertino, Web) while maintaining consistent behavior and accessibility.

## 🚀 Features

- **Cross-Platform**: Material 3, Cupertino, and Web adapters
- **5 Variants**: Primary, Secondary, Tonal, Ghost, Destructive
- **4 Sizes**: Extra Small, Small, Medium, Large
- **Multiple States**: Normal, Hovered, Pressed, Focused, Disabled, Loading
- **Accessibility**: WCAG AA/AAA compliant with semantic labels
- **Responsive**: Adapts to different screen sizes
- **Themeable**: Works with all brand themes

## 🚀 Quick Start

### Installation

```yaml
dependencies:
  ui_controls_button:
    path: ../ui_controls_button
  ui_tokens:
    path: ../ui_tokens
  ui_core:
    path: ../ui_core
```

### Basic Usage

```dart
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

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
        home: Scaffold(
          body: Center(
            child: AppButton(
              onPressed: () {
                print('Button pressed!');
              },
              child: Text('Click me'),
            ),
          ),
        ),
      ),
    );
  }
}
```

## 🎨 Button Variants

### Primary Button
```dart
AppButton(
  onPressed: () {},
  child: Text('Primary Button'),
)
```

### Secondary Button
```dart
AppButton(
  onPressed: () {},
  variant: AppButtonVariant.secondary,
  child: Text('Secondary Button'),
)
```

### Tonal Button
```dart
AppButton(
  onPressed: () {},
  variant: AppButtonVariant.tonal,
  child: Text('Tonal Button'),
)
```

### Ghost Button
```dart
AppButton(
  onPressed: () {},
  variant: AppButtonVariant.ghost,
  child: Text('Ghost Button'),
)
```

### Destructive Button
```dart
AppButton(
  onPressed: () {},
  variant: AppButtonVariant.destructive,
  child: Text('Delete'),
)
```

## 📏 Button Sizes

### Extra Small
```dart
AppButton(
  onPressed: () {},
  size: AppButtonSize.xs,
  child: Text('XS'),
)
```

### Small
```dart
AppButton(
  onPressed: () {},
  size: AppButtonSize.sm,
  child: Text('Small'),
)
```

### Medium (Default)
```dart
AppButton(
  onPressed: () {},
  size: AppButtonSize.md,
  child: Text('Medium'),
)
```

### Large
```dart
AppButton(
  onPressed: () {},
  size: AppButtonSize.lg,
  child: Text('Large'),
)
```

## 🎯 Button States

### Normal State
```dart
AppButton(
  onPressed: () {},
  child: Text('Normal'),
)
```

### Disabled State
```dart
AppButton(
  onPressed: null,
  child: Text('Disabled'),
)
```

### Loading State
```dart
AppButton(
  onPressed: () {},
  isLoading: true,
  child: Text('Loading'),
)
```

### With Icon
```dart
AppButton(
  onPressed: () {},
  leadingIcon: Icon(Icons.add),
  child: Text('Add Item'),
)
```

### With Trailing Icon
```dart
AppButton(
  onPressed: () {},
  trailingIcon: Icon(Icons.arrow_forward),
  child: Text('Next'),
)
```

## ♿ Accessibility

### Semantic Labels
```dart
AppButton(
  onPressed: () {},
  child: Text('Save'),
  semanticLabel: 'Save document',
)
```

### Tooltips
```dart
AppButton(
  onPressed: () {},
  child: Text('Delete'),
  tooltip: 'Delete selected item',
)
```

### Focus Management
```dart
AppButton(
  onPressed: () {},
  child: Text('Focusable'),
  focusNode: FocusNode(),
  autofocus: true,
)
```

## 📱 Responsive Design

### Responsive Sizes
```dart
AppButton(
  onPressed: () {},
  size: AppButtonSize.md, // Automatically adapts to screen size
  child: Text('Responsive'),
)
```

### Responsive Padding
```dart
AppButton(
  onPressed: () {},
  child: Text('Responsive Padding'),
  // Padding automatically adjusts based on screen size
)
```

## 🎨 Theming

### With Custom Colors
```dart
AppButton(
  onPressed: () {},
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  child: Text('Custom Colors'),
)
```

### With Custom Border
```dart
AppButton(
  onPressed: () {},
  borderColor: Colors.red,
  borderWidth: 2.0,
  child: Text('Custom Border'),
)
```

### With Custom Border Radius
```dart
AppButton(
  onPressed: () {},
  borderRadius: BorderRadius.circular(20),
  child: Text('Rounded'),
)
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/app_button_test.dart

# Run with coverage
flutter test --coverage
```

### Test Coverage

- **Unit Tests**: All button logic tested
- **Widget Tests**: All UI states tested
- **Accessibility Tests**: Screen reader and keyboard navigation tested
- **Responsive Tests**: Breakpoint behavior tested

## 📚 API Reference

### AppButton

```dart
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPress,
    this.onDoubleTap,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.state = AppButtonState.normal,
    this.isLoading = false,
    this.isDisabled = false,
    this.leadingIcon,
    this.trailingIcon,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.padding,
    this.margin,
    this.semanticLabel,
    this.tooltip,
    this.focusNode,
    this.autofocus = false,
  });
  
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final AppButtonState state;
  final bool isLoading;
  final bool isDisabled;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String? semanticLabel;
  final String? tooltip;
  final FocusNode? focusNode;
  final bool autofocus;
}
```

### AppButtonVariant

```dart
enum AppButtonVariant {
  primary,      // Primary action button
  secondary,    // Secondary action button
  tonal,        // Tonal button with background
  ghost,        // Ghost button with border only
  destructive,  // Destructive action button
}
```

### AppButtonSize

```dart
enum AppButtonSize {
  xs,  // Extra small (32dp height)
  sm,  // Small (40dp height)
  md,  // Medium (48dp height)
  lg,  // Large (56dp height)
}
```

### AppButtonState

```dart
enum AppButtonState {
  normal,    // Default state
  hovered,   // Mouse hover (web/desktop)
  pressed,   // Being pressed
  focused,   // Keyboard focus
  disabled,  // Disabled state
  loading,   // Loading state
}
```

## 🔄 Migration from Stock Flutter Widgets

### From ElevatedButton

```dart
// Before (ElevatedButton)
ElevatedButton(
  onPressed: () {},
  child: Text('Click me'),
)

// After (AppButton)
AppButton(
  onPressed: () {},
  child: Text('Click me'),
)
```

### From OutlinedButton

```dart
// Before (OutlinedButton)
OutlinedButton(
  onPressed: () {},
  child: Text('Click me'),
)

// After (AppButton)
AppButton(
  onPressed: () {},
  variant: AppButtonVariant.ghost,
  child: Text('Click me'),
)
```

### From TextButton

```dart
// Before (TextButton)
TextButton(
  onPressed: () {},
  child: Text('Click me'),
)

// After (AppButton)
AppButton(
  onPressed: () {},
  variant: AppButtonVariant.ghost,
  child: Text('Click me'),
)
```

### From CupertinoButton

```dart
// Before (CupertinoButton)
CupertinoButton(
  onPressed: () {},
  child: Text('Click me'),
)

// After (AppButton)
AppButton(
  onPressed: () {},
  child: Text('Click me'),
)
```

## 🎨 Platform Adaptations

### Material 3
- Uses Material 3 design principles
- Follows Material 3 color system
- Implements Material 3 elevation and shadows
- Supports Material 3 state layers

### Cupertino
- Uses Cupertino design language
- Follows iOS Human Interface Guidelines
- Implements Cupertino button styling
- Supports Cupertino animations

### Web
- Web-optimized rendering
- Supports hover states
- Implements web-specific interactions
- Optimized for mouse and keyboard input

## 📱 Responsive Behavior

### Mobile (< 600dp)
- Smaller touch targets (minimum 48dp)
- Reduced padding and margins
- Simplified visual hierarchy

### Tablet (600dp - 900dp)
- Medium touch targets
- Balanced padding and margins
- Enhanced visual hierarchy

### Desktop (> 900dp)
- Larger touch targets
- Increased padding and margins
- Full visual hierarchy

## ♿ Accessibility Features

### WCAG Compliance
- **AA Level**: Meets WCAG 2.1 AA standards
- **AAA Level**: Meets WCAG 2.1 AAA standards where applicable

### Touch Targets
- **Minimum Size**: 48dp for all interactive elements
- **Spacing**: Adequate spacing between touch targets
- **Visual Feedback**: Clear visual feedback for interactions

### Screen Reader Support
- **Semantic Labels**: All buttons include semantic labels
- **Live Regions**: Dynamic content updates are announced
- **Focus Management**: Logical focus order and management

### Keyboard Navigation
- **Tab Order**: Logical tab order through all interactive elements
- **Focus Indicators**: Clear focus indicators for keyboard users
- **Keyboard Shortcuts**: Standard keyboard shortcuts supported

## 🧪 Testing Examples

### Unit Tests

```dart
testWidgets('renders button with child', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: AppButton(
        onPressed: () {},
        child: Text('Test'),
      ),
    ),
  );

  expect(find.text('Test'), findsOneWidget);
});
```

### Widget Tests

```dart
testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
  bool wasPressed = false;
  
  await tester.pumpWidget(
    MaterialApp(
      home: AppButton(
        onPressed: () => wasPressed = true,
        child: Text('Test'),
      ),
    ),
  );

  await tester.tap(find.text('Test'));
  expect(wasPressed, isTrue);
});
```

### Accessibility Tests

```dart
testWidgets('has correct semantic properties', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: AppButton(
        onPressed: () {},
        child: Text('Test'),
        semanticLabel: 'Test button',
      ),
    ),
  );

  expect(
    tester.getSemantics(find.text('Test')),
    matchesSemantics(
      label: 'Test button',
      button: true,
      enabled: true,
    ),
  );
});
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