import 'package:Mafaheem/core/widgets/custom_Tag_text_widget.dart';
import 'package:flutter/material.dart';
class ListOfTextTags extends StatelessWidget {
  const ListOfTextTags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomTagTextWidget(text: 'طبية'),
        SizedBox(
          width: 8,
        ),
        CustomTagTextWidget(text: 'نفسي'),
        SizedBox(
          width: 8,
        ),
        CustomTagTextWidget(text: 'تفاعلية بالكيمياء'),
      ],
    );
  }
}
