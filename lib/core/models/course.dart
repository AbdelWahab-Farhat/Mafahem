import 'package:Mafaheem/core/models/category.dart';
import 'package:Mafaheem/core/models/lesson.dart';
import 'package:Mafaheem/core/models/rater.dart';
import 'package:Mafaheem/core/models/review.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final int? subscriptionPlanId;
  final String instructorName;
  final int instructorId;
  final String image;
  final String level;
  final String price;
  final int duration;
  final String? whatYouWillLearn;
  final String? requirements;
  final String? createdAt;
  final String? updatedAt;
  final double? averageRating;
  final List<Category>? categories;
  final int enrollmentCount;
  final List<Rater>? raters;
  final List<Lesson>? lessons;
  final List<Review>? reviews;
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
    required this.instructorName,
    this.averageRating,
    required this.enrollmentCount,
    this.raters,
    this.lessons,
    this.reviews
    // required this.subscriptionPlan,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      subscriptionPlanId: json['subscription_plan_id'],
      instructorId: json['instructor_id'],
      image: json['image'] ?? 'URL',
      level: json['level'],
      price: json['price'],
      duration: json['duration'],
      whatYouWillLearn: json['what_you_will_learn'],
      requirements: json['requirements'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categories: json['category'] == null ? [] : (json['category'] as List).map((cat) => Category.fromJson(cat))
              .toList(),
      instructorName: json['instructor_name'] ?? '',
      averageRating: json['average_rating'] == null ? 0 : double.tryParse(json['average_rating'].toString()),
      enrollmentCount: json['enrollment_count'] ?? 0,
      raters: json['raters'] == null
          ? []
          : (json['raters'] as List)
              .map((rater) => Rater.fromJson(rater))
              .toList(),
      lessons: json['lessons'] == null
          ? []
          : (json['lessons'] as List)
              .map((lesson) => Lesson.fromJson(lesson))
              .toList(),
      reviews: json['reviews'] == null ? [] : (json['reviews'] as List).map((review) => Review.fromJson(review)).toList(),
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
      'instructor_name': instructorName,
      'category': categories?.map((cat) => cat.toJson()).toList(),
    };
  }
}
