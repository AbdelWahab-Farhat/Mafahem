import 'package:Basera/features/profile/presentation/manager/toggle_profile_views_cubit/toggle_profile_views_cubit.dart';
import 'package:Basera/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleProfileViewsCubit(),
      child: const ProfileViewBody(),
    );
  }
}
