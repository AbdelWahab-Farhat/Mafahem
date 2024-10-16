class Rater {
  final int id;
  final String name;
  final String email;
  final String profilePhotoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  Rater({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePhotoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Rater.fromJson(Map<String, dynamic> json) {
    return Rater(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profilePhotoUrl: json['profile_photo_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Pivot {
  final int courseId;
  final int userId;
  final double rating;
  final DateTime createdAt;
  final DateTime updatedAt;

  Pivot({
    required this.courseId,
    required this.userId,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      courseId: json['course_id'],
      userId: json['user_id'],
      rating: json['rating'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
