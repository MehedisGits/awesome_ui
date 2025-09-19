# awesome_ui

[![CI/CD Pipeline](https://github.com/MehedisGits/awesome_ui/workflows/CI/CD%20Pipeline/badge.svg)](https://github.com/MehedisGits/awesome_ui/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.24.0-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.8.1-blue.svg)](https://dart.dev/)

A comprehensive Flutter UI component library with 99% UI/UX coverage for SaaS, CRM, E-commerce, and more. Built with atomic design principles and modern Flutter best practices.

## ✨ Features

- 🎨 **Comprehensive Design System** - Colors, typography, spacing, elevation, and motion
- 🧩 **Atomic Design Components** - Atoms, molecules, organisms, and templates
- 📱 **Responsive Design** - Mobile-first approach with breakpoint utilities
- ♿ **Accessibility First** - WCAG 2.1 AA compliant components
- 🎭 **Animation Ready** - Micro-interactions and page transitions
- 🎯 **Production Ready** - Tested, documented, and optimized
- 📚 **Rich Documentation** - Comprehensive examples and API docs

## 🚀 Quick Start

### Installation

Add awesome_ui to your `pubspec.yaml`:

```yaml
dependencies:
  awesome_ui: ^1.0.0
```

### Basic Usage

```dart
import 'package:awesome_ui/awesome_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: AuiTheme.light,
      home: Scaffold(
        appBar: AuiAppBar(
          title: Text('My App'),
        ),
        body: AuiButton(
          text: 'Click me',
          onPressed: () {},
        ),
      ),
    );
  }
}
```

## 📦 Components

### Foundation
- **Colors** - Comprehensive color system with light/dark themes
- **Typography** - Consistent text styles and font scales
- **Spacing** - Standardized spacing system
- **Elevation** - Material Design elevation system
- **Motion** - Animation and transition utilities
- **Responsive** - Breakpoint system and responsive utilities

### Atoms
- **Buttons** - Primary, secondary, outlined, text, and icon buttons
- **Text** - Headings, body text, captions, and labels
- **Icons** - Icon system with custom and Material icons
- **Chips** - Filter, choice, and action chips
- **Progress** - Linear and circular progress indicators
- **Skeleton** - Loading placeholders
- **Divider** - Horizontal and vertical dividers
- **Tooltip** - Contextual help and information

### Molecules
- **Inputs** - Text fields, checkboxes, switches, and form controls
- **Cards** - Content cards and list tiles
- **Avatars** - User profile images and initials
- **Empty State** - No data and error states
- **Stat Tile** - Key metrics and statistics

### Navigation
- **App Bar** - Top navigation with actions and search
- **Bottom Navigation** - Tab-based navigation
- **Tabs** - Horizontal and vertical tab navigation
- **Breadcrumbs** - Navigation hierarchy

### Feedback
- **Dialogs** - Modal dialogs and confirmations
- **Bottom Sheets** - Slide-up panels and menus
- **Snackbars** - Toast notifications and messages

### Layout
- **Grid** - Responsive grid system
- **Masonry** - Pinterest-style layouts
- **Split View** - Master-detail layouts
- **Scaffold** - Safe area and layout scaffolding
- **Sticky Headers** - Fixed header content

### Data Display
- **Table** - Sortable and filterable data tables
- **Timeline** - Event and progress timelines
- **Tree View** - Hierarchical data display

## 🎨 Design System

awesome_ui follows atomic design principles and provides a comprehensive design system:

```dart
// Using the design system
AuiTheme.light  // Light theme
AuiTheme.dark   // Dark theme

// Custom colors
AuiColors.primary
AuiColors.secondary
AuiColors.surface
AuiColors.error

// Typography
AuiText.heading1('Welcome')
AuiText.body('This is body text')
AuiText.caption('Small text')

// Spacing
AuiSpacing.xs    // 4px
AuiSpacing.sm    // 8px
AuiSpacing.md    // 16px
AuiSpacing.lg    // 24px
AuiSpacing.xl    // 32px
```

## 📱 Responsive Design

Built-in responsive utilities for all screen sizes:

```dart
AuiResponsiveWrapper(
  mobile: MobileWidget(),
  tablet: TabletWidget(),
  desktop: DesktopWidget(),
)

// Or use breakpoint utilities
if (context.isMobile) {
  // Mobile-specific code
} else if (context.isTablet) {
  // Tablet-specific code
} else {
  // Desktop-specific code
}
```

## ♿ Accessibility

All components are built with accessibility in mind:

- Screen reader support
- Keyboard navigation
- High contrast support
- Focus management
- Semantic labels

## 🎭 Animations

Smooth animations and micro-interactions:

```dart
AuiButton(
  text: 'Animated Button',
  animation: AuiButtonAnimation.bounce,
  onPressed: () {},
)

// Page transitions
Navigator.push(
  context,
  AuiPageRoute.slideToLeft(SecondPage()),
)
```

## 📚 Documentation

- [Component Gallery](https://github.com/MehedisGits/awesome_ui/tree/main/example) - Interactive examples
- [API Documentation](https://pub.dev/documentation/awesome_ui/latest/) - Complete API reference
- [Design Guidelines](https://github.com/MehedisGits/awesome_ui/wiki/Design-Guidelines) - Design system documentation
- [Migration Guide](https://github.com/MehedisGits/awesome_ui/wiki/Migration-Guide) - Upgrading between versions

## 🧪 Testing

Run the test suite:

```bash
flutter test
```

Run with coverage:

```bash
flutter test --coverage
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'feat: add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for design inspiration
- Community contributors and maintainers
- All the developers who use awesome_ui

## 📞 Support

- 📧 Email: [your-email@example.com]
- 💬 Discussions: [GitHub Discussions](https://github.com/MehedisGits/awesome_ui/discussions)
- 🐛 Issues: [GitHub Issues](https://github.com/MehedisGits/awesome_ui/issues)
- 📖 Wiki: [Project Wiki](https://github.com/MehedisGits/awesome_ui/wiki)

---

Made with ❤️ by the awesome_ui team
