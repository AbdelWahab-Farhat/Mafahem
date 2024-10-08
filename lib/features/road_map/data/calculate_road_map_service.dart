import 'package:Basera/core/models/road_map.dart';

class CalculateRoadMapService {

  static double calculateLearnPath(RoadMap roadMap) {
    double totalPrice = 0;
      for (var course in roadMap.courses) {
        totalPrice += double.parse(course.price);
    }
    double discount  = totalPrice * 0.2;

      return totalPrice - discount;
  }
}