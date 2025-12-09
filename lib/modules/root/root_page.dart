import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:ionicons/ionicons.dart';
import 'package:solar_icons/solar_icons.dart';
// import 'package:tabnewsnc/core/widgets/button/fab_button_widget.dart';
import 'package:tabnewsnc/core/widgets/navbar_widget.dart';
import 'package:tabnewsnc/core/widgets/page_widget.dart';
import 'package:tabnewsnc/modules/favorite/presentation/favorite_page.dart';
import 'package:tabnewsnc/modules/home/presentation/home_page.dart';
import 'package:tabnewsnc/modules/root/root_page_controller.dart';

class RootPage extends GetView<RootPageController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      padding: .zero,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (value) => controller.current = value,
        children: const [HomePage(), FavoritePage()],
      ),
      // floatingActionButton: Obx(() {
      //   if (controller.current != 0) return const SizedBox.shrink();
      //   return const FabButtonWidget(icon: Ionicons.add_outline);
      // }),
      bottomNavigationBar: const _NavBarWidget(),
    );
  }
}

class _NavBarWidget extends GetView<RootPageController> {
  const _NavBarWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavBarWidget(
        current: controller.current,
        onPressed: (current) => controller.jumpTo(current),
        items: const [
          NavBarWidgetItem(
            label: 'Início',
            icon: SolarIconsOutline.home,
            activeIcon: SolarIconsBold.home,
          ),
          NavBarWidgetItem(
            label: 'Favoritos',
            icon: SolarIconsOutline.stars1,
            activeIcon: SolarIconsBold.stars1,
          ),
        ],
      ),
    );
  }
}
