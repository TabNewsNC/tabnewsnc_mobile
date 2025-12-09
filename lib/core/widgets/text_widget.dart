import 'package:flutter/material.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

class TextWidget extends StatelessWidget with ThemeMixin {
  const TextWidget(
    this.text, {
    this.maxLines = 1,
    this.size = .bodyMedium,
    this.color,
    super.key,
  });

  final String text;
  final int maxLines;
  final TextWidgetSizes size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = getThemeData(context);
    final colors = getThemeColors(context);

    late TextStyle ts;
    switch (size) {
      case .bodySmall:
        ts = theme.textTheme.bodySmall!;
      case .bodyMedium:
        ts = theme.textTheme.bodyMedium!;
      case .bodyLarge:
        ts = theme.textTheme.bodyLarge!;
      case .titleSmall:
        ts = theme.textTheme.titleSmall!;
      case .titleMedium:
        ts = theme.textTheme.titleMedium!;
      case .titleLarge:
        ts = theme.textTheme.titleLarge!;
      case .headlineSmall:
        ts = theme.textTheme.headlineSmall!;
      case .headlineMedium:
        ts = theme.textTheme.headlineMedium!;
      case .headlineLarge:
        ts = theme.textTheme.headlineLarge!;
    }

    return Text(
      text,
      maxLines: maxLines,
      overflow: .ellipsis,
      style: ts.copyWith(color: color ?? colors.onBackground),
    );
  }
}

enum TextWidgetSizes {
  bodySmall,
  bodyMedium,
  bodyLarge,
  titleSmall,
  titleMedium,
  titleLarge,
  headlineSmall,
  headlineMedium,
  headlineLarge,
}
