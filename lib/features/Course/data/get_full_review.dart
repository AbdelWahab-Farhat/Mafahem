import 'package:Mafaheem/core/models/rater.dart';
import 'package:Mafaheem/core/models/review.dart';


// NO NEED IT FOR NOW
class GetFullReview {
  static Map<Rater, Review> getUserFullReview(
      List<Review> reviews, List<Rater> raters) {
    {
      Map<Rater, Review> map = {};
      for (var review in reviews) {
        for (var rater in raters) {
          if (rater.pivot.userId == review.userId) {
            map[rater] = review;
          }
        }
      }
      return map;
    }
  }
}
