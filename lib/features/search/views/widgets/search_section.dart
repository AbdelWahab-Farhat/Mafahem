import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/widgets/custom_icon_button.dart';
import 'package:Basera/core/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          onPressed: () {},
          title: "فلترة",
          textColor: Theme.of(context).colorScheme.surface,
          fontWeight: FontWeight.w600,
          width: SizeConfig.screenWidth * 0.29,
          height: 40,
          radius: 16,
          color: Theme.of(context).colorScheme.onSurface,
          icon:  Icon(Icons.filter_alt , color: Theme.of(context).colorScheme.surface,),
        ),
        const SizedBox(width: 16,),
        Expanded(child: CustomSearchField(
          isEnabled: true,
          hintText: 'ابحث عن محتوى تعليمي',
          icon: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.surface,
                size: 15,
              )),
        ),
        )
      ],
    );
  }
}
