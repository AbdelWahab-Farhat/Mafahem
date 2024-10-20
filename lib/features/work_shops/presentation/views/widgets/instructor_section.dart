import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/core/utility/functions/ui_functions.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/Instructor_cubit/instructor_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class InstructorSection extends StatelessWidget {
  final WorkShop workShop;
  const InstructorSection({super.key, required this.workShop});

  @override
  Widget build(BuildContext context) {
    // TODO : LET HIM FIX THE API OF INSSTROTR GET BY ID
    var instructorCubit = context.read<InstructorCubit>();
    return BlocListener<InstructorCubit, InstructorState>(
      listener: (context, state) {
       if (state is InstructorFailure) {
         showCustomSnackBar(context, state.errMessage);
       }
      },
      child: BlocBuilder<InstructorCubit, InstructorState>(
        builder: (context, state) {
          if (state is InstructorSuccess) {
            return Row(
              children: [
                 CircleAvatar(
                    radius: 24,
                    backgroundImage: CachedNetworkImageProvider(instructorCubit.instructor.image!)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instructorCubit.instructor.name,
                      style: Styles.style16(context),
                    ),
                    Text(
                      'مدرب',
                      style: Styles.style14(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 150,
                        child: Text(
                          "المقاعد: ${workShop.capacity} أشخاص",
                          style: Styles.style16(context),
                        )),
                    // TODO LATER CHANGE IT TO CHAIRS LEFT
                    SizedBox(
                        width: 150,
                        child: Text(
                          'المتبقي : ${workShop.capacity} أشخاص',
                          style: Styles.style16(context),
                        )),
                  ],
                )
              ],
            );
          } else if (state is InstructorFailure) {
            return const SizedBox();
          }
          else {
            return  Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                children: [
                  // Loading placeholder for CircleAvatar
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Loading placeholder for name
                      Container(
                        width: 120,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Loading placeholder for role (e.g., "مالك شركة")
                      Container(
                        width: 100, // Adjust the width to match the role text
                        height: 14, // Height of the role text
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Loading placeholder for seats text
                      Container(
                        width: 150,
                        height: 16, // Height of the seats text
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),                      ),
                      const SizedBox(height: 8),
                      // Loading placeholder for remaining seats text
                      Container(
                        width: 150,
                        height: 16, // Height of the remaining seats text
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
