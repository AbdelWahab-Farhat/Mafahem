import 'package:Basera/features/category/manager/category_cubit/category_cubit.dart';
import 'package:Basera/features/category/views/widgets/category_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>CategoryCubit(),
      child: const CategoryViewBody(),
    );
  }
}
