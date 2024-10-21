import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_icon_button.dart';
import 'package:Mafaheem/core/widgets/custom_search_field.dart';
import 'package:Mafaheem/features/search/manager/price_range_cubit/price_range_cubit.dart';
import 'package:Mafaheem/features/search/manager/search_cubit/search_cubit.dart';
import 'package:Mafaheem/features/search/views/filter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          onPressed: () =>showFilterBottomSheet(context),
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
          controller: context.read<SearchCubit>().searchController,
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
