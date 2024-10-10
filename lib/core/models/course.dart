import 'package:Basera/core/models/category.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final int subscriptionPlanId;
  final int instructorId;
  final String image;
  final String level;
  final String price;
  final int duration;
  final String? whatYouWillLearn;
  final String? requirements;
  final String? createdAt;
  final String? updatedAt;
  final List<Category>? categories;
  // final SubscriptionPlan subscriptionPlan;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.subscriptionPlanId,
    required this.instructorId,
    required this.image,
    required this.level,
    required this.price,
    required this.duration,
    this.whatYouWillLearn,
    this.requirements,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
    // required this.subscriptionPlan,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      subscriptionPlanId: json['subscription_plan_id'],
      instructorId: json['instructor_id'],
      image: json['image'],
      level: json['level'],
      price: json['price'],
      duration: json['duration'],
      whatYouWillLearn: json['what_you_will_learn'],
      requirements: json['requirements'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categories: json['categories'] == null ? [] : (json['categories'] as List).map((cat) => Category.fromJson(cat)).toList(),
      // subscriptionPlan: SubscriptionPlan.fromJson(json['subscription_plan']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'subscription_plan_id': subscriptionPlanId,
      'instructor_id': instructorId,
      'image': image,
      'level': level,
      'price': price,
      'duration': duration,
      'what_you_will_learn': whatYouWillLearn,
      'requirements': requirements,
      'created_at': createdAt,
      'updated_at': updatedAt,
      // 'pivot': pivot.toJson(),
      'categories': categories?.map((cat) => cat.toJson()).toList(),
      // 'subscription_plan': subscriptionPlan.toJson(),
    };
  }
}
