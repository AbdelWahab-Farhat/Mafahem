import 'package:Basera/features/root/presentation/manager/navigate_cubit/navigate_cubit.dart';
import 'package:Basera/features/root/presentation/views/widgets/root_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigateCubit(),
      child: const RootViewBody(),
    );
  }
}
