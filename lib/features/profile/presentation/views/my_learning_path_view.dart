import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:Mafaheem/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyLearningPathView extends StatelessWidget {
  const MyLearningPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        var userCubit = context.read<UserCubit>();
        List<RoadMap> userRoadMaps = userCubit.userRoadMaps;
        if (state is UserFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else if (state is UserSuccess) {
          if (userRoadMaps.isEmpty) {
            return CustomEmptyStateWidget(
                title: 'لا يوجد لديك مسارات تعليمية.',
                subTitle: 'حصولك على واحد يعزز من حصولك على وظيفة!.',
                image: SvgPicture.asset(
                    'lib/assets/icons/profile-empty-state.svg'));
          }
          return ListView.builder(
            itemCount: userCubit.userRoadMaps.length,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            itemBuilder: (context, index) {
              var userRoadMap = userRoadMaps[index];
              return ProfileCard(
                title: userRoadMap.title,
                subTitle: userRoadMap.description,
                image:userRoadMap.courses[0].image,
                //TODO: CHANGE IT TO REAL PERCENTAGE LATER.
                rightWidget: Text(
                  "100%",
                  style: Styles.style14(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                leftWidget: SizedBox(
                    width: SizeConfig.screenWidth * 0.8,
                    height: 15,
                    child: const LinearProgressIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      value: 0.1,
                      minHeight: 8,
                    )),
              );
            },
          );
        }
        return const CustomLoadingWidget();
      },
    );
  }
}
