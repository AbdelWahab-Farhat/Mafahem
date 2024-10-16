class Coupon {
  final int id;
  final String code;
  final String discountPercentage;
  final int usageLimit;
  final int usageCount;
  final DateTime expiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Coupon({
    required this.id,
    required this.code,
    required this.discountPercentage,
    required this.usageLimit,
    required this.usageCount,
    required this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json['id'],
      code: json['code'],
      discountPercentage: json['discount_percentage'],
      usageLimit: json['usage_limit'],
      usageCount: json['usage_count'],
      expiresAt: DateTime.parse(json['expires_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'discount_percentage': discountPercentage,
      'usage_limit': usageLimit,
      'usage_count': usageCount,
      'expires_at': expiresAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
