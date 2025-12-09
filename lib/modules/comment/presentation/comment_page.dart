import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabnewsnc/core/mixin/theme_mixin.dart';
import 'package:tabnewsnc/core/routes/app_routes.dart';
import 'package:tabnewsnc/core/widgets/appbar_widget.dart';
import 'package:tabnewsnc/core/widgets/cards/detailed_news_card_widget.dart';
import 'package:tabnewsnc/core/widgets/page_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';
import 'package:tabnewsnc/modules/comment/presentation/controllers/comment_page_controller.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<StatefulWidget> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> with ThemeMixin {
  final scrollController = ScrollController();
  final GlobalKey<State<StatefulWidget>> detailKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = detailKey.currentContext!.findRenderObject()! as RenderBox;
      final height = box.size.height;

      scrollController.jumpTo(height);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CommentPageController>();

    return PageWidget.sliver(
      scrollController: scrollController,
      appBar: AppBarWidget(
        showLeading: true,
        scrollController: scrollController,
      ),
      slivers: [
        SliverToBoxAdapter(
          child: DetailedNewsCardWidget(key: detailKey, news: controller.news),
        ),
        const SliverToBoxAdapter(
          child: SpacerWidget(size: .large),
        ),
        SliverToBoxAdapter(
          child: DetailedNewsCardWidget(news: controller.comment),
        ),
        const SliverToBoxAdapter(
          child: SpacerWidget(size: .large),
        ),
        const SliverToBoxAdapter(
          child: TextWidget('Respostas', size: .titleMedium),
        ),
        const SliverToBoxAdapter(child: SpacerWidget()),
        SliverList.separated(
          itemCount: controller.comment.children.length,
          separatorBuilder: (_, _) => const SpacerWidget(),
          itemBuilder: (_, index) {
            final comment = controller.comment.children[index];

            Future<void> onPressed() async {
              await Get.toNamed<void>(
                AppRoutes.comment,
                preventDuplicates: false,
              );
            }

            return DetailedNewsCardWidget(
              news: comment,
              onCommentPressed: onPressed,
            );
          },
        ),
      ],
    );
  }
}
