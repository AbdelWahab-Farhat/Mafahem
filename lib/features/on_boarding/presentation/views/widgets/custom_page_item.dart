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
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox(height: 82,),
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 386,
          ),
           OnBoardingContent(
            title: title,
            content:content,
          ),
        ],
      ),
    );
  }
}
