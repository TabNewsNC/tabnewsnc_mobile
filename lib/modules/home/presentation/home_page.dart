import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:tabnewsnc/core/mixin/dialog_mixin.dart';
import 'package:tabnewsnc/core/routes/app_routes.dart';
import 'package:tabnewsnc/core/widgets/appbar_widget.dart';
import 'package:tabnewsnc/core/widgets/button/icon_button_widget.dart';
import 'package:tabnewsnc/core/widgets/cards/compact_news_card_widget.dart';
import 'package:tabnewsnc/core/widgets/page_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/modules/home/presentation/dialogs/filter_bottomsheet_widget.dart';
import 'package:tabnewsnc/modules/home/presentation/home_page_controller.dart';

class HomePage extends GetView<HomePageController> with DialogMixin {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Obx(() {
      final news = controller.news;
      final filter = controller.filter;
      final isLoading = controller.isLoading;

      return PageWidget(
        isLoading: isLoading,
        appBar: AppBarWidget(
          title: 'TabNews',
          scrollController: scrollController,
          actions: [
            IconButtonWidget(
              icon: SolarIconsOutline.filter,
              onPressed: () async => openBottomSheet(
                name: 'news_filter',
                child: FilterBottomSheetWidget(
                  selected: filter,
                  onSelected: (value) async => controller.setFilter(value),
                ),
              ),
            ),
          ],
        ),
        body: ListView.separated(
          controller: scrollController,
          itemCount: news.length,
          separatorBuilder: (_, _) => const SpacerWidget(),
          itemBuilder: (_, index) {
            final item = news[index];
            final params = {
              'id': item.id,
              'user': item.ownerUsername,
              'slug': item.slug,
            };

            return CompactNewsCardWidget(
              news: item,
              index: index + 1,
              onPressed: () => Get.toNamed<void>(
                AppRoutes.news,
                parameters: params,
              ),
            );
          },
        ),
      );
    });
  }
}
