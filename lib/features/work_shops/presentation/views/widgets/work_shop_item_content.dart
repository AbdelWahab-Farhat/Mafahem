import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/image_content.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/list_of_text_tags.dart';
import 'package:flutter/material.dart';

class WorkShopItemContent extends StatelessWidget {
  final WorkShop workShop;
  const WorkShopItemContent({
    super.key, required this.workShop,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListOfTextTags(categories: workShop.categories,),
        const SizedBox(
          height: 8,
        ),
        ImageContent(title: workShop.title, subTitle: workShop.description,),
      ],
    );
  }
}
