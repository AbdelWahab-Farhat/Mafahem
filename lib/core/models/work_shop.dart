import 'package:Mafaheem/core/models/category.dart';

class WorkShop {
  final int id;
  final int instructorId;
  final String title;
  final String description;
  final String date;
  final String time;
  final String? image;
  final int capacity;
  final String price;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? seatsLeft;
  final List<Category> categories;

  WorkShop({
    required this.id,
    required this.instructorId,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.capacity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
    required this.seatsLeft,
    this.latitude,
    this.longitude,
    this.image,
  });

  factory WorkShop.fromJson(Map<String, dynamic> json) {
    return WorkShop(
      id: json['id'],
      instructorId: json['instructor_id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      capacity: json['capacity'],
      price: json['price'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      categories: json['categories'] != null
          ? List<Category>.from(
              json['categories'].map((category) => Category.fromJson(category)))
          : [],
      seatsLeft: json['seats_left'] ?? 0,
      image: json['image'] ??
          'https://images.pexels.com/photos/3183197/pexels-photo-3183197.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    );
  }

  // Method to convert a Workshop instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'instructor_id': instructorId,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'capacity': capacity,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'categories': categories,
      'seats_left': seatsLeft,
      'image': image
    };
  }
}
