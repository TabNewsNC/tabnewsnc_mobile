import 'package:flutter/material.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

class PaddingWidget extends StatelessWidget with ThemeMixin {
  const PaddingWidget({
    required this.child,
    this.padding,
    super.key,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return Padding(
      padding: padding ?? .all(metrics.medium),
      child: child,
    );
  }
}
