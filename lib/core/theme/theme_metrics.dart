import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/theme/extensions/theme_colors_extension.dart';
import 'package:tabnewsnc/core/theme/extensions/theme_metrics_extension.dart';

final class ThemeMetricsImpl extends ThemeMetrics {
  const ThemeMetricsImpl({
    super.small = 8,
    super.medium = 16,
    super.large = 24,
    super.icon = 21,
    super.blur = 24,
    super.border = const BorderSide(),
    super.radius = const .circular(16),
    super.shadow = const BoxShadow(),
    super.header = .zero,
    super.footer = .zero,
    super.button = const Size(.infinity, 38),
    super.buttonPadding = const .symmetric(horizontal: 8),
    super.field = .zero,
    super.fieldPadding = const .symmetric(
      vertical: 10,
      horizontal: 12,
    ),
    super.card = const ThemeCardMetrics(
      haveBorder: true,
      padding: .all(8),
    ),
    super.curve = Curves.linear,
    super.duration = const Duration(milliseconds: 200),
  });

  factory ThemeMetricsImpl.get(ThemeColors colors) {
    return ThemeMetricsImpl(border: BorderSide(color: colors.border));
  }
}
