

import 'package:Basera/core/models/learn_path.dart';

class CalculateLearnPathService {

  static double calculateLearnPath(LearnPath path) {
    double totalPrice = 0;
      for (var course in path.courses) {
        totalPrice += double.parse(course.price);
    }
    double discount  = totalPrice * 0.2;

      return totalPrice - discount;
  }
}