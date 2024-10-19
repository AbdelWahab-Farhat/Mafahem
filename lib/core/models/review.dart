class Review {
  final int id;
  final int userId;
  final int courseId;
  final String review;
  final DateTime createdAt;
  final DateTime updatedAt;

  Review({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create a Review object from JSON
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['user_id'],
      courseId: json['course_id'],
      review: json['review'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert a Review object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'course_id': courseId,
      'review': review,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
