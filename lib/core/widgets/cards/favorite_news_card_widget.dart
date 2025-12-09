import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:tabnewsnc/core/domain/entities/favorite_entity.dart';
import 'package:tabnewsnc/core/widgets/button/icon_button_widget.dart';
import 'package:tabnewsnc/core/widgets/card_widget.dart';
import 'package:tabnewsnc/core/widgets/cards/widgets/header_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';
import 'package:tabnewsnc/core/widgets/touchable_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart' hide CardWidget, TextWidget;

class FavoriteNewsCardWidget extends StatelessWidget with ThemeMixin {
  const FavoriteNewsCardWidget({
    required this.favorite,
    this.onPressed,
    this.onFavoritePressed,
    super.key,
  });

  final FavoriteEntity favorite;
  final void Function()? onPressed;
  final void Function()? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    final colors = getThemeColors(context);

    return TouchableWidget(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          HeaderWidget(
            user: favorite.ownerUsername,
            publishedAt: favorite.publishedAt,
          ),
          const SpacerWidget(size: .small),
          CardWidget(
            width: .infinity,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                TextWidget(
                  favorite.title,
                  maxLines: 4,
                  size: .titleMedium,
                ),
                const SpacerWidget(size: .small),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    IconButtonWidget(
                      fgColor: colors.primary,
                      icon: SolarIconsBold.start1,
                      onPressed: onFavoritePressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
