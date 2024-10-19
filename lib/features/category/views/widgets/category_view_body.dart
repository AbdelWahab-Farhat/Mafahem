import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/category/manager/category_cubit/category_cubit.dart';
import 'package:Mafaheem/features/category/views/widgets/category_item.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key});

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override
  void initState() {
    context.read<CategoryCubit>().fetchCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            var categoryCubit = context.read<CategoryCubit>();
            if (state is CategoryFailure) {
              return CustomErrorWidget(text: state.errMessage,);
            }
             if (state is CategorySuccess) {
              return GridView.builder(
                itemCount: categoryCubit.categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10), // 2
                itemBuilder: (context, index) {
                  var categories = categoryCubit.categories;
                  return  CategoryItem(category: categories[index],);
                },
              );
            }
            else {
              return const CustomLoadingWidget();
            }
          },
        ));
  }
}
