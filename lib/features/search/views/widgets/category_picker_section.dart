import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/features/search/manager/category_picker_cubit/category_picker_cubit.dart';
import 'package:Mafaheem/features/search/views/widgets/custom_choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoryPickerSection extends StatelessWidget {
  const CategoryPickerSection({
    super.key,
    required this.categoryPickerCubit,
  });

  final CategoryPickerCubit categoryPickerCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryPickerCubit, CategoryPickerState>(
      builder: (context, state) {
        if (state is CategoryPickerSuccess) {
          return Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              for (var category
              in categoryPickerCubit.categoriesPicked.entries)
                CustomChoiceChip(
                  label: category.key.name,
                  selected: category.value,
                  onSelected: (selectedCategory) {
                    categoryPickerCubit.onPickCategory(selectedCategory, category.key);
                  },
                ),
            ],
          );
        } else if (state is CategoryPickerFailure) {
          return Text(
            'Failed to load categories',
            style: Styles.style18(context),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: const Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                CustomChoiceChip(label: 'فيزياء'),
                CustomChoiceChip(label: 'كيمياء'),
                CustomChoiceChip(label: 'فلسفة'),
                CustomChoiceChip(label: 'رياضيات'),
              ],
            ),
          );
        }
      },
    );
  }
}
