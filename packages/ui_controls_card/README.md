# UI Controls Card

Cross-platform card component for the Awesome UI library. Provides a unified card API that adapts to different platforms while maintaining consistent behavior and accessibility.

## 🚀 Features

- **Cross-Platform**: Material 3, Cupertino, and Web adapters
- **3 Variants**: Filled, Outlined, Elevated
- **4 Sizes**: Small, Medium, Large, Extra Large
- **Multiple States**: Normal, Hovered, Pressed, Focused, Disabled, Selected
- **Accessibility**: WCAG AA/AAA compliant with semantic labels
- **Responsive**: Adapts to different screen sizes
- **Themeable**: Works with all brand themes

## 🚀 Quick Start

### Installation

```yaml
dependencies:
  ui_controls_card:
    path: ../ui_controls_card
  ui_tokens:
    path: ../ui_tokens
  ui_core:
    path: ../ui_core
```

### Basic Usage

```dart
import 'package:ui_controls_card/ui_controls_card.dart';

AppCard(
  child: Text('Card Content'),
)
```

## 🎨 Card Variants

### Filled Card
```dart
AppCard(
  child: Text('Filled Card'),
  variant: CardVariant.filled,
)
```

### Outlined Card
```dart
AppCard(
  child: Text('Outlined Card'),
  variant: CardVariant.outlined,
)
```

### Elevated Card
```dart
AppCard(
  child: Text('Elevated Card'),
  variant: CardVariant.elevated,
)
```

## 📏 Card Sizes

### Small
```dart
AppCard(
  child: Text('Small Card'),
  size: CardSize.sm,
)
```

### Medium (Default)
```dart
AppCard(
  child: Text('Medium Card'),
  size: CardSize.md,
)
```

### Large
```dart
AppCard(
  child: Text('Large Card'),
  size: CardSize.lg,
)
```

### Extra Large
```dart
AppCard(
  child: Text('Extra Large Card'),
  size: CardSize.xl,
)
```

## 🎯 Card States

### Normal State
```dart
AppCard(
  child: Text('Normal Card'),
)
```

### Clickable Card
```dart
AppCard(
  child: Text('Clickable Card'),
  isClickable: true,
  onTap: () {
    print('Card tapped!');
  },
)
```

### Selected Card
```dart
AppCard(
  child: Text('Selected Card'),
  isSelected: true,
)
```

### Disabled Card
```dart
AppCard(
  child: Text('Disabled Card'),
  isDisabled: true,
)
```

## 📐 Elevation Levels

### No Elevation
```dart
AppCard(
  child: Text('Flat Card'),
  elevation: CardElevation.none,
)
```

### Low Elevation
```dart
AppCard(
  child: Text('Low Elevation'),
  elevation: CardElevation.low,
)
```

### Medium Elevation (Default)
```dart
AppCard(
  child: Text('Medium Elevation'),
  elevation: CardElevation.medium,
)
```

### High Elevation
```dart
AppCard(
  child: Text('High Elevation'),
  elevation: CardElevation.high,
)
```

### Maximum Elevation
```dart
AppCard(
  child: Text('Maximum Elevation'),
  elevation: CardElevation.maximum,
)
```

## 🎨 Surface Types

### Primary Surface
```dart
AppCard(
  child: Text('Primary Surface'),
  surface: CardSurface.primary,
)
```

### Secondary Surface
```dart
AppCard(
  child: Text('Secondary Surface'),
  surface: CardSurface.secondary,
)
```

### Tertiary Surface
```dart
AppCard(
  child: Text('Tertiary Surface'),
  surface: CardSurface.tertiary,
)
```

### Container Surface
```dart
AppCard(
  child: Text('Container Surface'),
  surface: CardSurface.container,
)
```

## ♿ Accessibility

### Semantic Labels
```dart
AppCard(
  child: Text('Product Card'),
  semanticLabel: 'Product card for iPhone 15',
)
```

### Focus Management
```dart
AppCard(
  child: Text('Focusable Card'),
  isClickable: true,
  onTap: () {},
  focusNode: FocusNode(),
  autofocus: true,
)
```

