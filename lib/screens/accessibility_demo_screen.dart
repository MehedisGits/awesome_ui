import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class AccessibilityDemoScreen extends StatefulWidget {
  const AccessibilityDemoScreen({super.key});

  @override
  State<AccessibilityDemoScreen> createState() => _AccessibilityDemoScreenState();
}

class _AccessibilityDemoScreenState extends State<AccessibilityDemoScreen> {
  bool _isHighContrast = false;
  bool _isScreenReaderEnabled = false;
  double _textScaleFactor = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkAccessibilitySettings();
  }

  void _checkAccessibilitySettings() {
    final mediaQuery = MediaQuery.of(context);
    _textScaleFactor = mediaQuery.textScaler.scale(1.0);
    _isHighContrast = mediaQuery.highContrast;
    _isScreenReaderEnabled = mediaQuery.accessibleNavigation;
  }

  @override
  Widget build(BuildContext context) {
    return AuiAccessibilitySemantics(
      label: 'Accessibility Demo Screen',
      hint: 'This screen demonstrates various accessibility features and tools',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuiText(
              'Accessibility Demo',
              variant: AuiTextVariant.headlineLarge,
              semanticsLabel: 'Accessibility Demo Screen Title',
            ),
            const SizedBox(height: 24),
            
            // Accessibility Status
            _buildAccessibilityStatus(),
            
            const SizedBox(height: 32),
            
            // Contrast Demo
            _buildContrastDemo(),
            
            const SizedBox(height: 32),
            
            // Semantics Demo
            _buildSemanticsDemo(),
            
            const SizedBox(height: 32),
            
            // Focus Management Demo
            _buildFocusDemo(),
            
            const SizedBox(height: 32),
            
            // Screen Reader Demo
            _buildScreenReaderDemo(),
            
            const SizedBox(height: 32),
            
            // Accessibility Controls
            _buildAccessibilityControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccessibilityStatus() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Accessibility Status',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildStatusItem(
              'High Contrast',
              AuiAccessibilityUtils.isHighContrast(context),
            ),
            _buildStatusItem(
              'Bold Text',
              AuiAccessibilityUtils.isBoldText(context),
            ),
            _buildStatusItem(
              'Reduce Motion',
              AuiAccessibilityUtils.isReduceMotion(context),
            ),
            _buildStatusItem(
              'Invert Colors',
              AuiAccessibilityUtils.isInvertColors(context),
            ),
            _buildStatusItem(
              'On/Off Switch Labels',
              AuiAccessibilityUtils.isOnOffSwitchLabels(context),
            ),
            const SizedBox(height: 8),
            AuiText(
              'Text Scale: ${AuiAccessibilityUtils.getTextScaleFactor(context).toStringAsFixed(1)}x',
              variant: AuiTextVariant.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String label, bool enabled) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          AuiIcon(
            enabled ? Icons.check_circle : Icons.cancel,
            color: enabled ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          AuiText(
            '$label: ${enabled ? 'Enabled' : 'Disabled'}',
            variant: AuiTextVariant.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildContrastDemo() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Contrast Checker',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuiText('Foreground Color'),
                      const SizedBox(height: 8),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: const AuiText(
                            'Sample Text',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuiText('Background Color'),
                      const SizedBox(height: 8),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        child: const Center(
                          child: AuiText('Sample Text'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AuiText('Contrast Debugger Placeholder'),
          ],
        ),
      ),
    );
  }

  Widget _buildSemanticsDemo() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Semantics Demo',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            AuiAccessibilitySemantics(
              label: 'This is a button with accessibility label',
              hint: 'Double tap to activate',
              button: true,
              child: AuiButton(
                onPressed: () {
                  AuiAccessibilityUtils.announce(context, 'Button pressed');
                },
                child: const AuiText('Accessible Button'),
              ),
            ),
            const SizedBox(height: 16),
            AuiAccessibilitySemantics(
              label: 'This is a card with accessibility information',
              header: true,
              child: AuiCard(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuiText(
                        'Card Title',
                        variant: AuiTextVariant.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      const AuiText(
                        'This card has proper semantic markup for screen readers.',
                        variant: AuiTextVariant.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFocusDemo() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Focus Management',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            AuiAccessibilityFocus(
              autoFocus: true,
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  AuiAccessibilityUtils.announce(context, 'Button focused');
                }
              },
              child: AuiButton(
                onPressed: () {},
                child: const AuiText('Auto Focus Button'),
              ),
            ),
            const SizedBox(height: 16),
            AuiAccessibilityFocus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  AuiAccessibilityUtils.announce(context, 'Second button focused');
                }
              },
              child:                 AuiButton(
                  onPressed: () {},
                  variant: AuiButtonVariant.outline,
                  child: const AuiText('Focus Button'),
                ),
            ),
            const SizedBox(height: 16),
            AuiAccessibilityFocus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  AuiAccessibilityUtils.announce(context, 'Third button focused');
                }
              },
              child: AuiButton(
                onPressed: () {},
                variant: AuiButtonVariant.outline,
                child: const AuiText('Outline Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenReaderDemo() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Screen Reader Demo',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            AuiAccessibilityAnnouncer(
              announcement: 'This is a live announcement for screen readers',
              child: AuiButton(
                onPressed: () {
                  AuiAccessibilityUtils.announce(
                    context,
                    'Button pressed! This is a screen reader announcement.',
                  );
                },
                child: const AuiText('Make Announcement'),
              ),
            ),
            const SizedBox(height: 16),
            AuiAccessibilitySemantics(
              label: 'Progress indicator showing 75% completion',
              child: AuiProgress(
                value: 0.75,
                variant: AuiProgressVariant.circular,
              ),
            ),
            const SizedBox(height: 16),
            AuiAccessibilitySemantics(
              label: 'Switch control for enabling notifications',
              toggled: false,
              child: Row(
                children: [
                  AuiSwitch(
                    value: false,
                    onChanged: (value) {
                      AuiAccessibilityUtils.announce(
                        context,
                        'Notifications ${value ? 'enabled' : 'disabled'}',
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  const AuiText('Enable Notifications'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccessibilityControls() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuiText(
              'Accessibility Controls',
              variant: AuiTextVariant.titleLarge,
              semanticsLabel: 'Accessibility Controls Section',
            ),
            const SizedBox(height: 16),
            
            // Text Scale Factor
            AuiAccessibilitySemantics(
              label: 'Current text scale factor: ${_textScaleFactor.toStringAsFixed(1)}',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuiText(
                    'Text Scale Factor: ${_textScaleFactor.toStringAsFixed(1)}',
                    variant: AuiTextVariant.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  AuiText(
                    'Adjust text size in system settings to see changes',
                    variant: AuiTextVariant.bodyMedium,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // High Contrast Status
            AuiAccessibilitySemantics(
              label: 'High contrast mode is ${_isHighContrast ? 'enabled' : 'disabled'}',
              child: Row(
                children: [
                  AuiIcon(
                    _isHighContrast ? Icons.visibility : Icons.visibility_off,
                    color: _isHighContrast 
                        ? Theme.of(context).colorScheme.primary 
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  AuiText(
                    'High Contrast: ${_isHighContrast ? 'Enabled' : 'Disabled'}',
                    variant: AuiTextVariant.titleMedium,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Screen Reader Status
            AuiAccessibilitySemantics(
              label: 'Screen reader is ${_isScreenReaderEnabled ? 'enabled' : 'disabled'}',
              child: Row(
                children: [
                  AuiIcon(
                    _isScreenReaderEnabled ? Icons.hearing : Icons.hearing_disabled,
                    color: _isScreenReaderEnabled 
                        ? Theme.of(context).colorScheme.primary 
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  AuiText(
                    'Screen Reader: ${_isScreenReaderEnabled ? 'Enabled' : 'Disabled'}',
                    variant: AuiTextVariant.titleMedium,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Accessibility Announcement
            AuiButton(
              onPressed: () {
                // Simple announcement using debug print
                debugPrint('Accessibility Announcement: Accessibility features are working correctly!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: AuiText('Accessibility announcement sent!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const AuiText('Test Announcement'),
            ),
          ],
        ),
      ),
    );
  }
}
