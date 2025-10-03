# Awesome UI Showcase

A comprehensive showcase application demonstrating the Awesome UI library's capabilities across different platforms, themes, and accessibility features.

## 🚀 Features

### 🎨 **Component Gallery**
- **AppButton**: All variants, sizes, and states
- **AppTextField**: Input decorations, validation, and accessibility
- **AppCard**: Different variants, elevations, and interactions

### 🌙 **Theme Showcase**
- **Light/Dark Mode**: Toggle between light and dark themes
- **Platform Styles**: Material 3, Cupertino, Web, and Adaptive
- **Color Palette**: Complete color system visualization
- **Typography Scale**: All text styles and sizes

### ♿ **Accessibility Demo**
- **Touch Targets**: 48dp minimum touch target compliance
- **Semantic Labels**: Screen reader support
- **Focus Management**: Keyboard navigation
- **High Contrast**: High contrast mode support
- **RTL Layout**: Right-to-left language support
- **Reduced Motion**: Respects system preferences

### 📱 **Responsive Demo**
- **Breakpoint Detection**: Mobile, Tablet, Desktop, Large Desktop
- **Adaptive Layouts**: Components that adapt to screen size
- **Responsive Grid**: Grid layouts that adjust to viewport
- **Typography Scaling**: Text that scales with screen size

### 🏢 **Brand Showcase**
- **Default Theme**: Standard Material 3 colors
- **Fintech Theme**: Professional blue and green palette
- **Health Theme**: Clean and calming healthcare colors
- **E-commerce Theme**: Vibrant and energetic shopping colors

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MehedisGits/awesome_ui.git
   cd awesome_ui
   ```

2. **Install dependencies:**
   ```bash
   melos bootstrap
   ```

3. **Run the showcase:**
   ```bash
   cd packages/ui_showcase
   flutter run
   ```

## 📱 Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| **Android** | ✅ | Full Material 3 support |
| **iOS** | ✅ | Full Cupertino support |
| **Web** | ✅ | Web-optimized rendering |
| **Windows** | ✅ | Material 3 with Windows adaptations |
| **macOS** | ✅ | Cupertino with macOS adaptations |
| **Linux** | ✅ | Material 3 with Linux adaptations |

## 🎯 Usage Examples

### Basic Component Usage

```dart
import 'package:ui_showcase/ui_showcase.dart';

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
        home: ComponentGallery(),
      ),
    );
  }
}
```

### Theme Toggle

```dart
class ThemeToggle extends StatefulWidget {
  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return AppStyleScope(
      colors: _isDarkMode ? AppColors.dark : AppColors.light,
      // ... other properties
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
        ),
        body: YourContent(),
      ),
    );
  }
}
```

### Platform Style Toggle

```dart
class PlatformToggle extends StatefulWidget {
  @override
  _PlatformToggleState createState() => _PlatformToggleState();
}

class _PlatformToggleState extends State<PlatformToggle> {
  PlatformStyle _currentStyle = PlatformStyle.material;

  @override
  Widget build(BuildContext context) {
    return AppStyleScope(
      platformStyle: _currentStyle,
      // ... other properties
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton<PlatformStyle>(
              onSelected: (style) {
                setState(() {
                  _currentStyle = style;
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: PlatformStyle.material, child: Text('Material 3')),
                PopupMenuItem(value: PlatformStyle.cupertino, child: Text('Cupertino')),
                PopupMenuItem(value: PlatformStyle.web, child: Text('Web')),
                PopupMenuItem(value: PlatformStyle.adaptive, child: Text('Adaptive')),
              ],
            ),
          ],
        ),
        body: YourContent(),
      ),
    );
  }
}
```

## 🎨 Brand Themes

### Default Theme
- **Primary**: Blue (#6750A4)
- **Secondary**: Purple (#625B71)
- **Tertiary**: Pink (#7D5260)
- **Use Case**: General purpose applications

### Fintech Theme
- **Primary**: Deep Blue (#1E3A8A)
- **Secondary**: Green (#059669)
- **Tertiary**: Gold (#D97706)
- **Use Case**: Financial applications, banking, fintech

### Health Theme
- **Primary**: Teal (#0D9488)
- **Secondary**: Green (#16A34A)
- **Tertiary**: Blue (#2563EB)
- **Use Case**: Healthcare, wellness, medical applications

### E-commerce Theme
- **Primary**: Orange (#EA580C)
- **Secondary**: Red (#DC2626)
- **Tertiary**: Purple (#7C3AED)
- **Use Case**: Online shopping, retail, e-commerce

## ♿ Accessibility Features

### WCAG Compliance
- **AA Level**: Meets WCAG 2.1 AA standards
- **AAA Level**: Meets WCAG 2.1 AAA standards where applicable

### Touch Targets
- **Minimum Size**: 48dp for all interactive elements
- **Spacing**: Adequate spacing between touch targets
- **Visual Feedback**: Clear visual feedback for interactions

### Screen Reader Support
- **Semantic Labels**: All components include semantic labels
- **Live Regions**: Dynamic content updates are announced
- **Focus Management**: Logical focus order and management

### Keyboard Navigation
- **Tab Order**: Logical tab order through all interactive elements
- **Focus Indicators**: Clear focus indicators for keyboard users
- **Keyboard Shortcuts**: Standard keyboard shortcuts supported

### High Contrast
- **High Contrast Mode**: Automatic adaptation to high contrast settings
- **Color Contrast**: Meets minimum contrast ratios
- **Visual Distinction**: Clear visual distinction between elements

## 📱 Responsive Design

### Breakpoints
- **Mobile**: < 600dp
- **Tablet**: 600dp - 900dp
- **Desktop**: 900dp - 1200dp
- **Large Desktop**: > 1200dp

### Adaptive Components
- **Button Sizes**: Automatically adjust based on screen size
- **Text Fields**: Width and padding adapt to viewport
- **Cards**: Layout and spacing adjust to available space
- **Typography**: Text sizes scale with screen size

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/component_gallery_test.dart

# Run with coverage
flutter test --coverage
```

### Test Coverage
- **Unit Tests**: All component logic tested
- **Widget Tests**: All UI components tested
- **Integration Tests**: End-to-end user flows tested
- **Accessibility Tests**: Screen reader and keyboard navigation tested

## 📚 Documentation

### API Documentation
- **Component APIs**: Complete API documentation for all components
- **Theme APIs**: Documentation for theming and customization
- **Accessibility APIs**: Accessibility features and usage
- **Responsive APIs**: Responsive design utilities

### Migration Guides
- **From Material 2**: Migration guide from Material 2 to Material 3
- **From Cupertino**: Migration guide from Cupertino to cross-platform
- **From Custom**: Migration guide from custom components

### Best Practices
- **Component Usage**: Best practices for using components
- **Theming**: Best practices for theming and customization
- **Accessibility**: Best practices for accessibility
- **Performance**: Best practices for performance optimization

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
