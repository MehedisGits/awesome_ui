# Awesome UI

A comprehensive, cross-platform Flutter UI library built with modern design principles, accessibility-first approach, and production-ready components.

## 🚀 Features

- **🎨 Cross-Platform**: Material 3, Cupertino, and Web adapters
- **♿ Accessibility**: WCAG AA/AAA compliant with semantic labels
- **📱 Responsive**: Adaptive layouts for all screen sizes
- **🎯 Themeable**: Multiple brand themes and light/dark modes
- **🔧 Modular**: Independent packages with zero coupling
- **🧪 Tested**: Comprehensive test coverage and golden tests
- **📚 Documented**: Complete API documentation and examples

## 📦 Packages

| Package | Description | Status |
|---------|-------------|--------|
| **ui_tokens** | Design tokens (colors, typography, spacing) | ✅ Complete |
| **ui_core** | Platform adapters and utilities | ✅ Complete |
| **ui_controls_button** | Cross-platform button component | ✅ Complete |
| **ui_controls_text_field** | Cross-platform text field component | ✅ Complete |
| **ui_controls_card** | Cross-platform card component | ✅ Complete |
| **ui_showcase** | Comprehensive showcase application | ✅ Complete |

## 🚀 Quick Start

### Installation

```yaml
dependencies:
  ui_tokens:
    path: ../ui_tokens
  ui_core:
    path: ../ui_core
  ui_controls_button:
    path: ../ui_controls_button
  ui_controls_text_field:
    path: ../ui_controls_text_field
  ui_controls_card:
    path: ../ui_controls_card
```

### Basic Usage

```dart
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';
import 'package:ui_controls_button/ui_controls_button.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_controls_card/ui_controls_card.dart';

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
          body: Column(
            children: [
              AppButton(
                onPressed: () {},
                child: Text('Click me'),
              ),
              AppTextField(
                decoration: const TextFieldDecoration(
                  labelText: 'Enter your name',
                ),
              ),
              AppCard(
                child: Text('Card Content'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 🎨 Design System

### Color System
- **Semantic Colors**: Success, warning, info, error, and neutral colors
- **Brand Variants**: Default, Fintech, Health, and E-commerce themes
- **Light/Dark Modes**: Complete theme support for both modes
- **High Contrast**: High contrast mode support for accessibility

### Typography
- **Type Scale**: 13 text styles from display to label
- **Responsive**: Typography that scales with screen size
- **Platform Agnostic**: Works across Material 3, Cupertino, and Web

### Spacing
- **Consistent Scale**: 6 spacing tokens from 4px to 48px
- **Responsive**: Spacing that adapts to screen size
- **Component-Specific**: Tailored spacing for different components

### Elevation
- **5 Levels**: From none to maximum elevation
- **Platform Specific**: Different shadows for different platforms
- **Accessibility**: High contrast mode support

## ♿ Accessibility

### WCAG Compliance
- **AA Level**: Meets WCAG 2.1 AA standards
- **AAA Level**: Meets WCAG 2.1 AAA standards where applicable

### Features
- **Touch Targets**: 48dp minimum touch target compliance
- **Screen Reader**: Semantic labels and live regions
- **Keyboard Navigation**: Full keyboard accessibility
- **High Contrast**: High contrast mode support
- **RTL Layout**: Right-to-left language support
- **Reduced Motion**: Respects system preferences

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

## 🎯 Platform Support

| Platform | Status | Description |
|----------|--------|-------------|
| **Android** | ✅ | Full Material 3 support |
| **iOS** | ✅ | Full Cupertino support |
| **Web** | ✅ | Web-optimized rendering |
| **Windows** | ✅ | Material 3 with Windows adaptations |
| **macOS** | ✅ | Cupertino with macOS adaptations |
| **Linux** | ✅ | Material 3 with Linux adaptations |

## 🏢 Brand Themes

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

## 🧪 Testing

### Running Tests

```bash
# Run all tests
melos run test

# Run specific package tests
cd packages/ui_controls_button
flutter test

# Run with coverage
melos run test:coverage
```

### Test Coverage
- **Unit Tests**: All component logic tested
- **Widget Tests**: All UI components tested
- **Integration Tests**: End-to-end user flows tested
- **Accessibility Tests**: Screen reader and keyboard navigation tested
- **Golden Tests**: Visual regression testing

## 📚 Documentation

### Package Documentation
- **ui_tokens**: [README](packages/ui_tokens/README.md)
- **ui_core**: [README](packages/ui_core/README.md)
- **ui_controls_button**: [README](packages/ui_controls_button/README.md)
- **ui_controls_text_field**: [README](packages/ui_controls_text_field/README.md)
- **ui_controls_card**: [README](packages/ui_controls_card/README.md)
- **ui_showcase**: [README](packages/ui_showcase/README.md)

### API Documentation
- **Complete API Reference**: All classes, methods, and properties documented
- **Usage Examples**: Real-world usage examples for all components
- **Migration Guides**: Migration from stock Flutter widgets
- **Best Practices**: Guidelines for using the library effectively

## 🚀 Getting Started

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

### Development Setup

1. **Fork the repository**
2. **Create a feature branch**
3. **Make your changes**
4. **Run tests and linting**
5. **Submit a pull request**

## 🤝 Contributing

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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

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