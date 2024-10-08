import 'package:Basera/features/category/views/widgets/category_item.dart';
import 'package:Basera/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10), // 2
          itemBuilder: (context, index) {
            return const CategoryItem();
          },
        ));
  }
}
