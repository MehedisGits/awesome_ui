import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ui_core/ui_core.dart';
import 'text_field_variants.dart';

/// Cross-platform text field component for the Awesome UI library.
/// 
/// Provides a unified text field API that adapts to different platforms
/// (Material 3, Cupertino, Web) while maintaining consistent behavior
/// and accessibility across all platforms.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    // this.selectionHeightStyle = BoxHeightStyle.tight, // Not available in current Flutter version
    // this.selectionWidthStyle = BoxWidthStyle.tight, // Not available in current Flutter version
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    // this.dragStartBehavior = DragStartBehavior.start, // Not available in current Flutter version
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    // this.mouseCursor, // Not available in current Flutter version
    // this.buildCounter, // Not available in current Flutter version
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
    // this.canRequestFocus = true, // Not available in current Flutter version
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    // Custom properties
    this.variant = TextFieldVariant.filled,
    this.size = TextFieldSize.md,
    this.state = TextFieldState.normal,
    this.inputType = TextFieldInputType.text,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixText,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense = false,
    this.isCollapsed = false,
    this.contentPadding,
    this.borderRadius,
    this.borderColor,
    this.focusColor,
    this.hoverColor,
    this.fillColor,
    this.errorColor,
    this.semanticLabel,
    this.semanticHint,
  });

  // Standard TextField properties
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  // final BoxHeightStyle selectionHeightStyle; // Not available in current Flutter version
  // final BoxWidthStyle selectionWidthStyle; // Not available in current Flutter version
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  // final DragStartBehavior dragStartBehavior; // Not available in current Flutter version
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  // final MouseCursor? mouseCursor; // Not available in current Flutter version
  // final InputCounterWidgetBuilder? buildCounter; // Not available in current Flutter version
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  // final bool canRequestFocus; // Not available in current Flutter version
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;

  // Custom properties
  final TextFieldVariant variant;
  final TextFieldSize size;
  final TextFieldState state;
  final TextFieldInputType inputType;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDense;
  final bool isCollapsed;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? fillColor;
  final Color? errorColor;
  final String? semanticLabel;
  final String? semanticHint;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with ComponentMixin, AccessibilityMixin {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentState = _determineTextFieldState();
    
    return _buildPlatformTextField(currentState);
  }

  /// Determine the current text field state
  TextFieldState _determineTextFieldState() {
    if (!widget.enabled) return TextFieldState.disabled;
    if (widget.readOnly) return TextFieldState.readOnly;
    if (widget.errorText != null) return TextFieldState.error;
    if (_isFocused) return TextFieldState.focused;
    return widget.state;
  }

  /// Build the platform-specific text field
  Widget _buildPlatformTextField(TextFieldState state) {
    switch (resolvedPlatformStyle) {
      case PlatformStyle.material:
        return _buildMaterialTextField(state);
      case PlatformStyle.cupertino:
        return _buildCupertinoTextField(state);
      case PlatformStyle.web:
        return _buildWebTextField(state);
      case PlatformStyle.adaptive:
        return _buildAdaptiveTextField(state);
    }
  }

  /// Build Material 3 text field
  Widget _buildMaterialTextField(TextFieldState state) {
    final inputDecoration = _createInputDecoration(state);

    return _wrapWithAccessibility(
      TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: inputDecoration,
        keyboardType: _getKeyboardType(),
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        style: widget.style,
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textDirection: widget.textDirection,
        readOnly: widget.readOnly,
        showCursor: widget.showCursor,
        autofocus: widget.autofocus,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        enableSuggestions: widget.enableSuggestions,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        cursorWidth: widget.cursorWidth,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius ?? const Radius.circular(2.0),
        cursorColor: widget.cursorColor,
        // selectionHeightStyle: widget.selectionHeightStyle, // Not available in current Flutter version
        // selectionWidthStyle: widget.selectionWidthStyle, // Not available in current Flutter version
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        // dragStartBehavior: widget.dragStartBehavior, // Not available in current Flutter version
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        // mouseCursor: widget.mouseCursor, // Not available in current Flutter version
        // buildCounter: widget.buildCounter, // Not available in current Flutter version
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        autofillHints: widget.autofillHints,
        clipBehavior: widget.clipBehavior,
        restorationId: widget.restorationId,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        contextMenuBuilder: widget.contextMenuBuilder,
        // canRequestFocus: widget.canRequestFocus, // Not available in current Flutter version
        spellCheckConfiguration: widget.spellCheckConfiguration,
        magnifierConfiguration: widget.magnifierConfiguration,
      ),
      state,
    );
  }

  /// Build Cupertino text field
  Widget _buildCupertinoTextField(TextFieldState state) {
    return _wrapWithAccessibility(
      CupertinoTextField(
        controller: _controller,
        focusNode: _focusNode,
        placeholder: widget.hintText,
        prefix: widget.prefixIcon,
        suffix: widget.suffixIcon,
        padding: widget.contentPadding ?? _getContentPadding(),
        decoration: BoxDecoration(
          color: _getBackgroundColor(state),
          borderRadius: widget.borderRadius ?? _getBorderRadius(),
          border: Border.all(
            color: _getBorderColor(state),
            width: _getBorderWidth(state),
          ),
        ),
        style: widget.style,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textDirection: widget.textDirection,
        readOnly: widget.readOnly,
        showCursor: widget.showCursor,
        autofocus: widget.autofocus,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        enableSuggestions: widget.enableSuggestions,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        cursorWidth: widget.cursorWidth,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius ?? const Radius.circular(2.0),
        cursorColor: widget.cursorColor,
        // selectionHeightStyle: widget.selectionHeightStyle, // Not available in current Flutter version
        // selectionWidthStyle: widget.selectionWidthStyle, // Not available in current Flutter version
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        // dragStartBehavior: widget.dragStartBehavior, // Not available in current Flutter version
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        // mouseCursor: widget.mouseCursor, // Not available in current Flutter version
        // buildCounter: widget.buildCounter, // Not available in current Flutter version
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        autofillHints: widget.autofillHints,
        clipBehavior: widget.clipBehavior,
        restorationId: widget.restorationId,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        contextMenuBuilder: widget.contextMenuBuilder,
        // canRequestFocus: widget.canRequestFocus, // Not available in current Flutter version
        spellCheckConfiguration: widget.spellCheckConfiguration,
        magnifierConfiguration: widget.magnifierConfiguration,
      ),
      state,
    );
  }

  /// Build Web-optimized text field
  Widget _buildWebTextField(TextFieldState state) {
    final inputDecoration = _createInputDecoration(state);

    return _wrapWithAccessibility(
      TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: inputDecoration,
        keyboardType: _getKeyboardType(),
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        style: widget.style,
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textDirection: widget.textDirection,
        readOnly: widget.readOnly,
        showCursor: widget.showCursor,
        autofocus: widget.autofocus,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        enableSuggestions: widget.enableSuggestions,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        cursorWidth: widget.cursorWidth,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius ?? const Radius.circular(2.0),
        cursorColor: widget.cursorColor,
        // selectionHeightStyle: widget.selectionHeightStyle, // Not available in current Flutter version
        // selectionWidthStyle: widget.selectionWidthStyle, // Not available in current Flutter version
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        // dragStartBehavior: widget.dragStartBehavior, // Not available in current Flutter version
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        // mouseCursor: widget.mouseCursor, // Not available in current Flutter version
        // buildCounter: widget.buildCounter, // Not available in current Flutter version
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        autofillHints: widget.autofillHints,
        clipBehavior: widget.clipBehavior,
        restorationId: widget.restorationId,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        contextMenuBuilder: widget.contextMenuBuilder,
        // canRequestFocus: widget.canRequestFocus, // Not available in current Flutter version
        spellCheckConfiguration: widget.spellCheckConfiguration,
        magnifierConfiguration: widget.magnifierConfiguration,
      ),
      state,
    );
  }

  /// Build adaptive text field (chooses platform automatically)
  Widget _buildAdaptiveTextField(TextFieldState state) {
    final currentStyle = PlatformStyleUtils.getCurrentPlatformStyle();
    switch (currentStyle) {
      case PlatformStyle.material:
        return _buildMaterialTextField(state);
      case PlatformStyle.cupertino:
        return _buildCupertinoTextField(state);
      case PlatformStyle.web:
        return _buildWebTextField(state);
      case PlatformStyle.adaptive:
        return _buildMaterialTextField(state); // Fallback
    }
  }

  /// Create input decoration for Material text field
  InputDecoration _createInputDecoration(TextFieldState state) {
    if (widget.decoration != null) {
      return widget.decoration!;
    }

    return InputDecoration(
      labelText: widget.labelText,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      prefixText: widget.prefixText,
      suffixText: widget.suffixText,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      isDense: widget.isDense,
      isCollapsed: widget.isCollapsed,
      contentPadding: widget.contentPadding ?? _getContentPadding(),
      filled: widget.variant == TextFieldVariant.filled,
      fillColor: widget.fillColor ?? _getBackgroundColor(state),
      border: _getBorder(state),
      focusedBorder: _getFocusedBorder(state),
      errorBorder: _getErrorBorder(state),
      disabledBorder: _getDisabledBorder(state),
      enabledBorder: _getEnabledBorder(state),
    );
  }

  /// Get the keyboard type based on input type
  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType!;
    }

    switch (widget.inputType) {
      case TextFieldInputType.text:
        return TextInputType.text;
      case TextFieldInputType.email:
        return TextInputType.emailAddress;
      case TextFieldInputType.password:
        return TextInputType.visiblePassword;
      case TextFieldInputType.number:
        return TextInputType.number;
      case TextFieldInputType.phone:
        return TextInputType.phone;
      case TextFieldInputType.url:
        return TextInputType.url;
      case TextFieldInputType.multiline:
        return TextInputType.multiline;
    }
  }

  /// Get background color for current state
  Color _getBackgroundColor(TextFieldState state) {
    if (state == TextFieldState.disabled) {
      return colors.surfaceVariant;
    }

    switch (widget.variant) {
      case TextFieldVariant.filled:
        return state == TextFieldState.focused
            ? colors.surface
            : colors.surfaceVariant;
      case TextFieldVariant.outlined:
        return colors.surface;
      case TextFieldVariant.underlined:
        return Colors.transparent;
    }
  }

  /// Get border color for current state
  Color _getBorderColor(TextFieldState state) {
    if (state == TextFieldState.disabled) {
      return colors.outlineVariant;
    }

    switch (state) {
      case TextFieldState.error:
        return colors.error;
      case TextFieldState.focused:
        return colors.primary;
      default:
        return colors.outline;
    }
  }

  /// Get border width for current state
  double _getBorderWidth(TextFieldState state) {
    if (state == TextFieldState.disabled) {
      return 0.0;
    }

    switch (state) {
      case TextFieldState.focused:
        return 2.0;
      case TextFieldState.error:
        return 1.5;
      default:
        return 1.0;
    }
  }

  /// Get content padding for current size
  EdgeInsets _getContentPadding() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case TextFieldSize.md:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case TextFieldSize.lg:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
    }
  }

  /// Get border radius for current size
  BorderRadius _getBorderRadius() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return BorderRadius.circular(8.0);
      case TextFieldSize.md:
        return BorderRadius.circular(12.0);
      case TextFieldSize.lg:
        return BorderRadius.circular(16.0);
    }
  }

  /// Get border for current variant and state
  InputBorder _getBorder(TextFieldState state) {
    switch (widget.variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: _getBorderColor(state),
            width: _getBorderWidth(state),
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: _getBorderColor(state),
            width: _getBorderWidth(state),
          ),
        );
    }
  }

  /// Get focused border for current variant
  InputBorder _getFocusedBorder(TextFieldState state) {
    switch (widget.variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: colors.primary,
            width: 2.0,
          ),
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: colors.primary,
            width: 2.0,
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary,
            width: 2.0,
          ),
        );
    }
  }

  /// Get error border for current variant
  InputBorder _getErrorBorder(TextFieldState state) {
    switch (widget.variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: colors.error,
            width: 1.5,
          ),
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: colors.error,
            width: 1.5,
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.error,
            width: 1.5,
          ),
        );
    }
  }

  /// Get disabled border for current variant
  InputBorder _getDisabledBorder(TextFieldState state) {
    switch (widget.variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: colors.outlineVariant,
            width: 1.0,
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.outlineVariant,
            width: 1.0,
          ),
        );
    }
  }

  /// Get enabled border for current variant
  InputBorder _getEnabledBorder(TextFieldState state) {
    switch (widget.variant) {
      case TextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(
            color: colors.outline,
            width: 1.0,
          ),
        );
      case TextFieldVariant.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.outline,
            width: 1.0,
          ),
        );
    }
  }

  /// Wrap text field with accessibility features
  Widget _wrapWithAccessibility(Widget textField, TextFieldState state) {
    return createFocusableTextField(
      child: textField,
      // onChanged: widget.onChanged, // Not available in current Flutter version
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      semanticLabel: widget.semanticLabel,
      // tooltip: widget.semanticHint, // Not available in current Flutter version
    );
  }
}