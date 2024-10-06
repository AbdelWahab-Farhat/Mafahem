import 'package:Basera/features/on_boarding/presentation/views/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';

class CustomPageItem extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  const CustomPageItem({
    super.key, required this.title, required this.content, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Column(
        children: [
          const SizedBox(height: 82,),
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
           const SizedBox(height: 64,),
           OnBoardingContent(
            title: title,
            content:content,
          ),
        ],
      ),
    );
  }
}
