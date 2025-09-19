# Contributing to awesome_ui

Thank you for your interest in contributing to awesome_ui! This document provides guidelines and information for contributors.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Release Process](#release-process)

## Code of Conduct

This project follows the [Contributor Covenant](https://www.contributor-covenant.org/) Code of Conduct. By participating, you are expected to uphold this code.

## Getting Started

### Prerequisites

- Flutter SDK (3.24.0 or higher)
- Dart SDK (3.8.1 or higher)
- Git
- IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Setting Up the Development Environment

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/MehedisGits/awesome_ui.git
   cd awesome_ui
   ```

3. Add the upstream remote:
   ```bash
   git remote add upstream https://github.com/MehedisGits/awesome_ui.git
   ```

4. Install dependencies:
   ```bash
   flutter pub get
   ```

5. Run the example app:
   ```bash
   cd example
   flutter run
   ```

## Development Workflow

### Branch Strategy

We use Git Flow with the following branches:

- `main` - Production-ready code
- `develop` - Integration branch for features
- `feature/component-name` - New features
- `bugfix/issue-description` - Bug fixes
- `hotfix/critical-fix` - Urgent fixes
- `release/v1.0.0` - Release preparation

### Creating a Feature

1. Create a feature branch from `develop`:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-component-name
   ```

2. Make your changes following the coding standards
3. Write tests for your changes
4. Update documentation if needed
5. Commit your changes using conventional commits
6. Push your branch and create a pull request

## Coding Standards

### File Structure

Follow the atomic design principles:

```
lib/
├── foundation/          # Design system foundation
├── atoms/              # Basic building blocks
├── molecules/          # Simple combinations of atoms
├── organisms/          # Complex UI components
├── templates/          # Page-level templates
└── screens/           # Example screens
```

### Naming Conventions

- **Files**: Use snake_case (e.g., `button_variants.dart`)
- **Classes**: Use PascalCase with `Aui` prefix (e.g., `AuiButton`)
- **Variables**: Use camelCase (e.g., `buttonColor`)
- **Constants**: Use SCREAMING_SNAKE_CASE (e.g., `DEFAULT_PADDING`)

### Code Style

- Follow Dart/Flutter conventions
- Use meaningful variable and function names
- Add comprehensive documentation
- Keep functions small and focused
- Use const constructors where possible

### Documentation

- Add dartdoc comments for all public APIs
- Include usage examples
- Document parameters and return values
- Add deprecation notices when needed

## Commit Guidelines

We use [Conventional Commits](https://www.conventionalcommits.org/) for consistent commit messages.

### Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `perf`: Performance improvements
- `ci`: CI/CD changes
- `build`: Build system changes

### Scopes

- `atoms`: Atomic components
- `molecules`: Molecular components
- `organisms`: Organism components
- `foundation`: Foundation system
- `navigation`: Navigation components
- `feedback`: Feedback components
- `layout`: Layout components
- `data-display`: Data display components
- `responsive`: Responsive utilities
- `animation`: Animation components
- `accessibility`: Accessibility features
- `docs`: Documentation
- `ci`: CI/CD
- `build`: Build system
- `deps`: Dependencies

### Examples

```bash
feat(atoms): add button variants (outlined, text, icon)
fix(navigation): resolve bottom nav overflow issue
docs(readme): update installation instructions
style(buttons): format button component code
refactor(foundation): extract color constants
test(atoms): add button component tests
chore(deps): update flutter dependencies
```

## Pull Request Process

### Before Submitting

1. Ensure your code follows the coding standards
2. Run tests and ensure they pass:
   ```bash
   flutter test
   flutter analyze
   ```
3. Update documentation if needed
4. Add tests for new functionality
5. Update CHANGELOG.md if applicable

### Pull Request Template

When creating a PR, include:

- **Description**: What changes were made and why
- **Type**: feat, fix, docs, style, refactor, test, chore
- **Breaking Changes**: List any breaking changes
- **Testing**: How the changes were tested
- **Screenshots**: For UI changes
- **Checklist**: Ensure all items are completed

### Review Process

1. All PRs require at least one review
2. Maintainers will review code quality, tests, and documentation
3. Address feedback promptly
4. Keep PRs focused and reasonably sized
5. Update PRs with latest changes from main/develop

## Release Process

### Versioning

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Steps

1. Update version in `pubspec.yaml`
2. Update `CHANGELOG.md`
3. Create release branch: `release/v1.0.0`
4. Run release script: `./scripts/release.sh`
5. Merge to main and develop
6. Create GitHub release

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/atoms/button_test.dart
```

### Test Coverage

- Aim for 90%+ test coverage
- Test all public APIs
- Include widget tests for UI components
- Add integration tests for complex workflows

## Questions?

If you have questions about contributing, please:

1. Check existing issues and discussions
2. Create a new issue with the `question` label
3. Join our community discussions

Thank you for contributing to awesome_ui! 🎉
