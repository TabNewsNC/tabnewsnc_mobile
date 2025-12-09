import 'package:flutter/widgets.dart';
import 'package:tabnewsnc/core/widgets/button/icon_button_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

class FabButtonWidget extends StatelessWidget with ThemeMixin {
  const FabButtonWidget({
    required this.icon,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    return IconButtonWidget(
      icon: icon,
      isFilled: true,
      onPressed: onPressed,
      bgColor: colors.secondary,
      fgColor: colors.onSecondary,
      padding: .all(metrics.medium / 1.4),
    );
  }
}
