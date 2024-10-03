import 'package:Basera/features/work_shops/presentation/views/widgets/image_content.dart';
import 'package:Basera/features/work_shops/presentation/views/widgets/list_of_text_tags.dart';
import 'package:flutter/material.dart';

class WorkShopItemContent extends StatelessWidget {
  const WorkShopItemContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListOfTextTags(),
        SizedBox(
          height: 8,
        ),
        ImageContent(title: 'التشخيص النفسي للطفل', subTitle: 'تعلم كيف تشخص طفلك بشكل صحيح',),
      ],
    );
  }
}
