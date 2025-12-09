import 'package:flutter/material.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

class BlurWidget extends StatelessWidget with ThemeMixin {
  const BlurWidget({
    this.borderRadius = BorderRadius.zero,
    this.isEnabled = true,
    this.child,
    super.key,
  });

  final BorderRadiusGeometry borderRadius;
  final bool isEnabled;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    if (isEnabled) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: .blur(sigmaX: metrics.blur, sigmaY: metrics.blur),
          child: child,
        ),
      );
    }

    return child ?? const SizedBox();
  }
}
