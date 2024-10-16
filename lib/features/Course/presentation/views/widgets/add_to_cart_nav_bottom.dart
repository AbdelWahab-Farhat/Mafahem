import 'package:Basera/core/enums/course_status.dart';
import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/features/Course/data/add_to_cart_service.dart';
import 'package:Basera/features/Course/presentation/manager/course_cubit/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class AddToCartNavBottom extends StatelessWidget {
  final Course course;
  const AddToCartNavBottom({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    var courseCubit = context.read<CourseCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),  // Base color for shimmer
                highlightColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
                child: CustomFilledButton(
                  width: SizeConfig.screenWidth * 0.75,
                  title: 'جلب الحالة..',
                  onPressed: null,
                  radius: 0,
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            }
            return CustomFilledButton(
              width: SizeConfig.screenWidth * 0.75,
              title: courseCubit.buttonText,
              onPressed: () => courseCubit.onButtonPressed!(context) ?? "hello",
              radius: 0,
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.onPrimary,
            );
          },
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '100 د.ل',
              style: Styles.style18(context),
            ),
            // TODO: PRICE BEFORE DISCOUNT ( DO IT LATER)
            if (false)
              Text(
                '100 د.ل',
                style: Styles.style16(context)
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
          ],
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.01,
        ),
      ],
    );
  }
}
