import 'package:Basera/core/models/course.dart';

class RoadMap {
  final int id;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;
  final double discountedPrice;
  final List<Course> courses;

  RoadMap({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.discountedPrice,
    required this.courses,
  });

  factory RoadMap.fromJson(Map<String, dynamic> json) {
    return RoadMap(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      discountedPrice: json['discounted_price'].toDouble(),
      courses: (json['courses'] as List).map((course) => Course.fromJson(course)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'discounted_price': discountedPrice,
      'courses': courses.map((course) => course.toJson()).toList(),
    };
  }
}


class Pivot {
  final int? roadMapId;
  final int? courseId;

  Pivot({
    required this.roadMapId,
    required this.courseId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      roadMapId: json['road_map_id'],
      courseId: json['course_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'road_map_id': roadMapId,
      'course_id': courseId,
    };
  }
}


