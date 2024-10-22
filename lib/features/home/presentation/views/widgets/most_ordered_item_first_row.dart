import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_outline_button.dart';
import 'package:Mafaheem/features/Course/presentation/views/course_view.dart';
import 'package:flutter/material.dart';

class MostOrderedItemFirstRow extends StatelessWidget {
  final Course course;
  const MostOrderedItemFirstRow({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.5,
            child: Text(
              course.title,
              style: Styles.style16(context)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8,),
          CustomOutlinedButton(
            onPressed: ()=> push(context, CourseView(course: course)),
            title: 'أشتري',
            width: 100,
            height: 45,
            radius: 32,
            borderColor: Theme.of(context).colorScheme.primary,
            fontSize: 12,
            textColor: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
