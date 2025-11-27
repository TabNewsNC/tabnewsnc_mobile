import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabnews/core/domain/entities/favorite_entity.dart';
import 'package:tabnews/core/routes/app_routes.dart';
import 'package:tabnews/core/widgets/appbar_widget.dart';
import 'package:tabnews/core/widgets/cards/favorite_news_card_widget.dart';
import 'package:tabnews/core/widgets/page_widget.dart';
import 'package:tabnews/core/widgets/spacer_widget.dart';
import 'package:tabnews/modules/favorite/presentation/favorite_page_controller.dart';

class FavoritePage extends GetView<FavoritePageController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Obx(() {
      final favorites = controller.favorites;
      final isLoading = controller.isLoading;

      return PageWidget(
        isLoading: isLoading,
        isEmpty: favorites.isEmpty,
        emptyText: 'Não há favoritos salvos!',
        appBar: AppBarWidget(
          title: 'Favoritos',
          scrollController: scrollController,
        ),
        body: _ContentWidget(
          favorites: favorites,
          onRemovePressed: (id) async => controller.remove(id),
          scrollController: scrollController,
        ),
      );
    });
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget({
    required this.favorites,
    required this.onRemovePressed,
    required this.scrollController,
  });

  final List<FavoriteEntity> favorites;
  final ScrollController scrollController;
  final void Function(String id) onRemovePressed;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: favorites.length,
      separatorBuilder: (_, _) => const SpacerWidget(),
      itemBuilder: (_, index) {
        final item = favorites[index];
        final params = {
          'id': item.id,
          'slug': item.slug,
          'user': item.ownerUsername,
        };

        return FavoriteNewsCardWidget(
          favorite: item,
          onFavoritePressed: () => onRemovePressed(item.id),
          onPressed: () => Get.toNamed<void>(
            AppRoutes.news,
            parameters: params,
          ),
        );
      },
    );
  }
}
