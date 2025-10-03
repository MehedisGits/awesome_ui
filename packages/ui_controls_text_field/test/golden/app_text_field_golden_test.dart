import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  group('AppTextField Golden Tests', () {
    testWidgets('text field variants', (WidgetTester tester) async {
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
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Standard Field',
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'With Helper Text',
                        helperText: 'This is helper text',
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'With Error',
                        errorText: 'This field has an error',
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'With Prefix',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'With Suffix',
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('text_field_variants.png'),
      );
    });

    testWidgets('text field sizes', (WidgetTester tester) async {
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
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Small Field',
                      ),
                      size: TextFieldSize.sm,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Medium Field',
                      ),
                      size: TextFieldSize.md,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Large Field',
                      ),
                      size: TextFieldSize.lg,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('text_field_sizes.png'),
      );
    });

    testWidgets('text field input types', (WidgetTester tester) async {
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
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Text Input',
                      ),
                      inputType: TextFieldInputType.text,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Email Input',
                      ),
                      inputType: TextFieldInputType.email,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Password Input',
                      ),
                      inputType: TextFieldInputType.password,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Number Input',
                      ),
                      inputType: TextFieldInputType.number,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Input',
                      ),
                      inputType: TextFieldInputType.phone,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('text_field_input_types.png'),
      );
    });

    testWidgets('text field states', (WidgetTester tester) async {
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
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Normal Field',
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Focused Field',
                      ),
                      autofocus: true,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Disabled Field',
                      ),
                      enabled: false,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Required Field',
                      ),
                      // isRequired: true, // Not available in current Flutter version
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('text_field_states.png'),
      );
    });

    testWidgets('text field responsive', (WidgetTester tester) async {
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
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth < 600 ? double.infinity : 300,
                          child: AppTextField(
                            decoration: const InputDecoration(
                              labelText: 'Responsive Field',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth < 600 ? double.infinity : 300,
                          child: AppTextField(
                            decoration: const InputDecoration(
                              labelText: 'Another Field',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('text_field_responsive.png'),
      );
    });

    testWidgets('text field accessibility', (WidgetTester tester) async {
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
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Accessible Field',
                        helperText: 'This field is accessible',
                      ),
                      semanticLabel: 'Accessible text input field',
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      decoration: const InputDecoration(
                        labelText: 'Required Field',
                        helperText: 'This field is required',
                      ),
                      // isRequired: true, // Not available in current Flutter version
                      semanticLabel: 'Required text input field',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('text_field_accessibility.png'),
      );
    });
  });
}
