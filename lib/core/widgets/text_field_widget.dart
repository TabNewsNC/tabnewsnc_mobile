import 'package:flutter/material.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

class TextFieldWidget extends StatelessWidget with ThemeMixin {
  const TextFieldWidget({
    required this.hintText,
    this.keyboardType = .multiline,
    this.textAlignVertical = .center,
    this.expands = false,
    this.controller,
    this.maxLines,
    super.key,
  });

  final String hintText;
  final TextInputType keyboardType;
  final TextAlignVertical textAlignVertical;
  final bool expands;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = getThemeData(context);
    final (colors, metrics) = getTheme(context);

    final border = OutlineInputBorder(
      borderRadius: .circular(metrics.radius / 1.2),
      borderSide: BorderSide(
        color: colors.border,
        width: metrics.border,
      ),
    );

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      keyboardAppearance: theme.brightness,
      style: theme.textTheme.bodyMedium,
      maxLines: maxLines,
      expands: expands,
      textAlignVertical: textAlignVertical,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurface.withValues(alpha: 0.6),
        ),
        fillColor: colors.surface,
        iconColor: colors.onSurface,
        prefixIconColor: colors.onSurface,
        suffixIconColor: colors.onSurface,
        contentPadding: const .symmetric(vertical: 10, horizontal: 12),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(color: colors.danger),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(color: colors.danger),
        ),
      ),
    );
  }
}
