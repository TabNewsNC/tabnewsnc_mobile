import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tabnewsnc/core/theme/extensions/theme_metrics_extension.dart';
import 'package:tabnewsnc/core/widgets/bottomsheet_widget.dart';

mixin DialogMixin {
  Future<void> openBottomSheet({
    required String name,
    required Widget child,
  }) async {
    final metrics = Get.context!.theme.extension<ThemeMetrics>()!;

    final milliseconds = metrics.duration.inMilliseconds / 2;
    final duration = Duration(milliseconds: milliseconds.toInt());

    await Get.bottomSheet<void>(
      BottomSheetWidget(child: child),
      exitBottomSheetDuration: duration,
      enterBottomSheetDuration: duration,
      settings: RouteSettings(name: '${name}_bottom_sheet'),
    );
  }

  Future<void> openShareDialog({
    Uri? uri,
    String? text,
    List<XFile>? files,
  }) async {
    final context = Get.context!;
    final box = context.findRenderObject()! as RenderBox;
    final origin = box.localToGlobal(.zero) & box.size;

    if (text != null) await Share.share(text, sharePositionOrigin: origin);
    if (uri != null) await Share.shareUri(uri, sharePositionOrigin: origin);
    if (files != null) {
      await Share.shareXFiles(files, text: text, sharePositionOrigin: origin);
    }
  }
}
