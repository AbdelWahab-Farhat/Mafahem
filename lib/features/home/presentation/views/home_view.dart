import 'package:Mafaheem/features/home/presentation/manager/most_ordered_courses_cubit/most_ordered_courses_cubit.dart';
import 'package:Mafaheem/features/home/presentation/manager/promo_categories_cubit/promo_categories_cubit.dart';
import 'package:Mafaheem/features/home/presentation/manager/promo_courses_cubit/promo_courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PromoCoursesCubit(),
        ),
        BlocProvider(
          create: (context) => PromoCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => MostOrderedCoursesCubit(),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
