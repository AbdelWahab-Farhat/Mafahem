import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/search/manager/category_picker_cubit/category_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/level_picker_cubit/level_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/price_range_cubit/price_range_cubit.dart';
import 'package:Mafaheem/features/search/manager/search_cubit/search_cubit.dart';
import 'package:Mafaheem/features/search/views/widgets/category_picker_section.dart';
import 'package:Mafaheem/features/search/views/widgets/filter_section_title.dart';
import 'package:Mafaheem/features/search/views/widgets/level_picker_section.dart';
import 'package:Mafaheem/features/search/views/widgets/price_range_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showFilterBottomSheet(BuildContext ctx) {
  showModalBottomSheet(
    context: ctx,
    enableDrag: true,
    isScrollControlled: true, // Important for height control
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: ctx.read<LevelPickerCubit>(),
        ),
        BlocProvider.value(
          value: ctx.read<PriceRangeCubit>(),
        ),
        BlocProvider.value(
          value: ctx.read<CategoryPickerCubit>(),
        ),
        BlocProvider.value(
          value: ctx.read<SearchCubit>(),
        ),
      ],
      child: const FilterSheet(),
    ),
  );
}

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var priceRangeCubit = context.read<PriceRangeCubit>();
    var levelPickerCubit = context.read<LevelPickerCubit>();
    var categoryPickerCubit = context.read<CategoryPickerCubit>();
    var searchCubit = context.read<SearchCubit>();
    return Container(
      constraints: BoxConstraints(
        maxHeight: SizeConfig.screenHeight * 0.7,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Use minimum size to fit content
          children: [
            // Level selection
            const FilterSectionTitle(title: 'المستوى:'),
            const SizedBox(height: 12),
            LevelPickerSection(levelPickerCubit: levelPickerCubit),
            const SizedBox(height: 32),

            // Preference selection
            const FilterSectionTitle(title: 'التصنيفات :'),
            const SizedBox(height: 8),
            CategoryPickerSection(categoryPickerCubit: categoryPickerCubit),
            const SizedBox(height: 32),
            const FilterSectionTitle(title: 'متوسط السـعر'),
            const SizedBox(height: 8),
            PriceRangeSection(priceRangeCubit: priceRangeCubit),

            const SizedBox(height: 24),
            Center(
              child: CustomFilledButton(
                title: "تطبيق خيارات البحث",
                textColor: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {
                  submitFilters(searchCubit, context);
                },
              ),
            ),

            const SizedBox(height: 16),

            // Clear filters link
            Center(
              child: CustomFilledButton(
                onPressed: () => clearFilters(context, levelPickerCubit,
                    categoryPickerCubit, priceRangeCubit, searchCubit),
                title: 'حذف جميع الفلاتر',
                textColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitFilters(SearchCubit searchCubit, BuildContext context) {
    searchCubit.isDefaultFilters = false;
    Navigator.of(context).pop();
  }

  void clearFilters(
      BuildContext context,
      LevelPickerCubit levelPickerCubit,
      CategoryPickerCubit categoryPickerCubit,
      PriceRangeCubit priceRangeCubit,
      SearchCubit searchCubit) {
    Navigator.of(context).pop();
    levelPickerCubit.selectedLevels = [];
    levelPickerCubit.isBeginnerLevelSelected = false;
    levelPickerCubit.isAdvancedLevelSelected = false;
    levelPickerCubit.isIntermediateLevelSelected = false;
    categoryPickerCubit.categoriesPicked.forEach(
      (key, value) {
        if (value) {
          categoryPickerCubit.categoriesPicked[key] = false;
        }
      },
    );
    priceRangeCubit.startValue = 100;
    priceRangeCubit.endValue = 400;
    searchCubit.isDefaultFilters = true;
  }
}
