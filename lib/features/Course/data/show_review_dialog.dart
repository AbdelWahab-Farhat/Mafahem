

import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/core/widgets/custom_textfield.dart';
import 'package:Basera/features/Course/presentation/manager/review_cubit/review_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void showReviewDialog(BuildContext context, Course course) {
  ReviewCubit reviewCubit = context.read<ReviewCubit>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider<ReviewCubit>.value(
        value: reviewCubit,
        child: AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text("تقييم الكورس",
              textAlign: TextAlign.center,
              style: Styles.style20(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              )),
          content: BlocListener<ReviewCubit, ReviewState>(
            listener: (context, state) {
              if (state is ReviewSuccess) {
                showCustomSnackBar(context, state.message);
                Navigator.pop(context);
              }
              if (state is ReviewFailure) {
                showCustomSnackBar(context, state.errMessage);
              }
            },
            child: BlocBuilder<ReviewCubit, ReviewState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RatingBar.builder(
                      initialRating: reviewCubit.userRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: reviewCubit.onRatingUpdate,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reviewCubit.ratingMessage,
                      style: Styles.style18(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: reviewCubit.commentController,
                      maxLines: 5,
                    ),
                  ],
                );
              },
            ),
          ),
          actions: [
            CustomFilledButton(
              title: 'أرسال',
              onPressed: () => reviewCubit.postReview(context, course),
              textColor: Theme.of(context).colorScheme.onPrimary,
              radius: 36,
            ),
          ],
        ),
      );
    },
  );
}
