import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart' hide TextWidget;

class HeaderWidget extends StatelessWidget with ThemeMixin, DateTimeMixin {
  const HeaderWidget({
    required this.user,
    required this.publishedAt,
    super.key,
  });

  final String user;
  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    final colors = getThemeColors(context);
    final fgColor = colors.onBackgroundAlt;

    return Row(
      children: [
        TextWidget(user, color: colors.primary),
        TextWidget(' • ', color: fgColor),
        TextWidget(toRelativeTime(publishedAt), color: fgColor),
      ],
    );
  }
}
