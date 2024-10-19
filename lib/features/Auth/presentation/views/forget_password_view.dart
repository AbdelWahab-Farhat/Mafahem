import 'package:Mafaheem/features/Auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: const ForgetPasswordViewBody(),
    );
  }
}
