import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/widgets/padding_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

class CardWidget extends StatelessWidget with ThemeMixin {
  const CardWidget({
    required this.child,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.borderRadius,
    this.color,
    super.key,
  });

  final Widget child;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? colors.surface,
        border:
            border ??
            Border.all(
              color: colors.border,
              width: metrics.border,
            ),
        borderRadius: borderRadius ?? .circular(metrics.radius),
      ),
      child: PaddingWidget(
        padding: padding ?? EdgeInsets.all(metrics.small),
        child: child,
      ),
    );
  }
}
