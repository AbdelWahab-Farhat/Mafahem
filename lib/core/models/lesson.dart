




import 'package:Basera/core/models/lecture.dart';

class Lesson {
  final int id;
  final String title;
  final String content;
  final List<Lecture>? lectures; // Note: Corrected to "lectures"

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.lectures,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      lectures:json['lesctures'] == null ? [] : (json['lesctures'] as List<dynamic>)
          .map((lectureJson) => Lecture.fromJson(lectureJson))
          .toList(),
    );
  }
}



