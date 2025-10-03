# Contributing to Awesome UI

Thank you for your interest in contributing to Awesome UI! This document provides guidelines and information for contributors.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)
- Git
- IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Development Setup

1. **Fork the repository**
   ```bash
   git clone https://github.com/your-username/awesome_ui.git
   cd awesome_ui
   ```

2. **Install dependencies**
   ```bash
   melos bootstrap
   ```

3. **Run tests**
   ```bash
   melos run test
   ```

4. **Run the showcase**
   ```bash
   cd packages/ui_showcase
   flutter run
   ```

## 📋 Contribution Guidelines

### Code Style

#### Dart Style
- Follow the [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use `dart format` to format code
- Use `dart analyze` to check for issues

#### Flutter Style
- Follow the [Flutter style guide](https://docs.flutter.dev/development/tools/formatting)
- Use `flutter analyze` to check for issues
- Use `flutter test` to run tests

#### Accessibility Style
- Follow [WCAG 2.1 guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- Ensure all interactive elements meet 48dp minimum touch target
- Include semantic labels for screen readers
- Test with screen readers and keyboard navigation

### Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/) format:

```
type(scope): description

[optional body]

[optional footer]
```

#### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Test changes
- `chore`: Build process or auxiliary tool changes

#### Examples
```
feat(button): add loading state to AppButton
fix(textfield): resolve focus issue on mobile
docs(readme): update installation instructions
test(button): add accessibility tests
```

### Pull Request Process

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Write code following the style guidelines
   - Add tests for new functionality
   - Update documentation if needed

3. **Run tests and linting**
   ```bash
   melos run test
   melos run lint
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat(component): add new feature"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a pull request**
   - Use the pull request template
   - Provide a clear description
   - Link any related issues

## 🧪 Testing

### Test Requirements

All new code must include:

- **Unit Tests**: Test individual functions and methods
- **Widget Tests**: Test UI components
- **Accessibility Tests**: Test accessibility features
- **Integration Tests**: Test complete user flows

### Running Tests

```bash
# Run all tests
melos run test

# Run specific package tests
cd packages/ui_controls_button
flutter test

# Run with coverage
melos run test:coverage

# Run golden tests
melos run test:golden
```

### Test Coverage

- **Minimum Coverage**: 80% for new code
- **Critical Paths**: 100% coverage for critical functionality
- **Accessibility**: 100% coverage for accessibility features

### Writing Tests

#### Unit Tests
```dart
test('should return correct color for primary variant', () {
  final button = AppButton(
    variant: AppButtonVariant.primary,
    child: Text('Test'),
  );
  
  expect(button.variant, AppButtonVariant.primary);
});
```

#### Widget Tests
```dart
testWidgets('should render button with child', (WidgetTester tester) async {
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

#### Accessibility Tests
```dart
testWidgets('should have correct semantic properties', (WidgetTester tester) async {
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

## 📚 Documentation

### Documentation Requirements

All new features must include:

- **API Documentation**: Complete API documentation
- **Usage Examples**: Real-world usage examples
- **Migration Guides**: Migration from stock Flutter widgets
- **Accessibility Notes**: Accessibility considerations

### Writing Documentation

#### API Documentation
```dart
/// Cross-platform button component for the Awesome UI library.
/// 
/// Provides a unified button API that adapts to different platforms
/// (Material 3, Cupertino, Web) while maintaining consistent behavior
/// and accessibility across all platforms.
class AppButton extends StatefulWidget {
  /// The widget to display inside the button
  final Widget child;
  
  /// Callback when the button is pressed
  final VoidCallback? onPressed;
  
  /// The visual style variant of the button
  final AppButtonVariant variant;
}
```

#### Usage Examples
```dart
// Basic usage
AppButton(
  onPressed: () {},
  child: Text('Click me'),
)

// With variant
AppButton(
  onPressed: () {},
  variant: AppButtonVariant.secondary,
  child: Text('Secondary'),
)

// With size
AppButton(
  onPressed: () {},
  size: AppButtonSize.lg,
  child: Text('Large'),
)
```

#### Migration Guides
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

## 🎨 Design Guidelines

### Component Design

#### Consistency
- Follow established patterns
- Use design tokens consistently
- Maintain visual hierarchy

#### Accessibility
- Ensure 48dp minimum touch targets
- Provide semantic labels
- Support keyboard navigation
- Test with screen readers

#### Responsiveness
- Adapt to different screen sizes
- Use responsive breakpoints
- Test on multiple devices

### Design Tokens

#### Colors
- Use semantic color names
- Support light/dark modes
- Include high contrast support

#### Typography
- Use consistent type scale
- Support responsive sizing
- Ensure readability

#### Spacing
- Use consistent spacing scale
- Support responsive spacing
- Maintain visual rhythm

## 🔧 Development Tools

### Required Tools

- **Flutter SDK**: Latest stable version
- **Dart SDK**: Latest stable version
- **Melos**: Monorepo management
- **VS Code**: Recommended IDE
- **Flutter Inspector**: Widget debugging

### Recommended Extensions

- **Dart**: Dart language support
- **Flutter**: Flutter support
- **GitLens**: Git integration
- **Error Lens**: Error highlighting
- **Bracket Pair Colorizer**: Code structure

### Code Quality Tools

- **dart format**: Code formatting
- **dart analyze**: Static analysis
- **flutter analyze**: Flutter analysis
- **flutter test**: Testing
- **flutter test --coverage**: Coverage

## 🐛 Bug Reports

### Before Reporting

1. **Check existing issues**
2. **Update to latest version**
3. **Test with minimal reproduction**
4. **Check documentation**

### Bug Report Template

```markdown
## Bug Description
Brief description of the bug

## Steps to Reproduce
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

## Expected Behavior
What you expected to happen

## Actual Behavior
What actually happened

## Environment
- Flutter version: [e.g. 3.10.0]
- Dart version: [e.g. 3.0.0]
- Platform: [e.g. iOS, Android, Web]
- Device: [e.g. iPhone 14, Pixel 7]

## Additional Context
Any other context about the problem
```

## 💡 Feature Requests

### Before Requesting

1. **Check existing features**
2. **Search existing issues**
3. **Consider alternatives**
4. **Think about implementation**

### Feature Request Template

```markdown
## Feature Description
Brief description of the feature

## Use Case
Why is this feature needed?

## Proposed Solution
How should this feature work?

## Alternatives Considered
What other solutions have you considered?

## Additional Context
Any other context about the feature request
```

## 🏷️ Release Process

### Versioning

We use [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Checklist

- [ ] All tests pass
- [ ] Documentation updated
- [ ] Changelog updated
- [ ] Version bumped
- [ ] Release notes written
- [ ] Tagged and released

## 📞 Support

### Getting Help

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and discussions
- **Discord**: Real-time chat and support
- **Email**: [support@awesomeui.dev](mailto:support@awesomeui.dev)

### Community Guidelines

- **Be respectful**: Treat everyone with respect
- **Be constructive**: Provide helpful feedback
- **Be patient**: Remember that everyone is learning
- **Be inclusive**: Welcome contributors from all backgrounds

## 📄 License

By contributing to Awesome UI, you agree that your contributions will be licensed under the MIT License.

## 🙏 Acknowledgments

Thank you to all contributors who help make Awesome UI better:

- **Core Team**: The main developers
- **Contributors**: Code contributors
- **Reviewers**: Code reviewers
- **Testers**: Bug testers and feedback providers
- **Documentation**: Documentation contributors
- **Community**: Users and supporters

---

**Made with ❤️ by the Awesome UI Team**