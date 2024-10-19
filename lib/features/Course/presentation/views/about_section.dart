import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/Course/data/cal_user_rate_service.dart';
import 'package:Mafaheem/features/Course/data/show_review_dialog.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/about_course_text_icon.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/comment_rate_list_view.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/courseRating.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/mini_section.dart';
import 'package:flutter/material.dart';


class AboutSection extends StatelessWidget {
  final Course course;
  const AboutSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16 , left: 20,right: 20),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AboutCourseTextIcon(
              title: '${(course.duration / 60).toStringAsFixed(0)} ساعات',
              icon: Icons.timer_outlined,
            ),
            const SizedBox(
              height: 16,
            ),
            AboutCourseTextIcon(
              title: 'شهادة ${course.title}',
              icon: Icons.celebration_rounded,
            ),
            const SizedBox(
              height: 16,
            ),
            AboutCourseTextIcon(
              title: course.level,
              icon: Icons.network_cell_outlined,
            ),
            const SizedBox(
              height: 24,
            ),
            MiniSection(
              title: 'ماذا سوف تتعلم',
              content: course.description,
            ),
            const SizedBox(
              height: 16,
            ),
            MiniSection(
              title: 'المتطلبات',
              content: course.requirements ?? 'لا يوجد متطلبات لهذا الكورس ',
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'التقيم والمراجعات',
              style: Styles.style18(context),
            ),
            const SizedBox(
              height: 4,
            ),
            CourseRatings(
              percentageByStar: [
                CalUserRateService.presentUserRateByStars(course, 5),
                CalUserRateService.presentUserRateByStars(course, 4),
                CalUserRateService.presentUserRateByStars(course, 3),
                CalUserRateService.presentUserRateByStars(course, 2),
                CalUserRateService.presentUserRateByStars(course, 1),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CommentRateListView(course: course),
            const SizedBox(
              height: 24,
            ),
            course.raters!.isNotEmpty && course.raters!.length > 4
                ? CustomFilledButton(
                    onPressed: () {},
                    title: 'عرض المزيد',
                    width: SizeConfig.screenWidth,
                    color: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18,
                    radius: 8,
                    height: 45,
                  )
                : const SizedBox(),
            const SizedBox(
              height: 8,
            ),
            CustomFilledButton(
              onPressed: ()=> showReviewDialog(context, course),
              title: 'اضافة مراجعة',
              width: SizeConfig.screenWidth,
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18,
              radius: 8,
              height: 45,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

