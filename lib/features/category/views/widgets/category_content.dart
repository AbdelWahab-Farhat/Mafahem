import 'package:Basera/core/models/category.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CategoryContent extends StatelessWidget {
  final Category category;
  const CategoryContent({
    super.key, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth *  0.364,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            category.name,
            style: Styles.style14(context).copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
