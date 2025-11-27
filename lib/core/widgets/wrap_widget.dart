import 'package:flutter/material.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';

class WrapWidget extends StatelessWidget with ThemeMixin {
  const WrapWidget({
    this.spacing = .medium,
    this.alignment = .start,
    this.direction = .vertical,
    this.children = const [],
    super.key,
  });

  final Axis direction;
  final WrapAlignment alignment;
  final WrapWidgetSpacings spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics();

    late double value;
    switch (spacing) {
      case .small:
        value = metrics.small;
      case .medium:
        value = metrics.medium;
      case .large:
        value = metrics.large;
    }

    return Wrap(
      direction: direction,
      spacing: value,
      runSpacing: value,
      alignment: alignment,
      children: children,
    );
  }
}

enum WrapWidgetSpacings {
  small,
  medium,
  large,
}
