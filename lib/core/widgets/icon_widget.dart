import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/mixin/theme_mixin.dart';

class IconWidget extends StatelessWidget with ThemeMixin {
  const IconWidget(
    this.icon, {
    this.size,
    this.color,
    super.key,
  });

  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = getColors();
    final metrics = getMetrics();
    final fgColor = color ?? colors.text;

    return Icon(
      icon,
      color: fgColor,
      size: size ?? metrics.icon,
    );
  }
}
