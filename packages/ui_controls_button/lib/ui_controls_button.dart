/// Cross-platform button component for the Awesome UI library.
/// 
/// Provides a unified button API that adapts to different platforms
/// (Material 3, Cupertino, Web) while maintaining consistent behavior
/// and accessibility across all platforms.
library ui_controls_button;

export 'src/button_variants.dart';
export 'src/button_sizes.dart';
export 'src/button_states.dart';
export 'src/app_button.dart' hide ButtonVariant, ButtonSize, ButtonState, ButtonIconPosition;
