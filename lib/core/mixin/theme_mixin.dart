import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabnewsnc/core/theme/extensions/theme_colors_extension.dart';
import 'package:tabnewsnc/core/theme/extensions/theme_metrics_extension.dart';

mixin ThemeMixin {
  ThemeData getTheme() {
    final theme = Theme.of(Get.context!);
    return theme;
  }

  ThemeColors getColors() {
    final colors = Theme.of(Get.context!).extension<ThemeColors>()!;
    return colors;
  }

  ThemeMetrics getMetrics() {
    final metrics = Theme.of(Get.context!).extension<ThemeMetrics>()!;
    return metrics;
  }
}
