import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  String ratingMessage = "ممتاز";
  double userRating = 5;
  TextEditingController commentController = TextEditingController();
  ReviewCubit() : super(ReviewInitial());


  void onRatingUpdate(double rating) {
    userRating = rating;
    if (rating == 1) {
      ratingMessage = "سيء";
    } else if (rating == 2) {
      ratingMessage = "مقبول";
    } else if (rating == 3) {
      ratingMessage = "جيد";
    } else if (rating == 4) {
      ratingMessage = "جيد جدا";
    } else {
      ratingMessage = "ممتاز";
    }
    emit(ReviewInitial());
  }

  void postReview(BuildContext context) {
    if (commentController.text.trim().isNotEmpty) {
      emit(ReviewLoading());

    }
    else {
      showCustomSnackBar(context, 'Please Provide us with comment Of You, Thank you');
    }

  }
}
