import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/features/Course/presentation/views/widgets/about_course_text_icon.dart';
import 'package:Basera/features/Course/presentation/views/widgets/courseRating.dart';
import 'package:Basera/features/Course/presentation/views/widgets/mini_section.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AboutCourseTextIcon(
              title: '42 ساعة',
              icon: Icons.timer_outlined,
            ),
            const SizedBox(
              height: 16,
            ),
            const AboutCourseTextIcon(
              title: 'شهادة أكمال الجنس',
              icon: Icons.celebration_rounded,
            ),
            const SizedBox(
              height: 16,
            ),
            const AboutCourseTextIcon(
              title: 'للمبتدئين',
              icon: Icons.network_cell_outlined,
            ),
            const SizedBox(
              height: 24,
            ),
            const MiniSection(
              title: 'ماذا سوف تتعلم',
              content:
                  'برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. اقرأ المزيد.',
            ),
            const SizedBox(
              height: 16,
            ),
            const MiniSection(
              title: 'المتطلبات',
              content:
                  'برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. اقرأ المزيد.',
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
            const CourseRatings(
              percentageByStar: [1, 0.5, 0.1, 0.4, 0.3],
            ),
            const SizedBox(
              height: 16,
            ),
            const CommentWidget(),
            Divider(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
              thickness: 0.4,
            ),
            const CommentWidget(),
            const SizedBox(
              height: 24,
            ),
            CustomFilledButton(
              onPressed: () {},
              title: 'عرض المزيد',
              width: SizeConfig.screenWidth,
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18,
              radius: 8,
              height: 45,
            ),
            const SizedBox(
              height: 17,
            ),
            CustomFilledButton(
              onPressed: () {},
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

class CommentWidget extends StatelessWidget {
  // obj of course comment
  const CommentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'بكر بكر',
          style: Styles.style12(context).copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          '2024/9/2',
          style: Styles.style12(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            5,
            (index) => Icon(
              index < 3 ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16,
            ),
          ),
        ),
        const Text(
            'برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. اقرأ المزيد.'),
      ],
    );
  }
}
