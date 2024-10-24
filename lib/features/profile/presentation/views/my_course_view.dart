import 'dart:developer';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_card_list_view_shimmer.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/features/Course/data/get_course_by_id.dart';
import 'package:Mafaheem/features/Course/presentation/views/course_view.dart';
import 'package:Mafaheem/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:Mafaheem/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        var userCubit = context.read<UserCubit>();
        if (state is UserFailure) {
          return CustomErrorWidget(text: state.errMessage);
        }
        else if (state is UserSuccess) {
          if (userCubit.userCourses.isEmpty) {
            return CustomEmptyStateWidget(
              title: 'لا يوجد لديك دورات تعليمية ',
              subTitle: 'ابدأ التعلم لافاق مستقبلية',
              image: SvgPicture.asset('lib/assets/icons/profile-empty-state.svg'),
            );

          }
          return ListView.builder(
            itemCount: userCubit.userCourses.length,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            itemBuilder: (BuildContext context, int index) {
              final course = userCubit.userCourses[index];
              log(course.raters.toString());
              return GestureDetector(
                onTap: () async {
                  // TODO TELL HIM TO GIVE YOU THE FULL COURSE LATER AND NOT USE GET REQUEST
                  var realCourse = await GetCourseByIdService.getCourseById(course.id.toString());
                  realCourse.fold((l) => (){}, (r) {
                    push(context, CourseView(course: r));
                  });
                },
                child: ProfileCard(
                  title: course.title,
                  subTitle: "التوجه: ${course.level}",
                  image: course.image,
                  leftWidget: Text(
                    '${(course.duration / 60).toStringAsFixed(0)} سـاعات',
                    style: Styles.style12(context)
                        .copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                  rightWidget: SizedBox(),
                ),
              );
            },
          );
        }
        return const CustomCardListViewShimmer();
      },
    );
  }
}

