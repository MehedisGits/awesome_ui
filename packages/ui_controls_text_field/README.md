# UI Controls Text Field

Cross-platform text field component for the Awesome UI library. Provides a unified text input API that adapts to different platforms while maintaining consistent behavior and accessibility.

## 🚀 Features

- **Cross-Platform**: Material 3, Cupertino, and Web adapters
- **Input Types**: Text, email, password, number, phone, URL
- **Validation**: Built-in validation with error states
- **Accessibility**: WCAG AA/AAA compliant with semantic labels
- **Responsive**: Adapts to different screen sizes
- **Themeable**: Works with all brand themes

## 🚀 Quick Start

### Installation

```yaml
dependencies:
  ui_controls_text_field:
    path: ../ui_controls_text_field
  ui_tokens:
    path: ../ui_tokens
  ui_core:
    path: ../ui_core
```

### Basic Usage

```dart
import 'package:ui_controls_text_field/ui_controls_text_field.dart';

AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Enter your name',
  ),
)
```

## 🎨 Text Field Variants

### Standard Text Field
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Standard Field',
  ),
)
```

### With Helper Text
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Email',
    helperText: 'Enter your email address',
  ),
)
```

### With Error State
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Password',
    errorText: 'Password is required',
  ),
)
```

### With Prefix Icon
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Search',
    prefixIcon: Icon(Icons.search),
  ),
)
```

### With Suffix Icon
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Password',
    suffixIcon: Icon(Icons.visibility),
  ),
)
```

## 📏 Text Field Sizes

### Small
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Small Field',
  ),
  size: TextFieldSize.sm,
)
```

### Medium (Default)
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Medium Field',
  ),
  size: TextFieldSize.md,
)
```

### Large
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Large Field',
  ),
  size: TextFieldSize.lg,
)
```

## 🎯 Input Types

### Text
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Text Input',
  ),
  inputType: TextFieldInputType.text,
)
```

### Email
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Email',
  ),
  inputType: TextFieldInputType.email,
)
```

### Password
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Password',
  ),
  inputType: TextFieldInputType.password,
  obscureText: true,
)
```

### Number
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Age',
  ),
  inputType: TextFieldInputType.number,
)
```

### Phone
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Phone Number',
  ),
  inputType: TextFieldInputType.phone,
)
```

### URL
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Website',
  ),
  inputType: TextFieldInputType.url,
)
```

## ♿ Accessibility

### Semantic Labels
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Email',
  ),
  semanticLabel: 'Email address input field',
)
```

### Required Fields
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Required Field',
    helperText: 'This field is required',
  ),
  isRequired: true,
)
```

### Focus Management
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Focusable Field',
  ),
  focusNode: FocusNode(),
  autofocus: true,
)
```

## 📱 Responsive Design

### Responsive Sizes
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Responsive Field',
  ),
  size: TextFieldSize.md, // Automatically adapts to screen size
)
```

### Responsive Padding
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Responsive Padding',
  ),
  // Padding automatically adjusts based on screen size
)
```

## 🎨 Theming

### With Custom Colors
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Custom Colors',
  ),
  fillColor: Colors.blue.shade50,
  borderColor: Colors.blue,
)
```

### With Custom Border Radius
```dart
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Rounded Field',
  ),
  borderRadius: BorderRadius.circular(20),
)
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/app_text_field_test.dart

# Run with coverage
flutter test --coverage
```

## 📚 API Reference

### AppTextField

```dart
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.decoration,
    this.inputType = TextFieldInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.isRequired = false,
    this.maxLines = 1,
    this.maxLength,
    this.semanticLabel,
    this.focusNode,
    this.autofocus = false,
    this.size = TextFieldSize.md,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
  });
}
```

### TextFieldDecoration

```dart
class TextFieldDecoration {
  const TextFieldDecoration({
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.counterText,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
  });
}
```

### TextFieldInputType

```dart
enum TextFieldInputType {
  text,
  email,
  password,
  number,
  phone,
  url,
  multiline,
}
```

### TextFieldSize

```dart
enum TextFieldSize {
  sm,  // Small (40dp height)
  md,  // Medium (48dp height)
  lg,  // Large (56dp height)
}
```

## 🔄 Migration from Stock Flutter Widgets

### From TextField

```dart
// Before (TextField)
TextField(
  decoration: InputDecoration(
    labelText: 'Enter your name',
  ),
)

// After (AppTextField)
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Enter your name',
  ),
)
```

### From TextFormField

```dart
// Before (TextFormField)
TextFormField(
  decoration: InputDecoration(
    labelText: 'Email',
    errorText: 'Invalid email',
  ),
  validator: (value) => value?.isEmpty == true ? 'Required' : null,
)

// After (AppTextField)
AppTextField(
  decoration: const TextFieldDecoration(
    labelText: 'Email',
    errorText: 'Invalid email',
  ),
  isRequired: true,
)
```

### From CupertinoTextField

```dart
// Before (CupertinoTextField)
CupertinoTextField(
  placeholder: 'Enter your name',
)

// After (AppTextField)
AppTextField(
  decoration: const TextFieldDecoration(
    hintText: 'Enter your name',
  ),
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
