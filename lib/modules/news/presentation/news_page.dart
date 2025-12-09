import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:tabnewsnc/core/domain/entities/news_entity.dart';
import 'package:tabnewsnc/core/routes/app_routes.dart';
import 'package:tabnewsnc/core/widgets/appbar_widget.dart';
import 'package:tabnewsnc/core/widgets/button/fab_button_widget.dart';
import 'package:tabnewsnc/core/widgets/button/icon_button_widget.dart';
import 'package:tabnewsnc/core/widgets/cards/detailed_news_card_widget.dart';
import 'package:tabnewsnc/core/widgets/page_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';
import 'package:tabnewsnc/core/widgets/wrap_widget.dart';
import 'package:tabnewsnc/modules/news/presentation/news_page_controller.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart' hide TextWidget;

class NewsPage extends GetView<NewsPageController> {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repliesKey = GlobalKey();
    final scrollController = ScrollController();

    return Obx(() {
      final news = controller.news;
      final replies = controller.comments;
      final isLoading = controller.isLoading;
      final isFavorite = controller.isFavorite;

      return PageWidget.sliver(
        isLoading: isLoading,
        scrollController: scrollController,
        appBar: _AppBarWidget(
          isFavorite: isFavorite,
          scrollController: scrollController,
        ),
        floatingActionButton: _FabButtonsWidget(
          repliesKey: repliesKey,
          scrollController: scrollController,
        ),
        slivers: [
          if (news != null) _NewsWidget(news: news),
          const _SpacerWidget(size: .large),
          _RepliesTitleWidget(key: repliesKey),
          const _SpacerWidget(),
          if (news != null) _RepliesWidget(news: news, replies: replies),
        ],
      );
    });
  }
}

class _AppBarWidget extends GetView<NewsPageController> with ThemeMixin {
  const _AppBarWidget({
    required this.isFavorite,
    required this.scrollController,
  });

  final bool isFavorite;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final colors = getThemeColors(context);

    var color = colors.onSecondary;
    var icon = SolarIconsOutline.start1;
    if (isFavorite) {
      color = colors.primary;
      icon = SolarIconsBold.start1;
    }

    return AppBarWidget(
      showLeading: true,
      scrollController: scrollController,
      actions: [
        IconButtonWidget(
          icon: SolarIconsOutline.share,
          onPressed: () async => controller.share(),
        ),
        IconButtonWidget(
          icon: icon,
          fgColor: color,
          onPressed: () async => controller.favorite(),
        ),
      ],
    );
  }
}

class _FabButtonsWidget extends StatelessWidget with ThemeMixin {
  const _FabButtonsWidget({
    required this.repliesKey,
    required this.scrollController,
  });

  final GlobalKey repliesKey;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return WrapWidget(
      spacing: .small,
      children: [
        FabButtonWidget(
          icon: Ionicons.chevron_up_outline,
          onPressed: () => scrollController.animateTo(
            0,
            curve: metrics.curve,
            duration: metrics.duration,
          ),
        ),
        FabButtonWidget(
          icon: Ionicons.chevron_down_outline,
          onPressed: () => Scrollable.ensureVisible(
            repliesKey.currentContext!,
            curve: metrics.curve,
            duration: metrics.duration,
          ),
        ),
      ],
    );
  }
}

class _NewsWidget extends StatelessWidget {
  const _NewsWidget({required this.news});

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DetailedNewsCardWidget(news: news),
    );
  }
}

class _SpacerWidget extends StatelessWidget {
  const _SpacerWidget({this.size = SpacerWidgetSizes.medium});

  final SpacerWidgetSizes size;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SpacerWidget(size: size),
    );
  }
}

class _RepliesTitleWidget extends StatelessWidget {
  const _RepliesTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: TextWidget(
        'Respostas',
        size: .titleLarge,
      ),
    );
  }
}

class _RepliesWidget extends GetView<NewsPageController> {
  const _RepliesWidget({
    required this.news,
    required this.replies,
  });

  final NewsEntity news;
  final List<NewsEntity> replies;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: replies.length,
      separatorBuilder: (_, _) => const SpacerWidget(),
      itemBuilder: (_, index) {
        final comment = replies[index];
        final params = {
          'news': news.toJson(),
          'comment': comment.toJson(),
        };

        return DetailedNewsCardWidget(
          news: comment,
          onCommentPressed: () async => Get.toNamed<void>(
            AppRoutes.comment,
            parameters: params,
          ),
        );
      },
    );
  }
}
