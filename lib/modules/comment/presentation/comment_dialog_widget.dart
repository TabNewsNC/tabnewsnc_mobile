import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabnewsnc/core/widgets/blur_widget.dart';
import 'package:tabnewsnc/core/widgets/button/button_widget.dart';
import 'package:tabnewsnc/core/widgets/button/icon_button_widget.dart';
import 'package:tabnewsnc/core/widgets/card_widget.dart';
import 'package:tabnewsnc/core/widgets/markdown/markdown_editor.dart';
import 'package:tabnewsnc/core/widgets/markdown/markdown_tools_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_field_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart' hide CardWidget;

class CommentDialogWidget extends StatelessWidget with ThemeMixin {
  const CommentDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);
    final viewInsets = MediaQuery.of(context).viewInsets;

    final controller = TextEditingController();
    final editor = MarkdownEditor(controller: controller);

    final borderRadius = BorderRadius.circular(metrics.radius).copyWith(
      bottomLeft: .zero,
      bottomRight: .zero,
    );

    return BlurWidget(
      borderRadius: borderRadius,
      child: CardWidget(
        height: .infinity,
        borderRadius: borderRadius,
        padding: .symmetric(horizontal: metrics.medium).copyWith(
          bottom: viewInsets.bottom != 0 ? metrics.medium : 0,
        ),
        child: Column(
          children: [
            const _AppBarWidget(),
            const SpacerWidget(),
            Expanded(child: _BodyWidget(controller: controller)),
            const SpacerWidget(),
            _ToolsWidget(editor: editor),
          ],
        ),
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          IconButtonWidget(
            icon: Ionicons.chevron_down_outline,
            iconSize: 24,
            onPressed: () => Get.back<void>(),
          ),
          const ButtonWidget(text: 'Responder'),
        ],
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      hintText: 'Escreva seu comentário',
      controller: controller,
      textAlignVertical: .top,
      expands: true,
    );
  }
}

class _ToolsWidget extends StatelessWidget {
  const _ToolsWidget({required this.editor});

  final MarkdownEditor editor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: MarkdownToolsWidget(editor: editor),
    );
  }
}
