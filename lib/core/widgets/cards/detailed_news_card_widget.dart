import 'package:flutter/material.dart';
import 'package:tabnews/core/domain/entities/news_entity.dart';
import 'package:tabnews/core/mixin/datetime_mixin.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';
import 'package:tabnews/core/widgets/card_widget.dart';
import 'package:tabnews/core/widgets/cards/widgets/actions_widget.dart';
import 'package:tabnews/core/widgets/cards/widgets/header_widget.dart';
import 'package:tabnews/core/widgets/markdown/markdown_viewer_widget.dart';
import 'package:tabnews/core/widgets/spacer_widget.dart';

class DetailedNewsCardWidget extends StatelessWidget
    with ThemeMixin, DateTimeMixin {
  const DetailedNewsCardWidget({
    required this.news,
    this.onUpperPressed,
    this.onDownPressed,
    this.onCommentPressed,
    super.key,
  });

  final NewsEntity news;
  final void Function()? onUpperPressed;
  final void Function()? onDownPressed;
  final void Function()? onCommentPressed;

  @override
  Widget build(BuildContext context) {
    final colors = getColors();

    var data = news.body!;
    if (news.title != null) data = '# ${news.title} \n ${news.body}';

    return Column(
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
              MarkdownViewerWidget(data: data),
            ],
          ),
        ),
        const SpacerWidget(size: .small),
        ActionsWidget(
          news: news,
          color: colors.text,
          onUpperPressed: onUpperPressed,
          onDownPressed: onDownPressed,
          onCommentPressed: onCommentPressed,
        ),
      ],
    );
  }
}
