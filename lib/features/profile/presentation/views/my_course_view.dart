import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_card_list_view_shimmer.dart';
import 'package:Basera/core/widgets/custom_empty_state_widget.dart';
import 'package:Basera/core/widgets/custom_error_widget.dart';
import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:Basera/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

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
              return ProfileCard(
                title: course.title,
                subTitle: "التوجه: ${course.level}",
                image: course.image,
                leftWidget: Text(
                  course.createdAt.toString(),
                  style: Styles.style12(context)
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                rightWidget: Text(
                  'تاريخ الانتهاء:2027/01/01', // Update this accordingly
                  style: Styles.style12(context)
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
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

