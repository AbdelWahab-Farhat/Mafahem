import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/features/home/presentation/manager/most_ordered_courses_cubit/most_ordered_courses_cubit.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/most_ordered_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MostOrderedListView extends StatelessWidget {
  const MostOrderedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<MostOrderedCoursesCubit, MostOrderedCoursesState>(
            builder: (context, state) {
              if (state is MostOrderedCoursesFailure) {
                return CustomErrorWidget(text: state.errMessage);
              } else if (state is MostOrderedCoursesSuccess) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.courses.length,
                  padding: const EdgeInsets.only(right: 20, top: 16),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: constraints.maxWidth * 0.9,
                      child: MostOrderedItem(course: state.courses[index]), // Passing the course data
                    );
                  },
                );
              } else {
                // Shimmer loading effect
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8, // Placeholder count for shimmer
                  padding: const EdgeInsets.only(right: 20, top: 16),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: constraints.maxWidth * 0.9,
                        margin: const EdgeInsets.only(left: 16, bottom: 32),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth * 0.9,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.grey[300], // Placeholder for subtitle
                                borderRadius: BorderRadius.circular(16),
                              ),                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: SizeConfig.screenWidth * 0.6,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey[300], // Placeholder for subtitle
                                borderRadius: BorderRadius.circular(16),
                              ),                            ),
                            const SizedBox(height: 16,),
                            Container(
                              width: SizeConfig.screenWidth * 0.5,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.grey[300], // Placeholder for subtitle
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: SizeConfig.screenWidth * 0.4,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.grey[300], // Placeholder for subtitle
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
