import 'package:Mafaheem/core/models/category.dart';
import 'package:Mafaheem/core/widgets/custom_Tag_text_widget.dart';
import 'package:flutter/material.dart';

class ListOfTextTags extends StatelessWidget {
  final List<Category> categories;
  const ListOfTextTags({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (final category in categories)
        CustomTagTextWidget(text: category.name),
    ]);
  }
}
