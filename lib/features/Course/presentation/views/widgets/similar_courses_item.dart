import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/Course/presentation/views/widgets/rate_widget.dart';
import 'package:flutter/material.dart';

class SimilarCoursesItem extends StatelessWidget {
  const SimilarCoursesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start  ,
          children: [
            Text('مقدمة في علوم الحاسوب',style: Styles.style16(context).copyWith(fontWeight: FontWeight.w600),),
            const SizedBox(height: 4,),
            const RateWidget(),
            Text('10000 طالب',style: Styles.style16(context),),
          ],
        ),
        Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            width: 85,
            height: 85,
            child: Image.asset('lib/assets/images/course-image.png',fit: BoxFit.cover,)),
      ],
    );
  }
}
