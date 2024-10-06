class User {
  User({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  final bool? status;
  final String? message;
  final Data? data;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      status: json["status"] is bool
          ? json["status"]
          : json["status"] == "true",
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      token: json["token"],
    );
  }


  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "token": token,
  };

}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.twoFactorConfirmedAt,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic twoFactorConfirmedAt;
  final dynamic currentTeamId;
  final dynamic profilePhotoPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? profilePhotoUrl;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      twoFactorConfirmedAt: json["two_factor_confirmed_at"],
      currentTeamId: json["current_team_id"],
      profilePhotoPath: json["profile_photo_path"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      profilePhotoUrl: json["profile_photo_url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "two_factor_confirmed_at": twoFactorConfirmedAt,
    "current_team_id": currentTeamId,
    "profile_photo_path": profilePhotoPath,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "profile_photo_url": profilePhotoUrl,
  };

}
