import 'package:Basera/core/enums/course_status.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/features/cart/data/get_user_cart_service.dart';
import 'package:Basera/features/profile/data/fetch_user_courses_service.dart';
import 'package:dartz/dartz.dart';

class PropertyService {
  static Future<Either<Failure, CourseStatus>> checkProperty(String courseID) async {
    CourseStatus value = CourseStatus.notInCart;

    // Check if the course is in the user's purchased courses
    var userCoursesResult = await FetchUserCoursesService.getUserCourses();
    final courseCheck = userCoursesResult.fold(
          (failure) => left(failure), // Return failure early if there's an issue
          (userCourses) {
        if (userCourses.any((course) => course.id.toString() == courseID)) {
          value = CourseStatus.purchased;
        }
        return right(value); // Return current status
      },
    );

    // If there was an error in fetching user courses, return it
    if (courseCheck.isLeft()) {
      return courseCheck as Either<Failure, CourseStatus>;
    }

    // Check if the course is in the user's cart
    var userCartResult = await GetUserCartService.getUserCart();
    final cartCheck = userCartResult.fold(
          (failure) => left(failure), // Return failure early if there's an issue
          (cart) {
        if (cart.courses!.any((course) => course.id.toString() == courseID)) {
          value = CourseStatus.inCart;
        }
        return right(value); // Return current status
      },
    );

    // If there was an error in fetching user cart, return it
    if (cartCheck.isLeft()) {
      return cartCheck as Either<Failure, CourseStatus>;
    }

    // Return final value (either purchased, in cart, or not in cart)
    return right(value);
  }
}


