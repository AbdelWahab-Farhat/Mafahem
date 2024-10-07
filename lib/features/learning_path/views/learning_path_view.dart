import 'package:Basera/features/learning_path/manager/learn_path_cubit/learn_path_cubit.dart';
import 'package:Basera/features/learning_path/views/widgets/learning_path_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningPathView extends StatelessWidget {
  const LearningPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearnPathCubit(),
      child: const LearningPathViewBody(),
    );
  }
}
