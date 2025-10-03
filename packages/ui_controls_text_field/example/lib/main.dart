import 'package:flutter/material.dart';
import 'package:ui_controls_text_field/ui_controls_text_field.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';

void main() {
  runApp(const AppTextFieldExample());
}

class AppTextFieldExample extends StatelessWidget {
  const AppTextFieldExample({super.key});

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
        title: 'AppTextField Example',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: AppColors.light.toColorScheme(),
        ),
        home: const TextFieldShowcase(),
      ),
    );
  }
}

class TextFieldShowcase extends StatefulWidget {
  const TextFieldShowcase({super.key});

  @override
  State<TextFieldShowcase> createState() => _TextFieldShowcaseState();
}

class _TextFieldShowcaseState extends State<TextFieldShowcase> {
  final TextEditingController _controller = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppTextField Showcase'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Text Field Variants',
              [
                _buildTextFieldColumn([
                  AppTextField(
                    labelText: 'Filled Text Field',
                    hintText: 'Enter text here',
                    variant: TextFieldVariant.filled,
                  ),
                  AppTextField(
                    labelText: 'Outlined Text Field',
                    hintText: 'Enter text here',
                    variant: TextFieldVariant.outlined,
                  ),
                  AppTextField(
                    labelText: 'Underlined Text Field',
                    hintText: 'Enter text here',
                    variant: TextFieldVariant.underlined,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Text Field Sizes',
              [
                _buildTextFieldColumn([
                  AppTextField(
                    labelText: 'Small Text Field',
                    hintText: 'Small size',
                    size: TextFieldSize.sm,
                  ),
                  AppTextField(
                    labelText: 'Medium Text Field',
                    hintText: 'Medium size',
                    size: TextFieldSize.md,
                  ),
                  AppTextField(
                    labelText: 'Large Text Field',
                    hintText: 'Large size',
                    size: TextFieldSize.lg,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Text Field States',
              [
                _buildTextFieldColumn([
                  AppTextField(
                    labelText: 'Normal Text Field',
                    hintText: 'Normal state',
                  ),
                  AppTextField(
                    labelText: 'Error Text Field',
                    hintText: 'Error state',
                    errorText: 'This field has an error',
                  ),
                  AppTextField(
                    labelText: 'Disabled Text Field',
                    hintText: 'Disabled state',
                    enabled: false,
                  ),
                  AppTextField(
                    labelText: 'Read Only Text Field',
                    hintText: 'Read only state',
                    readOnly: true,
                    controller: TextEditingController(text: 'Read only text'),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Input Types',
              [
                _buildTextFieldColumn([
                  AppTextField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    inputType: TextFieldInputType.email,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  AppTextField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    inputType: TextFieldInputType.password,
                    obscureText: _obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  AppTextField(
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    inputType: TextFieldInputType.phone,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  AppTextField(
                    labelText: 'Website URL',
                    hintText: 'Enter website URL',
                    inputType: TextFieldInputType.url,
                    prefixIcon: const Icon(Icons.link),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'With Helper Text',
              [
                _buildTextFieldColumn([
                  AppTextField(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    helperText: 'Choose a unique username',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  AppTextField(
                    labelText: 'Bio',
                    hintText: 'Tell us about yourself',
                    helperText: 'Optional: Write a short bio',
                    maxLines: 3,
                    prefixIcon: const Icon(Icons.description),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'With Prefix/Suffix Text',
              [
                _buildTextFieldColumn([
                  AppTextField(
                    labelText: 'Price',
                    hintText: '0.00',
                    prefixText: '\$',
                    suffixText: 'USD',
                  ),
                  AppTextField(
                    labelText: 'Website',
                    hintText: 'example',
                    prefixText: 'https://',
                    suffixText: '.com',
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildTextFieldColumn(List<AppTextField> textFields) {
    return Column(
      children: textFields
          .map((textField) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: textField,
              ))
          .toList(),
    );
  }
}
