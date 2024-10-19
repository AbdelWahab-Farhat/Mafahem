import 'package:Mafaheem/features/profile/presentation/manager/toggle_profile_views_cubit/toggle_profile_views_cubit.dart';
import 'package:Mafaheem/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:Mafaheem/features/profile/presentation/views/my_certification_view.dart';
import 'package:Mafaheem/features/profile/presentation/views/my_course_view.dart';
import 'package:Mafaheem/features/profile/presentation/views/my_learning_path_view.dart';
import 'package:Mafaheem/features/profile/presentation/views/widgets/profile_app_bar.dart';
import 'package:Mafaheem/features/profile/presentation/views/widgets/toggle_profile_views.dart';
import 'package:Mafaheem/features/profile/presentation/views/widgets/user_image_with_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    context.read<UserCubit>().getUserItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var toggleCubit = context.read<ToggleProfileViewsCubit>();
    return  Scaffold(
      appBar: const ProfileAppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 34),
            const UserImageWithName(),
            const SizedBox(height: 24),
            const ToggleProfileViews(),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: toggleCubit.controller,
                children: const [
                  MyCourseView(),
                  MyLearningPathView(),
                  MyCertificationView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
