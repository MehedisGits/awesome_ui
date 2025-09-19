import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class InteractivePlaygroundScreen extends StatefulWidget {
  const InteractivePlaygroundScreen({super.key});

  @override
  State<InteractivePlaygroundScreen> createState() => _InteractivePlaygroundScreenState();
}

class _InteractivePlaygroundScreenState extends State<InteractivePlaygroundScreen> {
  bool _isLoading = false;
  double _sliderValue = 0.5;
  bool _switchValue = false;
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Interactive Playground',
              variant: AuiTextVariant.headlineLarge,
            ),
            const SizedBox(height: 24),
            
            // Button Playground
            _buildButtonPlayground(),
            
            const SizedBox(height: 32),
            
            // Input Playground
            _buildInputPlayground(),
            
            const SizedBox(height: 32),
            
            // Animation Playground
            _buildAnimationPlayground(),
            
            const SizedBox(height: 32),
            
            // Micro-interactions Playground
            _buildMicroInteractionsPlayground(),
          ],
        ),
    );
  }

  Widget _buildButtonPlayground() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Button Playground',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: _isLoading ? null : () {
                    setState(() {
                      _isLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 2), () {
                      if (mounted) {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    });
                  },
                  loading: _isLoading,
                  child: const AuiText('Loading Button'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Large Button'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Small Button'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiIcon(Icons.favorite),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiIcon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputPlayground() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Input Playground',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Text Field',
                hintText: 'Enter some text',
              ),
              onChanged: (value) {
                // Handle text field change
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                AuiCheckbox(
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const AuiText('Checkbox'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                AuiSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const AuiText('Switch'),
              ],
            ),
            const SizedBox(height: 16),
            AuiText('Slider Value: ${_sliderValue.toStringAsFixed(2)}'),
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimationPlayground() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Animation Playground',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const AuiIcon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const AuiIcon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const AuiIcon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMicroInteractionsPlayground() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Micro-interactions Playground',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {},
                  child: const AuiText('Hover Effect'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Press Effect'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Scale Effect'),
                ),
                AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Glow Effect'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
