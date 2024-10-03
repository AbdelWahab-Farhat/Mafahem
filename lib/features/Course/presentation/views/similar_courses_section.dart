import 'package:Basera/features/Course/presentation/views/widgets/similar_courses_item.dart';
import 'package:flutter/material.dart';

class SimilarCoursesSection extends StatelessWidget {
  const SimilarCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: SimilarCoursesItem(),
      ),
    );
  }
}

