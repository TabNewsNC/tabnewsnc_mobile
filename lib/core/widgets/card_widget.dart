import 'package:flutter/material.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';
import 'package:tabnews/core/widgets/padding_widget.dart';

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
    final colors = getColors();
    final metrics = getMetrics();

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? colors.surface,
        border:
            border ??
            .fromBorderSide(metrics.card.haveBorder ? metrics.border : .none),
        borderRadius: borderRadius ?? .all(metrics.radius),
      ),
      child: PaddingWidget(
        padding: padding ?? metrics.card.padding,
        child: child,
      ),
    );
  }
}
