import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/custom_action_chip.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/section_title.dart';
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
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 20,bottom: 5),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) =>  CustomActionChip(label: 'العلوم الطبية',onPressed: () {},),
          ),
        ),
      ],
    );
  }
}


