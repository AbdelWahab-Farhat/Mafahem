import 'package:Basera/core/models/course.dart';
import 'package:Basera/features/Course/presentation/manager/comment_cubit/comment_cubit.dart';
import 'package:Basera/features/Course/presentation/manager/course_cubit/course_cubit.dart';
import 'package:Basera/features/Course/presentation/manager/review_cubit/review_cubit.dart';
import 'package:Basera/features/Course/presentation/views/widgets/course_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseView extends StatelessWidget {
  final Course course;

  const CourseView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReviewCubit(),
        ),
        BlocProvider(
          create: (context) => CommentCubit(),
        ),
        BlocProvider(
          create: (context) => CourseCubit(),
        ),
      ],
      child: CourseViewBody(course: course,),
    );
  }
}
