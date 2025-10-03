import 'package:flutter/material.dart';
import 'package:ui_tokens/ui_tokens.dart';
import 'package:ui_core/ui_core.dart';
import 'screens/component_gallery.dart';

void main() {
  runApp(const AwesomeUIShowcase());
}

class AwesomeUIShowcase extends StatelessWidget {
  const AwesomeUIShowcase({super.key});

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
        title: 'Awesome UI Showcase',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: AppColors.light.toColorScheme(),
        ),
        home: const ComponentGallery(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
