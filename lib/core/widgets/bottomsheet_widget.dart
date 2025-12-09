import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/widgets/card_widget.dart';
import 'package:tabnewsnc/core/widgets/safe_area_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart' hide CardWidget;

class BottomSheetWidget extends StatelessWidget with ThemeMixin {
  const BottomSheetWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    return CardWidget(
      width: .infinity,
      border: Border(
        top: BorderSide(
          color: colors.border,
          width: metrics.border,
        ),
      ),
      padding: .all(metrics.medium).copyWith(top: metrics.small),
      child: SafeAreaWidget(
        bottom: true,
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            const _HandleWidget(),
            const SpacerWidget(),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}

class _HandleWidget extends StatelessWidget with ThemeMixin {
  const _HandleWidget();

  @override
  Widget build(BuildContext context) {
    final colors = getThemeColors(context);

    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: colors.border,
          borderRadius: .circular(4),
        ),
      ),
    );
  }
}
