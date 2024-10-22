import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/features/category/views/category_courses_view.dart';
import 'package:Mafaheem/features/home/presentation/manager/promo_categories_cubit/promo_categories_cubit.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/custom_action_chip.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "التصنيفات",
            hasMore: false,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth,
          height: 60,
          child: BlocBuilder<PromoCategoriesCubit, PromoCategoriesState>(
            builder: (context, state) {
              if (state is PromoCategoriesSuccess) {
                return ListView.builder(
                  padding: const EdgeInsets.only(right: 20, bottom: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  // Use actual categories length
                  itemBuilder: (context, index) => CustomActionChip(
                    label: state.categories[index].name,
                    onPressed: () => push(context,
                        CategoryCoursesView(category: state.categories[index])),
                  ),
                );
              } else if (state is PromoCategoriesFailure) {
                return CustomErrorWidget(text: state.errMessage);
              } else {
                // Shimmer loading effect
                return ListView.builder(
                  padding: const EdgeInsets.only(right: 20, bottom: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Set shimmer for 5 items as placeholders
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 100, // Same width as the action chip
                      height: 40,
                      margin: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        // Match chip's border radius
                        border: Border.all(
                            color: Colors.grey), // Simulate the chip's border
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
