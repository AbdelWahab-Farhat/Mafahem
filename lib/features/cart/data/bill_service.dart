import 'package:Mafaheem/core/models/course.dart';

class BillService{
    static int numberOfCourses(List<Course> courses){
      return courses.length;
    }

    static double totalPrice(List<Course> courses){
      double total = 0;
      for (var course in courses) {
        total += double.parse(course.price);
      }
      return total;
    }

    static double discountedPrice(double totalPrice , double couponDiscountPrice){
      return totalPrice - (totalPrice * (couponDiscountPrice / 100));
    }
}