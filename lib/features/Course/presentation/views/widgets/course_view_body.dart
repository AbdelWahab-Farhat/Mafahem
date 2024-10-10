import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/Course/presentation/views/about_section.dart';
import 'package:Basera/features/Course/presentation/views/lecture_section.dart';
import 'package:Basera/features/Course/presentation/views/similar_courses_section.dart';
import 'package:Basera/features/Course/presentation/views/widgets/add_to_cart_nav_bottom.dart';
import 'package:Basera/features/Course/presentation/views/widgets/header_section.dart';
import 'package:flutter/material.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

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
                child: Image.asset(
                  'lib/assets/images/course-image.png',
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSection(),
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
                    unselectedLabelColor:
                    Theme.of(context).colorScheme.onSurface, // Inactive tab color
                    indicatorColor: Theme.of(context).colorScheme.primary, // Tab indicator color
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Tab 1 content with scroll
                    AboutSection(),
                    // Tab 2 content with scroll
                    LectureSection(),
                    // Tab 3 content with scroll
                    SimilarCoursesSection()
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
