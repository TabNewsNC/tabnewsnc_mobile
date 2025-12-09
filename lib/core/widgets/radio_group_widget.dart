import 'package:flutter/material.dart';
import 'package:tabnewsnc/core/widgets/button/radio_button_widget.dart';

class RadioGroupWidget<T> extends StatefulWidget {
  const RadioGroupWidget({
    required this.items,
    this.selected,
    this.onSelected,
    super.key,
  });

  final T? selected;
  final void Function(T value)? onSelected;
  final List<RadioGroupWidgetItem<T>> items;

  @override
  State<StatefulWidget> createState() => _RadioGroupWidgetState<T>();
}

class _RadioGroupWidgetState<T> extends State<RadioGroupWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: .generate(widget.items.length, (index) {
        final item = widget.items[index];
        final isActive = item.value == widget.selected;
        return RadioButtonWidget(
          text: item.text,
          isActive: isActive,
          onPressed: () => widget.onSelected?.call(item.value),
        );
      }),
    );
  }
}

class RadioGroupWidgetItem<T> {
  const RadioGroupWidgetItem({
    required this.text,
    required this.value,
  });

  final T value;
  final String text;
}
