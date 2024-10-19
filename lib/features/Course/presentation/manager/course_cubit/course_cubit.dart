import 'package:Basera/core/enums/course_status.dart';
import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/features/Course/data/add_to_cart_service.dart';
import 'package:Basera/features/Course/data/property_service.dart';
import 'package:Basera/features/cart/presentation/views/cart_view.dart';
import 'package:Basera/features/profile/presentation/views/profile_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  String buttonText = 'اضافة للسلة';
  CourseStatus courseStatus = CourseStatus.notInCart;
  Function(BuildContext context)? onButtonPressed;

  CourseCubit() : super(CourseInitial());

  Future<void> checkCoursePurchase(String courseId) async {
    emit(CourseLoading());
    var result = await PropertyService.checkProperty(courseId);  // Ensure to call the instance of PropertyService
    result.fold(
          (l) {
        emit(CourseFailure(message: l.message));
      },
          (r) {
        switch (r) {
          case CourseStatus.inCart:
            onButtonPressed = (BuildContext context) {
              pushReplacement(context, const CartView());
            };
            buttonText = "تم الاضافة للسلة";
            courseStatus = CourseStatus.inCart;
            emit(CourseInCart());
            break;

          case CourseStatus.purchased:
            onButtonPressed = (BuildContext context) {
              pushReplacement(context, const ProfileView());
            };
            buttonText = "اذهب لكورساتي";
            courseStatus = CourseStatus.purchased;
            emit(CourseOwned());
            break;

          case CourseStatus.notInCart:
            onButtonPressed = (BuildContext context) async {
              var result = await AddToCartService.addToCart(courseId);
              result.fold(
                    (l) {
                  emit(CourseFailure(message: l.message));
                },
                    (r) {
                  showCustomSnackBar(context, 'تمت الأضافة للسلة');
                  pop(context);
                  buttonText = "تم الاضافة للسلة";
                  emit(CourseInCart());
                },
              );
            };
            buttonText = "اضافة للسلة";
            emit(CourseInitial());
            break;
        }
      },
    );
  }
}
