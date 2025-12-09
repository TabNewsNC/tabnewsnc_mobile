import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:tabnewsnc/core/domain/enums/news_filter_enum.dart';
import 'package:tabnewsnc/core/widgets/button/button_widget.dart';
import 'package:tabnewsnc/core/widgets/radio_group_widget.dart';
import 'package:tabnewsnc/core/widgets/spacer_widget.dart';
import 'package:tabnewsnc/core/widgets/text_widget.dart';

class FilterBottomSheetWidget extends StatefulWidget {
  const FilterBottomSheetWidget({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final NewsFilterEnum selected;
  final void Function(NewsFilterEnum value) onSelected;

  @override
  State<StatefulWidget> createState() => _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  late NewsFilterEnum selected;

  @override
  void initState() {
    super.initState();

    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        const TextWidget(
          'Selecione o filtro',
          size: .headlineMedium,
        ),
        const SpacerWidget(),
        RadioGroupWidget<NewsFilterEnum>(
          selected: selected,
          onSelected: (value) => setState(() => selected = value),
          items: const [
            RadioGroupWidgetItem(
              value: .old,
              text: 'Antigos',
            ),
            RadioGroupWidgetItem(
              value: .recent,
              text: 'Recentes',
            ),
            RadioGroupWidgetItem(
              value: .relevant,
              text: 'Relevantes',
            ),
          ],
        ),
        const SpacerWidget(),
        ButtonWidget(
          text: 'Aplicar',
          icon: SolarIconsOutline.checkCircle,
          onPressed: () {
            widget.onSelected(selected);
            Get.back<void>();
          },
        ),
      ],
    );
  }
}
