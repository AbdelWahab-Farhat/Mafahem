import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/Course/presentation/manager/course_cubit/course_cubit.dart';
import 'package:Basera/features/Course/presentation/manager/filter_courses_cubit/filter_courses_cubit.dart';
import 'package:Basera/features/Course/presentation/views/about_section.dart';
import 'package:Basera/features/Course/presentation/views/lecture_section.dart';
import 'package:Basera/features/Course/presentation/views/similar_courses_section.dart';
import 'package:Basera/features/Course/presentation/views/widgets/add_to_cart_nav_bottom.dart';
import 'package:Basera/features/Course/presentation/views/widgets/header_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseViewBody extends StatefulWidget {
  final Course course;
  const CourseViewBody({super.key, required this.course});

  @override
  State<CourseViewBody> createState() => _CourseViewBodyState();
}

class _CourseViewBodyState extends State<CourseViewBody> {
  @override
  void initState() {
    context.read<CourseCubit>().checkCoursePurchase(widget.course.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar:  AddToCartNavBottom(course: widget.course,),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: SizeConfig.screenHeight * 0.27,
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl: widget.course.image,
                    fit: BoxFit.cover,
                    // TODO ADD PLACE HOLDER LATER
                  ),
                ),
              ),
            ];
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderSection(course: widget.course),
                    const SizedBox(height: 20),
                    TabBar(
                      tabs: const [
                        Tab(text: "تفاصيل الكورس"),
                        Tab(text: "محتوى الكورس"),
                        Tab(text: "كورسات مشابهة"),
                      ],
                      labelStyle: Styles.style12(context).copyWith(fontSize: 13),
                      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                      indicatorWeight: 2,
                      labelPadding: EdgeInsets.zero,
                      dividerHeight: 0.2,
                      dividerColor: Theme.of(context).colorScheme.secondary,
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AboutSection(course: widget.course),
                    LectureSection(course: widget.course,),
                     SimilarCoursesSection(course: widget.course,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
