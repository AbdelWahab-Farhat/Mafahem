class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? twoFactorConfirmedAt;
  final int? currentTeamId;
  final String? profilePhotoPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? image;
  final String? googleId;
  final String? facebookId;
  final String role;
  final String profilePhotoUrl;
  final bool? instructor;
  String? token;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    this.googleId,
    this.facebookId,
    required this.role,
    required this.profilePhotoUrl,
    this.instructor,
    this.token,
  });

  // Factory constructor to create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      twoFactorConfirmedAt: json['two_factor_confirmed_at'],
      currentTeamId: json['current_team_id'],
      profilePhotoPath: json['profile_photo_path'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      image: json['image'],
      googleId: json['google_id'],
      facebookId: json['facebook_id'],
      role: json['role'],
      profilePhotoUrl: json['profile_photo_url'],
      instructor: json['instructor'],
    );
  }

  // Method to convert a User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'two_factor_confirmed_at': twoFactorConfirmedAt,
      'current_team_id': currentTeamId,
      'profile_photo_path': profilePhotoPath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'image': image,
      'google_id': googleId,
      'facebook_id': facebookId,
      'role': role,
      'profile_photo_url': profilePhotoUrl,
      'instructor': instructor,
      'token': token
    };
  }
}
