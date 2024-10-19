import 'package:Mafaheem/features/profile/presentation/manager/toggle_profile_views_cubit/toggle_profile_views_cubit.dart';
import 'package:Mafaheem/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:Mafaheem/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToggleProfileViewsCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        ),
      ],
      child: const ProfileViewBody(),
    );
  }
}
