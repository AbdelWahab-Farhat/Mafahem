import 'package:Basera/features/profile_edit/presentation/manager/edit_profile_cubit.dart';
import 'package:Basera/features/profile_edit/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: const EditProfileViewBody(),
    );
  }
}
