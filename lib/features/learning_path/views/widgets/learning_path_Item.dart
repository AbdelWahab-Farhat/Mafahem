import 'dart:developer';
import 'package:Basera/core/models/learn_path.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/features/learning_path/data/calculate_learn_path_service.dart';
import 'package:Basera/features/learning_path/manager/learn_path_cubit/learn_path_cubit.dart';
import 'package:Basera/features/learning_path/views/widgets/learning_path_details.dart';
import 'package:Basera/features/work_shops/presentation/views/widgets/overlay.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningPathItem extends StatelessWidget {
  final LearnPath learnPath;

  const LearningPathItem({
    super.key,
    required this.learnPath,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnPathCubit, LearnPathState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          width: SizeConfig.screenWidth,
          height: 200,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: learnPath.courses[0].image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) {
                  log('Error loading image: $error');
                  return const Icon(Icons.error);
                },
                fit: BoxFit.cover,
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
              ),
              const OverlayLayerWidget(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LearningPathDetails(
                  title: learnPath.title,
                  rating: 4.3,
                  subtitle: learnPath.description,
                  price: "${CalculateLearnPathService.calculateLearnPath(learnPath).toStringAsFixed(1)} د.ل",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
