import 'package:flutter/material.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

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
    final metrics = getThemeMetrics(context);

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
