import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/features/Course/presentation/views/course_view.dart';
import 'package:Mafaheem/features/home/presentation/manager/promo_courses_cubit/promo_courses_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CustomCarouseSlider extends StatelessWidget {
  const CustomCarouseSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoCoursesCubit, PromoCoursesState>(
      builder: (context, state) {
        if (state is PromoCoursesLoading) {
          // Shimmer effect resembling the course card design
          return CarouselSlider(
            options: CarouselOptions(
              height: 159.75,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
            items: List.generate(
              3, // Number of shimmer items to show
              (index) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Stack(
                  children: [
                    Container(
                      height: 159.75,
                      width: 330,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[300], // Simulating the image space
                      ),
                    ),
                    Container(
                      height: 159.75,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:
                            Colors.black.withOpacity(0.1), // The overlay effect
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is PromoCoursesSuccess) {
          // Actual carousel with course data
          return CarouselSlider(
            options: CarouselOptions(
              height: 159.75,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
            items: state.courses.map((course) {
              return GestureDetector(
                onTap: () => push(context,CourseView(course: course)),
                child: Stack(
                  children: [
                    Container(
                      height: 159.75,
                      width: 330,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CachedNetworkImage(imageUrl: course.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>  Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Stack(
                            children: [
                              Container(
                                height: 159.75,
                                width: 330,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[300], // Simulating the image space
                                ),
                              ),
                              Container(
                                height: 159.75,
                                width: 330,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color:
                                  Colors.black.withOpacity(0.1), // The overlay effect
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 159.75,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        } else {
          return const Center(child: Text('No promo courses available.'));
        }
      },
    );
  }
}
