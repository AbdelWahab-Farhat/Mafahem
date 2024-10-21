import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final bool selected;
  final void Function(bool)? onSelected;
  final String label;

  const CustomChoiceChip({
    super.key,
    this.selected = false,
    this.onSelected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        label: Text(label),
        labelStyle: Styles.style16(context),
        selected: selected,
        onSelected: onSelected);
  }
}
