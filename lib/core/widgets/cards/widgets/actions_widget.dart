import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tabnewsnc/core/domain/entities/news_entity.dart';
import 'package:tabnewsnc/core/mixin/theme_mixin.dart';
import 'package:tabnewsnc/core/widgets/button/icon_button_widget.dart';

class ActionsWidget extends StatelessWidget with ThemeMixin {
  const ActionsWidget({
    required this.news,
    this.color,
    this.onUpperPressed,
    this.onDownPressed,
    this.onCommentPressed,
    super.key,
  });

  final NewsEntity news;
  final Color? color;
  final void Function()? onUpperPressed;
  final void Function()? onDownPressed;
  final void Function()? onCommentPressed;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics();

    return Wrap(
      spacing: metrics.medium,
      runSpacing: metrics.medium,
      children: [
        IconButtonWidget(
          icon: Ionicons.arrow_up_outline,
          label: news.tabcoinsCredit.toString(),
          fgColor: color,
          onPressed: onUpperPressed,
        ),
        IconButtonWidget(
          icon: Ionicons.arrow_down_outline,
          label: news.tabcoinsDebit.toString(),
          fgColor: color,
          onPressed: onDownPressed,
        ),
        IconButtonWidget(
          icon: Ionicons.chatbubble_outline,
          label: news.commentCount.toString(),
          fgColor: color,
          onPressed: onCommentPressed,
        ),
      ],
    );
  }
}
