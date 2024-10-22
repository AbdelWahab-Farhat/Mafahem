import 'package:Mafaheem/core/models/road_map.dart';

class CalculateRoadMapService {

  static double calculateRoadMapFullPrice(RoadMap roadMap) {
    double totalPrice = 0;
      for (var course in roadMap.courses) {
        totalPrice += double.parse(course.price);
    }
    double discount  = totalPrice * 0.2;

      return totalPrice - discount;
  }
}