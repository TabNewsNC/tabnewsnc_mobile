import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:tabnewsnc/core/mixin/theme_mixin.dart';
import 'package:tabnewsnc/core/widgets/icon_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';

class PageWidget extends StatelessWidget with ThemeMixin {
  const PageWidget({
    this.isEmpty = false,
    this.isLoading = false,
    this.emptyText = 'Não há conteúdo',
    this.appBarSize = const .fromHeight(100),
    this.emptyIcon = SolarIconsOutline.notesMinimalistic,
    this.body,
    this.child,
    this.appBar,
    this.padding,
    this.bottomNavigationBar,
    this.floatingActionButton,
    super.key,
  });

  factory PageWidget.sliver({
    double anchor = 0,
    bool isLoading = false,
    List<Widget> slivers = const [],
    Widget? appBar,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
    ScrollController? scrollController,
  }) {
    return PageWidget(
      appBar: appBar,
      isLoading: isLoading,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      child: SafeArea(
        left: false,
        right: false,
        child: CustomScrollView(
          anchor: anchor,
          slivers: slivers,
          clipBehavior: .none,
          controller: scrollController,
        ),
      ),
    );
  }

  final bool isEmpty;
  final Widget? body;
  final Widget? child;
  final Widget? appBar;
  final bool isLoading;
  final Size appBarSize;
  final String emptyText;
  final IconData emptyIcon;
  final EdgeInsets? padding;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        floatingActionButtonLocation: .endFloat,
        appBar: appBar != null
            ? PreferredSize(preferredSize: appBarSize, child: appBar!)
            : null,
        body: Visibility(
          visible: !isEmpty,
          replacement: _NoContentWidget(icon: emptyIcon, text: emptyText),
          child: _ContentWidget(
            body: body,
            padding: padding,
            isLoading: isLoading,
            child: child,
          ),
        ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget with ThemeMixin {
  const _ContentWidget({
    required this.body,
    required this.child,
    required this.padding,
    required this.isLoading,
  });

  final Widget? body;
  final Widget? child;
  final bool isLoading;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics();

    return Padding(
      padding: padding ?? .symmetric(horizontal: metrics.medium),
      child: Visibility(
        visible: isLoading,
        replacement: body ?? child ?? const SizedBox(),
        child: const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}

class _NoContentWidget extends StatelessWidget {
  const _NoContentWidget({
    required this.icon,
    required this.text,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          IconWidget(icon),
          const SpacerWidget(size: .small),
          TextWidget(text),
        ],
      ),
    );
  }
}
