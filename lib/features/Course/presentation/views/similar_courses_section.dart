import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_card_list_view_shimmer.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/features/Course/presentation/manager/filter_courses_cubit/filter_courses_cubit.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/similar_courses_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarCoursesSection extends StatefulWidget {
  final Course course;

  const SimilarCoursesSection({super.key, required this.course});

  @override
  State<SimilarCoursesSection> createState() => _SimilarCoursesSectionState();
}

class _SimilarCoursesSectionState extends State<SimilarCoursesSection> {
  @override
  void initState() {
    context.read<FilterCoursesCubit>().getSimilarCourses(widget.course);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var filterCoursesCubit = context.read<FilterCoursesCubit>();
    return BlocBuilder<FilterCoursesCubit, FilterCoursesState>(
      builder: (context, state) {
        if (state is FilterCoursesFailure) {
          return CustomErrorWidget(text: state.message);
        } else if (state is FilterCoursesSuccess) {
          if (filterCoursesCubit.similarCourses.isEmpty) {
            return CustomEmptyStateWidget(
                title: 'لا يوجد كورسات مشابهة',
                subTitle: 'سنقوم بأضافة المزيد ..',
                image: Image.asset(
                  'lib/assets/images/lessons-empty-state.png',
                  width: SizeConfig.screenWidth * 0.8,
                  height: SizeConfig.screenHeight * 0.3,
                ));
          }
          filterCoursesCubit.similarCourses.removeWhere((element) => element.id == widget.course.id,);
          return ListView.builder(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
            itemCount: filterCoursesCubit.similarCourses.length,
            itemBuilder: (context, index) =>  Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SimilarCoursesItem(course: filterCoursesCubit.similarCourses[index],),
            ),
          );
        } else {
          return const CustomCardListViewShimmer();
        }
      },
    );
  }
}
