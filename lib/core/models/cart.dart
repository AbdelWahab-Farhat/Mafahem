import 'package:Basera/core/models/course.dart';

class Cart {
  int? id;
  int? userId;
  List<Course>? courses;
  Cart({
    this.id,
    this.userId,
    this.courses,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'courses': courses?.map((e) => e.toJson()).toList(),
    };
  }
}
