import 'dart:developer';

import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/models/rater.dart';

class CalUserRateService {
   static int _numberOfUserByStars(Course course, starNumber) {
    int numberOfUser = 0;
    List<Rater> raters = course.raters ?? [];
    if (raters.isNotEmpty) {
      for (var rater in raters) {
        if (starNumber == rater.pivot.rating) {
          numberOfUser++;
        }
      }
    }
    return numberOfUser;
  }

  static double presentUserRateByStars(Course course, starNumber) {
    int numberOfUser = _numberOfUserByStars(course, starNumber);
    log(course.raters.toString());
    if (course.raters!.isNotEmpty) {
      log('testing');
      return numberOfUser / course.raters!.length;
    }
    else {
      return 0;
    }
  }
}
