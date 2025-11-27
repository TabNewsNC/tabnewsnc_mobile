import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher_string.dart';

class MarkdownViewerWidget extends StatelessWidget {
  const MarkdownViewerWidget({
    required this.data,
    this.scrollController,
    super.key,
  });

  final String data;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: data,
      controller: scrollController,
      selectable: true,
      shrinkWrap: true,
      padding: .zero,
      physics: const NeverScrollableScrollPhysics(),
      softLineBreak: true,
      extensionSet: md.ExtensionSet(
        md.ExtensionSet.gitHubFlavored.blockSyntaxes,
        <md.InlineSyntax>[
          md.EmojiSyntax(),
          ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
        ],
      ),
      onTapLink: (text, href, title) async {
        if (href != null) await launchUrlString(href);
      },
    );
  }
}
