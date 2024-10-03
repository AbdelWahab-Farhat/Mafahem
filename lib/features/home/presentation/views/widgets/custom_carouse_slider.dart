import 'package:Basera/core/utility/helper.dart';
import 'package:Basera/features/Course/presentation/views/course_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouseSlider extends StatelessWidget {
  const CustomCarouseSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 159.75,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
      items: [
        GestureDetector(
          onTap: () => push(context, const CourseView()),
          child: Stack(
            children: [
              Container(
                height: 159.75,
                width: 330,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 159.75,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
        // You can add more items similarly...
      ],
    );
  }
}
