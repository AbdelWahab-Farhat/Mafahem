class Instructor {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final String profilePhotoUrl;
  final String? image;
  final int coursesCount;
  final bool? instructor;
  final int numberOfStudents;

  Instructor({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.profilePhotoUrl,
    this.image,
    required this.coursesCount,
    this.instructor,
    required this.numberOfStudents,
  });

  // Factory constructor to create an Instructor instance from JSON
  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      profilePhotoUrl: json['profile_photo_url'],
      image: json['image'] ?? 'https://images.pexels.com/photos/2968948/pexels-photo-2968948.jpeg?auto=compress&cs=tinysrgb&w=600',
      coursesCount: json['courses_count'],
      instructor: json['instructor'],
      numberOfStudents: json['number_of_students'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'profile_photo_url': profilePhotoUrl,
      'image': image,
      'courses_count': coursesCount,
      'instructor': instructor,
      'number_of_students': numberOfStudents,
    };
  }
}
