import 'package:Basera/core/models/learn_path.dart';
import 'package:Basera/core/widgets/custom_error_widget.dart';
import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:Basera/features/learning_path/manager/learn_path_cubit/learn_path_cubit.dart';
import 'package:Basera/features/learning_path/views/widgets/learning_path_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LearningPathViewBody extends StatefulWidget {
  const LearningPathViewBody({super.key});

  @override
  State<LearningPathViewBody> createState() => _LearningPathViewBodyState();
}

class _LearningPathViewBodyState extends State<LearningPathViewBody> {
  @override
  void initState() {
    context.read<LearnPathCubit>().fetchLearnPaths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var learnPathCubit = context.read<LearnPathCubit>();
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<LearnPathCubit, LearnPathState>(
        builder: (context, state) {
          List<LearnPath> learnPaths = learnPathCubit.learnPaths;
          if (state is LearnPathFailure) {
            return CustomErrorWidget(text: state.errMessage,);
          }
          else if (state is LearnPathSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              itemCount: learnPaths.length,
              itemBuilder: (context, index) {
                return LearningPathItem(learnPath: learnPaths[index],);
              },
            );
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}




