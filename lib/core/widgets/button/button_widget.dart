import 'package:flutter/material.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';
import 'package:tabnews/core/widgets/icon_widget.dart';
import 'package:tabnews/core/widgets/spacer_widget.dart';
import 'package:tabnews/core/widgets/text_widget.dart';
import 'package:tabnews/core/widgets/touchable_widget.dart';

class ButtonWidget extends StatelessWidget with ThemeMixin {
  const ButtonWidget({
    required this.text,
    this.icon,
    this.onPressed,
    super.key,
  });

  final String text;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = getColors();
    final metrics = getMetrics();

    return TouchableWidget(
      onPressed: onPressed,
      child: Container(
        width: metrics.button.width,
        height: metrics.button.height,
        padding: metrics.buttonPadding,
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: .all(metrics.radius / 1.2),
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            if (icon != null) IconWidget(icon!, color: colors.onPrimary),
            if (icon != null)
              const SpacerWidget(
                size: .small,
                direction: .horizontal,
              ),
            TextWidget(
              text,
              size: .titleMedium,
              color: colors.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
