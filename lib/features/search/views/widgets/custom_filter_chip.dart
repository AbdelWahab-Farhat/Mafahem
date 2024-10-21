import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final bool selected;
  final void Function(bool)? onSelected;
  final String label;

  const CustomFilterChip({
    super.key,
    this.selected = false,
    this.onSelected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        selected: selected,
        label: Text(
          label,
          style: Styles.style16(context).copyWith(fontWeight: FontWeight.bold),
        ),
        onSelected: onSelected);
  }
}
