import 'package:flutter/material.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';

class SpacerWidget extends StatelessWidget with ThemeMixin {
  const SpacerWidget({
    this.direction = Axis.vertical,
    this.size = SpacerWidgetSizes.medium,
    super.key,
  });

  final Axis direction;
  final SpacerWidgetSizes size;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics();

    late double value;
    switch (size) {
      case .small:
        value = metrics.small;
      case .medium:
        value = metrics.medium;
      case .large:
        value = metrics.large;
    }

    switch (direction) {
      case .vertical:
        return SizedBox(height: value);
      case .horizontal:
        return SizedBox(width: value);
    }
  }
}

enum SpacerWidgetSizes {
  small,
  medium,
  large,
}
