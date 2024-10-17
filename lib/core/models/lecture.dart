class Lecture {
  final int id;
  final int lessonId; // Corrected to camelCase
  final String title;
  final String? videoUrl; // Nullable video URL
  final String? createdAt; // Nullable if necessary
  final String? updatedAt; // Nullable if necessary

  Lecture({
    required this.id,
    required this.lessonId,
    required this.title,
    this.videoUrl, // Nullable
    this.createdAt, // Nullable
    this.updatedAt, // Nullable
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      id: json['id'] as int,
      lessonId: json['lesson_id'] as int, // Adjusted to match JSON
      title: json['title'] as String,
      videoUrl: json['video_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
