import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/Course/presentation/views/about_section.dart';
import 'package:Basera/features/Course/presentation/views/lecture_section.dart';
import 'package:Basera/features/Course/presentation/views/similar_courses_section.dart';
import 'package:Basera/features/Course/presentation/views/widgets/add_to_cart_nav_bottom.dart';
import 'package:Basera/features/Course/presentation/views/widgets/header_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CourseViewBody extends StatelessWidget {
  final Course course;
  const CourseViewBody({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: const AddToCartNavBottom(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.27,
                child: CachedNetworkImage(imageUrl: course.image,fit: BoxFit.fitWidth,)
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   HeaderSection(course:course),
                  const SizedBox(height: 20),
                  TabBar(
                    tabs: const [
                      Tab(text: "تفاصيل الكورس"),
                      Tab(text: "محتوى الكورس"),
                      Tab(text: "كورسات مشابهة"),
                    ],
                    labelStyle: Styles.style12(context).copyWith(fontSize: 13),
                    splashFactory:
                        InkSparkle.constantTurbulenceSeedSplashFactory,
                    indicatorWeight: 2,
                    labelPadding: EdgeInsets.zero,
                    dividerHeight: 0.2,
                    dividerColor: Theme.of(context).colorScheme.secondary,
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor: Theme.of(context)
                        .colorScheme
                        .onSurface, // Inactive tab color
                    indicatorColor: Theme.of(context)
                        .colorScheme
                        .primary, // Tab indicator color
                  ),
                ],
              ),
            ),
             Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Tab 1 content with scroll
                    AboutSection(course: course,),
                    // Tab 2 content with scroll
                    const LectureSection(),
                    // Tab 3 content with scroll
                    const SimilarCoursesSection()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
