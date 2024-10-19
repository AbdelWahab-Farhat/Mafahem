import 'package:Basera/core/models/category.dart';
import 'package:Basera/features/category/manager/category_courses_cubit/category_courses_cubit.dart';
import 'package:Basera/features/category/views/widgets/category_courses_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryCoursesView extends StatelessWidget {
  final Category category;

  const CategoryCoursesView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCoursesCubit(category),
      child: const CategoryCoursesViewBody(),
    );
  }
}
