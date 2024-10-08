import 'dart:ui';

import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/features/category/views/widgets/category_content.dart';
import 'package:flutter/material.dart';

class CategoryStackedRow extends StatelessWidget {
  const CategoryStackedRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipPath(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 4),
            width: SizeConfig.screenWidth,
            height: 37,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withOpacity(0.29),
            child: const CategoryContent(),
          ),
        ),
      ),
    );
  }
}
