import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/mixin/datetime_mixin.dart';
import 'package:tabnewsnc/core/mixin/theme_mixin.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';

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
    final colors = getColors();
    final fgColor = colors.textAlt;

    return Row(
      children: [
        TextWidget(user, color: colors.primary),
        TextWidget(' • ', color: fgColor),
        TextWidget(getRelativeTime(publishedAt), color: fgColor),
      ],
    );
  }
}
