import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  group('AppTextField', () {
    testWidgets('renders with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: AppTextField(
                labelText: 'Test Label',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
    });

    testWidgets('renders with hint text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: AppTextField(
                hintText: 'Enter text here',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Enter text here'), findsOneWidget);
    });

    testWidgets('renders disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: AppTextField(
                labelText: 'Disabled Field',
                enabled: false,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Disabled Field'), findsOneWidget);
      // TextField should be disabled
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: AppTextField(
                labelText: 'Error Field',
                errorText: 'This field has an error',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Error Field'), findsOneWidget);
      expect(find.text('This field has an error'), findsOneWidget);
    });

    testWidgets('renders different variants', (WidgetTester tester) async {
      final variants = [
        TextFieldVariant.filled,
        TextFieldVariant.outlined,
        TextFieldVariant.underlined,
      ];

      for (final variant in variants) {
        await tester.pumpWidget(
          MaterialApp(
            home: AppStyleScope(
              platformStyle: PlatformStyle.material,
              colors: AppColors.light,
              typography: AppTypography.standard(),
              spacing: AppSpacing.standard(),
              radius: AppRadius.standard(),
              elevation: AppElevation.standard(),
              motion: AppMotion.standard(),
              child: Scaffold(
                body: AppTextField(
                  labelText: 'Test Field',
                  variant: variant,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Test Field'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('renders different sizes', (WidgetTester tester) async {
      final sizes = [
        TextFieldSize.sm,
        TextFieldSize.md,
        TextFieldSize.lg,
      ];

      for (final size in sizes) {
        await tester.pumpWidget(
          MaterialApp(
            home: AppStyleScope(
              platformStyle: PlatformStyle.material,
              colors: AppColors.light,
              typography: AppTypography.standard(),
              spacing: AppSpacing.standard(),
              radius: AppRadius.standard(),
              elevation: AppElevation.standard(),
              motion: AppMotion.standard(),
              child: Scaffold(
                body: AppTextField(
                  labelText: 'Test Field',
                  size: size,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Test Field'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('calls onChanged when text changes', (WidgetTester tester) async {
      String? changedText;
      
      await tester.pumpWidget(
        MaterialApp(
          home: AppStyleScope(
            platformStyle: PlatformStyle.material,
            colors: AppColors.light,
            typography: AppTypography.standard(),
            spacing: AppSpacing.standard(),
            radius: AppRadius.standard(),
            elevation: AppElevation.standard(),
            motion: AppMotion.standard(),
            child: Scaffold(
              body: AppTextField(
                labelText: 'Test Field',
                onChanged: (text) {
                  changedText = text;
                },
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Hello World');
      expect(changedText, equals('Hello World'));
    });
  });
}
