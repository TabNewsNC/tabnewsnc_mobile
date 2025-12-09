import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/mixin/theme_mixin.dart';
import 'package:tabnewsnc/core/widgets/icon_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';
import 'package:tabnewsnc/core/widgets/touchable_widget.dart';

class IconButtonWidget extends StatelessWidget with ThemeMixin {
  const IconButtonWidget({
    required this.icon,
    this.isFilled = false,
    this.label,
    this.iconSize,
    this.padding,
    this.fgColor,
    this.bgColor,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final bool isFilled;
  final String? label;
  final double? iconSize;
  final EdgeInsets? padding;
  final Color? fgColor;
  final Color? bgColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = getColors();
    final metrics = getMetrics();

    final iconWidget = IconWidget(
      icon,
      size: iconSize,
      color: fgColor,
    );

    final child = Visibility(
      visible: label != null,
      replacement: iconWidget,
      child: Row(
        mainAxisSize: .min,
        children: [
          iconWidget,
          const SpacerWidget(
            size: .small,
            direction: .horizontal,
          ),
          if (label != null) TextWidget(label!, color: fgColor),
        ],
      ),
    );

    return TouchableWidget(
      onPressed: onPressed,
      child: Visibility(
        visible: isFilled,
        replacement: child,
        child: Container(
          padding: padding ?? .all(metrics.medium),
          decoration: BoxDecoration(
            color: bgColor ?? colors.primary,
            borderRadius: .all(metrics.radius),
            border: .fromBorderSide(metrics.border),
          ),
          child: child,
        ),
      ),
    );
  }
}
