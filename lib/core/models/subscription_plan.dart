class SubscriptionPlan {
  final int id;
  final String name;
  final String price;
  final int duration;
  final String createdAt;
  final String updatedAt;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      duration: json['duration'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'duration': duration,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