### Screen Reader Support
```dart
AppCard(
  child: Text('Accessible Card'),
  isClickable: true,
  onTap: () {},
  semanticLabel: 'Article card, tap to read',
)
```

## 📱 Responsive Design

### Responsive Sizes
```dart
AppCard(
  child: Text('Responsive Card'),
  size: CardSize.md, // Automatically adapts to screen size
)
```

### Responsive Padding
```dart
AppCard(
  child: Text('Responsive Padding'),
  // Padding automatically adjusts based on screen size
)
```

## 🎨 Theming

### With Custom Colors
```dart
AppCard(
  child: Text('Custom Colors'),
  backgroundColor: Colors.blue.shade50,
  borderColor: Colors.blue,
)
```

### With Custom Border Radius
```dart
AppCard(
  child: Text('Rounded Card'),
  borderRadius: BorderRadius.circular(20),
)
```

### With Custom Padding
```dart
AppCard(
  child: Text('Custom Padding'),
  padding: EdgeInsets.all(24),
)
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/app_card_test.dart

# Run with coverage
flutter test --coverage
```

## 📚 API Reference

### AppCard

```dart
class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.variant = CardVariant.filled,
    this.size = CardSize.md,
    this.state = CardState.normal,
    this.elevation = CardElevation.medium,
    this.surface = CardSurface.primary,
    this.isClickable = false,
    this.isSelected = false,
    this.isDisabled = false,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    this.shadowColor,
    this.elevationColor,
    this.splashColor,
    this.highlightColor,
    this.focusColor,
    this.hoverColor,
    this.selectedColor,
    this.disabledColor,
    this.semanticLabel,
    this.semanticHint,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.antiAlias,
  });
}
```

### CardVariant

```dart
enum CardVariant {
  filled,    // Filled card with background
  outlined,  // Outlined card with border
  elevated,  // Elevated card with shadow
}
```

### CardSize

```dart
enum CardSize {
  sm,  // Small (200dp width)
  md,  // Medium (300dp width)
  lg,  // Large (400dp width)
  xl,  // Extra Large (500dp width)
}
```

### CardState

```dart
enum CardState {
  normal,    // Default state
  hovered,   // Mouse hover (web/desktop)
  pressed,   // Being pressed
  focused,   // Keyboard focus
  disabled,  // Disabled state
  selected,  // Selected state
}
```

### CardElevation

```dart
enum CardElevation {
  none,     // No elevation
  low,      // Low elevation
  medium,   // Medium elevation
  high,     // High elevation
  maximum,  // Maximum elevation
}
```

### CardSurface

```dart
enum CardSurface {
  primary,    // Primary surface
  secondary,  // Secondary surface
  tertiary,   // Tertiary surface
  container,  // Container surface
}
```

## 🔄 Migration from Stock Flutter Widgets

### From Card

```dart
// Before (Card)
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card Content'),
  ),
)

// After (AppCard)
AppCard(
  child: Text('Card Content'),
)
```

### From Container

```dart
// Before (Container)
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card Content'),
  ),
)

// After (AppCard)
AppCard(
  child: Text('Card Content'),
)
```

### From CupertinoCard

```dart
// Before (CupertinoCard)
CupertinoCard(
  child: Text('Card Content'),
)

// After (AppCard)
AppCard(
  child: Text('Card Content'),
)
```

## 🤝 Contributing

### Development Setup

1. **Fork the repository**
2. **Create a feature branch**
3. **Make your changes**
4. **Run tests and linting**
5. **Submit a pull request**

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/MehedisGits/awesome_ui/issues)
- **Discussions**: [GitHub Discussions](https://github.com/MehedisGits/awesome_ui/discussions)
- **Documentation**: [GitHub Wiki](https://github.com/MehedisGits/awesome_ui/wiki)
- **Email**: [Contact Us](mailto:support@awesomeui.dev)

---

**Made with ❤️ by the Awesome UI Team**
