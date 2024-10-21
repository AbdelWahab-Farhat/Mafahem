import 'dart:developer';

import 'package:Mafaheem/core/models/category.dart';
import 'package:Mafaheem/features/category/data/get_categories_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'category_picker_state.dart';

class CategoryPickerCubit extends Cubit<CategoryPickerState> {
   Map<Category, bool> categoriesPicked = {};

  CategoryPickerCubit() : super(CategoryPickerLoading()){
    getCategories();
  }

  Future<void> getCategories() async {
    var result =
        await GetCategoriesService(dio: GetIt.I<Dio>()).fetchCategories();
    result.fold(
      (l) => emit(CategoryPickerFailure(errMessage: l.message)),
      (categories) {
        categoriesPicked.addEntries(
          categories.map((category) => MapEntry(category, false)),
        );
        emit(CategoryPickerSuccess());
      },
    );
  }

  void onPickCategory(bool selectedCategory, Category category) {
    categoriesPicked[category] = selectedCategory;
    emit(CategoryPickerSuccess());
  }
}
