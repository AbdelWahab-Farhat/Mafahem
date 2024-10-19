import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/core/widgets/custom_card_list_view_shimmer.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/features/category/manager/category_courses_cubit/category_courses_cubit.dart';
import 'package:Mafaheem/features/category/views/widgets/category_course_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryCoursesViewBody extends StatelessWidget {
  const CategoryCoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoryCoursesCubit>();
    return Scaffold(
      appBar: CustomAppBar(title: cubit.category.name),
      body: BlocBuilder<CategoryCoursesCubit, CategoryCoursesState>(
        builder: (context, state) {
          if (state is CategoryCoursesFailure) {
            return Center(
              child: CustomEmptyStateWidget(
                  title: 'هنالك خطأ',
                  subTitle: state.errMessage,
                  image: Image.asset(
                    'lib/assets/images/Box.png',
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.4,
                  )),
            );
          } else if (state is CategoryCoursesSuccess) {
            final courses =
                context.read<CategoryCoursesCubit>().categoryCourses;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return CategoryCourseItemCard(course: courses[index]);
              },
            );
          } else {
            return const CustomCardListViewShimmer();
          }
        },
      ),
    );
  }
}
