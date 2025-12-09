import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/widgets/blur_widget.dart';
import 'package:tabnewsnc/core/widgets/icon_widget.dart';
import 'package:tabnewsnc/core/widgets/safe_area_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';
import 'package:tabnewsnc/core/widgets/touchable_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart' hide IconWidget, TextWidget;

class NavBarWidget extends StatelessWidget with ThemeMixin {
  const NavBarWidget({
    required this.items,
    required this.onPressed,
    this.current = 0,
    super.key,
  });

  final int current;
  final List<NavBarWidgetItem> items;
  final void Function(int current) onPressed;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    return BlurWidget(
      child: Container(
        padding: .symmetric(
          vertical: metrics.small,
          horizontal: metrics.medium,
        ),
        color: colors.secondary,
        child: SafeAreaWidget(
          bottom: true,
          child: _ChildWidget(
            items: items,
            current: current,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

class NavBarWidgetItem {
  const NavBarWidgetItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
}

class _ChildWidget extends StatelessWidget {
  const _ChildWidget({
    required this.items,
    required this.current,
    required this.onPressed,
  });

  final int current;
  final List<NavBarWidgetItem> items;
  final void Function(int current) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: .generate(
        items.length,
        (index) {
          final item = items[index];
          return _NavBarItemWidget(
            item: item,
            isActive: current == index,
            onPressed: () => onPressed(index),
          );
        },
      ),
    );
  }
}

class _NavBarItemWidget extends StatelessWidget with ThemeMixin {
  const _NavBarItemWidget({
    required this.item,
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;
  final NavBarWidgetItem item;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    var icon = item.icon;
    var color = colors.onBackgroundAlt;
    const size = TextWidgetSizes.bodySmall;

    if (isActive) {
      icon = item.activeIcon;
      color = colors.primary;
    }

    return TouchableWidget(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: .min,
        children: [
          IconWidget(icon, color: color, size: metrics.icon * 1.1),
          TextWidget(item.label, size: size, color: color),
        ],
      ),
    );
  }
}
