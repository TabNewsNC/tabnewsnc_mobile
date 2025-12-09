import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/widgets/button/icon_button_widget.dart';
import 'package:tabnewsnc/core/widgets/markdown/markdown_editor.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';

class MarkdownToolsWidget extends StatelessWidget {
  const MarkdownToolsWidget({
    required this.editor,
    super.key,
  });

  final MarkdownEditor editor;

  @override
  Widget build(BuildContext context) {
    const iconSize = 21.0;

    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        children: [
          const IconButtonWidget(
            icon: Icons.title_outlined,
            iconSize: iconSize,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.format_bold_outlined,
            iconSize: iconSize,
            onPressed: editor.bold,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.format_italic_outlined,
            iconSize: iconSize,
            onPressed: editor.italic,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.link_outlined,
            iconSize: iconSize,
            onPressed: editor.link,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.format_list_bulleted_outlined,
            iconSize: iconSize,
            onPressed: editor.bulletedList,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.format_list_numbered_outlined,
            iconSize: iconSize,
            onPressed: editor.numberedList,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.format_quote_outlined,
            iconSize: iconSize,
            onPressed: editor.quote,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.strikethrough_s_outlined,
            iconSize: iconSize,
            onPressed: editor.strikethrough,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.code_outlined,
            iconSize: iconSize,
            onPressed: editor.code,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.check_box_outlined,
            iconSize: iconSize,
            onPressed: editor.checkbox,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.grid_on_outlined,
            iconSize: iconSize,
            onPressed: editor.grid,
          ),
          const SpacerWidget(
            direction: .horizontal,
          ),
          IconButtonWidget(
            icon: Icons.image_outlined,
            iconSize: iconSize,
            onPressed: editor.image,
          ),
        ],
      ),
    );
  }
}
