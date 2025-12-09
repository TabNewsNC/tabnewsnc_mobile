import 'package:flutter/material.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

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
    final (colors, metrics) = getTheme(context);
    final fgColor = color ?? colors.onBackground;

    return Icon(
      icon,
      color: fgColor,
      size: size ?? metrics.icon,
    );
  }
}
