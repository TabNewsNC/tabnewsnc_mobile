import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';
import 'package:tabnewsnc/core/widgets/touchable_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart' hide TextWidget;

class RadioButtonWidget extends StatelessWidget with ThemeMixin {
  const RadioButtonWidget({
    required this.text,
    required this.isActive,
    this.onPressed,
    super.key,
  });

  final String text;
  final bool isActive;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    var color = Colors.transparent;
    var size = TextWidgetSizes.bodyMedium;
    if (isActive) {
      size = .titleMedium;
      color = colors.border;
    }

    return TouchableWidget(
      onPressed: onPressed,
      child: Container(
        width: metrics.button.width,
        height: metrics.button.height,
        padding: const .symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: .circular(metrics.radius / 1.2),
        ),
        child: Row(
          children: [
            _IndicatorWidget(isActive: isActive),
            const SpacerWidget(
              size: .small,
              direction: .horizontal,
            ),
            TextWidget(text, size: size),
          ],
        ),
      ),
    );
  }
}

class _IndicatorWidget extends StatelessWidget with ThemeMixin {
  const _IndicatorWidget({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    var color = colors.border;
    if (isActive) color = colors.primary;

    return Container(
      width: metrics.icon,
      height: metrics.icon,
      padding: const .all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: .circular(metrics.icon),
        border: .all(color: color, width: metrics.border),
      ),
      child: Visibility(
        visible: isActive,
        child: Container(
          decoration: BoxDecoration(
            color: colors.onPrimary,
            borderRadius: .circular(metrics.icon),
          ),
        ),
      ),
    );
  }
}
