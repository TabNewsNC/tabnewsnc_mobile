import 'package:flutter/material.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';

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
    final metrics = getMetrics();

    return Padding(
      padding: padding ?? .all(metrics.medium),
      child: child,
    );
  }
}
