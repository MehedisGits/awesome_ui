import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class AnimationDemoScreen extends StatefulWidget {
  const AnimationDemoScreen({super.key});

  @override
  State<AnimationDemoScreen> createState() => _AnimationDemoScreenState();
}

class _AnimationDemoScreenState extends State<AnimationDemoScreen> {
  bool _showAnimations = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Animation Demo',
              variant: AuiTextVariant.headlineLarge,
            ),
            const SizedBox(height: 24),
            
            // Animation Controls
            _buildAnimationControls(),
            
            const SizedBox(height: 32),
            
            // Micro-interactions
            _buildMicroInteractions(),
            
            const SizedBox(height: 32),
            
            // Page Transitions
            _buildPageTransitions(),
            
            const SizedBox(height: 32),
            
            // Gesture Animations
            _buildGestureAnimations(),
            
            const SizedBox(height: 32),
            
            // Animation Types
            _buildAnimationTypes(),
          ],
        ),
    );
  }

  Widget _buildAnimationControls() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Animation Controls',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                AuiSwitch(
                  value: _showAnimations,
                  onChanged: (value) {
                    setState(() {
                      _showAnimations = value;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const AuiText('Enable Animations'),
              ],
            ),
            const SizedBox(height: 16),
            AuiText(
              'Reduce Motion: ${AuiAccessibilityUtils.isReduceMotion(context) ? 'Enabled' : 'Disabled'}',
              variant: AuiTextVariant.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMicroInteractions() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Micro-interactions',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiMicroInteraction(
                  config: const AuiMicroInteractionConfig(
                    type: AuiMicroInteractionType.hover,
                    triggerOnHover: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    child: const AuiText('Hover'),
                  ),
                ),
                AuiMicroInteraction(
                  config: const AuiMicroInteractionConfig(
                    type: AuiMicroInteractionType.press,
                    triggerOnPress: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Press'),
                  ),
                ),
                AuiMicroInteraction(
                  config: const AuiMicroInteractionConfig(
                    type: AuiMicroInteractionType.scale,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Scale'),
                  ),
                ),
                AuiMicroInteraction(
                  config: const AuiMicroInteractionConfig(
                    type: AuiMicroInteractionType.glow,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Glow'),
                  ),
                ),
                AuiMicroInteraction(
                  config: const AuiMicroInteractionConfig(
                    type: AuiMicroInteractionType.ripple,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Ripple'),
                  ),
                ),
                AuiMicroInteraction(
                  config: const AuiMicroInteractionConfig(
                    type: AuiMicroInteractionType.bounce,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Bounce'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageTransitions() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Page Transitions',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const _DemoPage(title: 'Slide Transition'),
                      ),
                    );
                  },
                  child: const AuiText('Slide'),
                ),
                AuiButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const _DemoPage(title: 'Fade Transition'),
                      ),
                    );
                  },
                  child: const AuiText('Fade'),
                ),
                AuiButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const _DemoPage(title: 'Scale Transition'),
                      ),
                    );
                  },
                  child: const AuiText('Scale'),
                ),
                AuiButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const _DemoPage(title: 'Rotation Transition'),
                      ),
                    );
                  },
                  child: const AuiText('Rotation'),
                ),
                AuiButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const _DemoPage(title: 'Flip Transition'),
                      ),
                    );
                  },
                  child: const AuiText('Flip'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGestureAnimations() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Gesture Animations',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiGestureAnimation(
                  config: const AuiGestureAnimationConfig(
                    type: AuiGestureAnimationType.tap,
                    triggerOnTap: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    child: const AuiText('Tap'),
                  ),
                ),
                AuiGestureAnimation(
                  config: const AuiGestureAnimationConfig(
                    type: AuiGestureAnimationType.longPress,
                    triggerOnLongPress: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Long Press'),
                  ),
                ),
                AuiGestureAnimation(
                  config: const AuiGestureAnimationConfig(
                    type: AuiGestureAnimationType.doubleTap,
                    triggerOnDoubleTap: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Double Tap'),
                  ),
                ),
                AuiGestureAnimation(
                  config: const AuiGestureAnimationConfig(
                    type: AuiGestureAnimationType.pan,
                    triggerOnPan: true,
                  ),
                  child: AuiButton(
                    onPressed: () {},
                    variant: AuiButtonVariant.outline,
                    child: const AuiText('Pan'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimationTypes() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Animation Types',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiAnimation(
                  config: const AuiAnimationConfig(
                    type: AuiAnimationType.fade,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AuiIcon(Icons.favorite, color: Colors.white),
                  ),
                ),
                AuiAnimation(
                  config: const AuiAnimationConfig(
                    type: AuiAnimationType.scale,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AuiIcon(Icons.star, color: Colors.white),
                  ),
                ),
                AuiAnimation(
                  config: const AuiAnimationConfig(
                    type: AuiAnimationType.rotate,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AuiIcon(Icons.refresh, color: Colors.white),
                  ),
                ),
                AuiAnimation(
                  config: const AuiAnimationConfig(
                    type: AuiAnimationType.bounce,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AuiIcon(Icons.play_arrow, color: Colors.white),
                  ),
                ),
                AuiAnimation(
                  config: const AuiAnimationConfig(
                    type: AuiAnimationType.pulse,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AuiIcon(Icons.radio, color: Colors.white),
                  ),
                ),
                AuiAnimation(
                  config: const AuiAnimationConfig(
                    type: AuiAnimationType.shake,
                    autoTrigger: true,
                    repeat: true,
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AuiIcon(Icons.warning, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoPage extends StatelessWidget {
  const _DemoPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuiText(title),
      ),
      body: Center(
        child: AuiText(
          'This is a demo page with $title',
          variant: AuiTextVariant.headlineMedium,
        ),
      ),
    );
  }
}
