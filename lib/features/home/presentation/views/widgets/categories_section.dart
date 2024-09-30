import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/features/home/presentation/views/widgets/custom_action_chip.dart';
import 'package:Basera/features/home/presentation/views/widgets/section_title.dart';
import 'package:flutter/material.dart';



class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: "التصنيفات",),
        SizedBox(
          width: SizeConfig.screenWidth,
          height: 60,
          child: ListView(
            padding: const EdgeInsets.only(right: 20,),
            scrollDirection: Axis.horizontal,
            children: [
              CustomActionChip(label: 'العلوم الطبية',onPressed: () {},),
            ],
          ),
        ),
      ],
    );
  }
}


