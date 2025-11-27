import 'package:flutter/material.dart';
import 'package:tabnews/core/domain/entities/news_entity.dart';
import 'package:tabnews/core/mixin/datetime_mixin.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';
import 'package:tabnews/core/widgets/card_widget.dart';
import 'package:tabnews/core/widgets/cards/widgets/actions_widget.dart';
import 'package:tabnews/core/widgets/cards/widgets/header_widget.dart';
import 'package:tabnews/core/widgets/spacer_widget.dart';
import 'package:tabnews/core/widgets/text_widget.dart';
import 'package:tabnews/core/widgets/touchable_widget.dart';

class CompactNewsCardWidget extends StatelessWidget
    with ThemeMixin, DateTimeMixin {
  const CompactNewsCardWidget({
    required this.news,
    required this.index,
    this.onPressed,
    super.key,
  });

  final int index;
  final NewsEntity news;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = getColors();

    return TouchableWidget(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          HeaderWidget(
            user: news.ownerUsername,
            publishedAt: news.publishedAt,
          ),
          const SpacerWidget(size: .small),
          CardWidget(
            width: .infinity,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                TextWidget(
                  news.title!,
                  maxLines: 4,
                  size: .titleMedium,
                ),
                const SpacerWidget(size: .small),
                ActionsWidget(news: news, color: colors.textAlt),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
