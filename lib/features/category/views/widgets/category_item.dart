import 'package:Basera/core/models/category.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/features/category/views/widgets/category_stacked_row.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      width: SizeConfig.screenWidth * 0.37,
      height: 100,
      child: Stack(
        children: [
          Image.asset(
            'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
            fit: BoxFit.cover,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
          ),
           CategoryStackedRow(category: category,)
        ],
      ),
    );
  }
}
